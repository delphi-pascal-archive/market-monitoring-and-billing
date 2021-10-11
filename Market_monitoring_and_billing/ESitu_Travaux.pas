unit ESitu_Travaux;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TSitu_Travaux = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    Query1: TQuery;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Situ_Travaux: TSitu_Travaux;
  xval,xval1:string;
implementation

uses MODULE_TABLE, Menu,math;

{$R *.DFM}
{ ---------------------------------------------------------- }
function NbEnLettresInt(n: int64): string;
var d, n2 : int64;
    sflag : string;
const
  Chiffres : array[0..19] of string =
    ('' , 'un' , 'deux' , 'trois' , 'quatre' , 'cinq' , 'six' , 'sept' ,
    'huit' , 'neuf' , 'dix' , 'onze' , 'douze' , 'treize' ,
    'quatorze' , 'quinze' , 'seize' ,'dix-sept' , 'dix-huit' , 'dix-neuf');
  Dizaines : array[2..9] of string =
    ('vingt' , 'trente' , 'quarante' , 'cinquante' , 'soixante' , '' ,
    'quatre-vingt' , '');
  PuissancesMille : array[1..6] of string =
    ('mille', 'million', 'milliard', 'billion', 'billiard', 'trillion'); // etc...
begin
  CASE n of
    0..19:  result := Chiffres[n];  // fin
    20..69,80..89:
      if ((n mod 10 = 1) and (n<>81)) then
       result := Dizaines[n div 10] + ' et ' + NbEnLettresInt(n mod 10)
      else  // exception : on dit trente-et-un mais quatre-vingt un !
       result := Dizaines[n div 10] + ' ' + NbEnLettresInt(n mod 10);
    70..79,90..99:
      if (n = 71) then  // exception : 71 = 'soixante' et onze !
       result := Dizaines[n div 10 -1] + ' et ' + NbEnLettresInt(n mod 10 +10)
      else
       result := Dizaines[n div 10 -1] + ' ' + NbEnLettresInt(n mod 10 +10);
    100..999:
        if (n div 100 =1) then  // exception : un cent ne se dit pas !
          result := 'cent' + ' '+ NbEnLettresInt(n mod 100)
        else
        begin
          if (n mod 100)=0 then sflag := 's' else sflag := ''; // si pas reste !
         result := Chiffres[n div 100]+' '+'cent' +sflag+ ' '+ NbEnLettresInt(n mod 100);
        end;
    else
    begin
     // ex: 10^6 = 1M <=> exp (6 x ln(10) = 1M <=> 6 x ln(10) = ln (1M)
     //  <=> 6 = ln(1M) / ln(10) = Log10 (1M)
      d := trunc(log10(n)) div 3;   // arrondir puiss. 10
      n2 := trunc(power(10 , d * 3)); // vers groupe puissances de 1000 +proche
      if (trunc(log10(n))=3) and (trunc(n/1000)=1) then  // excep : un mille =bad !
        result := PuissancesMille[d] + ' ' + NbEnLettresInt(n mod n2)
      else
      begin
        if d=1 then sflag := '' else sflag := 's';  // s au pluriel sauf mille !
        result := NbEnLettresInt(n div n2) + ' ' + PuissancesMille[d]
          + sflag + ' ' + NbEnLettresInt(n mod n2)+'  DINARS';
      end;
    end;
  END; { case }
  //if result = '' then result := 'zero';
end;

{ ------------------------------------------------------------------ }
function NbEnLettres(value: Extended; removeDecimal: boolean = false): string;
// Fonction d'appel : en fait NbEnLettresInt = proc principale.
begin
  result := NbEnLettresInt(Trunc(Value));
  if not RemoveDecimal then
  if pos(',',xval)>0 then
    result := result + ' et ' +
      NbEnLettresInt(round(100 * frac(value)))+'  CENTIMES';
end;

procedure TSitu_Travaux.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var  XNUM:string;
     Xmont_ht,mont_marche,xmont_prec,xmont_cumule,tx_garentie,tx_forf,tx_appros,autre:real;
     xtotal4,xtotal1,xtotal2,xtaux1,xtaux2,xtaux3:real;
     total_ht,total_tva,xtaux11,xtaux12,xtaux13:real;
begin
 QRLabel2.Caption:=xnaffaire;
 Module1.TAFFAIRE.FindKey([xnaffaire]);
 QRLabel3.Caption:= Module1.TAFFAIRE.fieldbyname('objet').AsString;
 mont_marche:=Module1.TAFFAIRE.fieldbyname('mont_ttc').AsCurrency;
 QRLabel4.Caption:=formatfloat('## ### ### ###.00',mont_marche);
 //Avances
 tx_forf:=Module1.TAFFAIRE.fieldbyname('taux_forf').AsFloat;
 tx_appros:=Module1.TAFFAIRE.fieldbyname('taux_appros').AsFloat;
 tx_garentie:=Module1.TAFFAIRE.fieldbyname('taux_garentie').AsFloat;
 autre:=Module1.TAFFAIRE.fieldbyname('autre_taux').AsFloat;
 xnum:=Module1.TAFFAIRE.fieldbyname('num').AsString;
 Module1.Tclient.FindKey([xnum]);
 QRLabel1.Caption:=Module1.Tclient.fieldbyname('nom').AsString;
    //Filtrage sur ligne_attachement
    Module1.Ligne_attch.Filter:='naffaire=' + QUOTEDSTR(xnaffaire);
    Module1.Ligne_attch.FILTeRED:=true;
    xmont_prec:=0;
    xmont_cumule:=0;
    Module1.Ligne_attch.First;
    While not Module1.Ligne_attch.Eof do
     begin
      xmont_prec:=xmont_prec+Module1.Ligne_attch.fieldbyname('qte').AsCurrency*module1.Ligne_attch.fieldbyname('pu').AsCurrency;
      xmont_cumule:=xmont_cumule+Module1.Ligne_attch.fieldbyname('cumule').AsCurrency*module1.Ligne_attch.fieldbyname('pu').AsCurrency;
      Module1.Ligne_attch.next;
    end;
    xtaux1:=(mont_marche*tx_forf)/100;
    xtaux2:=(mont_marche*tx_appros)/100;
    xtaux3:=(mont_marche*autre)/100 ;
    xtaux11:=(mont_marche*tx_forf)/100 ;
    xtaux12:=(mont_marche*tx_appros)/100;
    xtaux13:=(mont_marche*autre)/100    ;
    xtotal1:=xmont_cumule+xtaux1+xtaux2+xtaux3;
    xtotal2:=xmont_prec+xtaux11+xtaux12+xtaux13;
    QRLabel5.Caption:=formatfloat('## ### ### ###.00',xmont_cumule);
    QRLabel6.Caption:=formatfloat('## ### ### ###.00',xtaux1);
    QRLabel7.Caption:=formatfloat('## ### ### ###.00',xtaux2);
    QRLabel8.Caption:=formatfloat('## ### ### ###.00',xtaux3);
    QRLabel9.Caption:=formatfloat('## ### ### ###.00',xmont_prec);
    QRLabel10.Caption:=formatfloat('## ### ### ###.00',xtaux11);
    QRLabel11.Caption:=formatfloat('## ### ### ###.00',xtaux12);
    QRLabel12.Caption:=formatfloat('## ### ### ###.00',xtaux13);
    QRLabel13.Caption:=formatfloat('## ### ### ###.00',xtotal1);
    QRLabel14.Caption:=formatfloat('## ### ### ###.00',xtotal2);
    Xmont_ht:=xtotal1-xtotal2; //montant ht
    QRLabel15.Caption:=formatfloat('## ### ### ###.00',xmont_ht);
    //REMBOURSEMENT
    QRLabel19.Caption:=formatfloat('## ### ### ###.00',(tx_forf*xmont_ht)/100);
    QRLabel20.Caption:=formatfloat('## ### ### ###.00',(tx_appros*xmont_ht)/100);
    QRLabel21.Caption:=formatfloat('## ### ### ###.00',(tx_garentie*xmont_ht)/100);
    QRLabel22.Caption:=formatfloat('## ### ### ###.00',(autre*xmont_ht)/100);
    // Total (4)
    xtotal4:=((tx_forf*xmont_ht)/100)+((tx_appros*xmont_ht)/100)+((tx_garentie*xmont_ht)/100)+((autre*xmont_ht)/100);
    QRLabel24.Caption:=formatfloat('## ### ### ###.00',xtotal4);
    Module1.Ligne_attch.FILTeRED:=false;
    //Montant TTC
    total_ht:=xmont_ht-xtotal4;
    total_tva:=(total_ht*17)/100;
    QRLabel16.Caption:=formatfloat('## ### ### ###.00',total_ht);
    QRLabel17.Caption:=formatfloat('## ### ### ###.00',total_tva);
    QRLabel18.Caption:=formatfloat('## ### ### ###.00',total_ht+total_tva);
    //Pour Memoire
    QRLabel25.Caption:=formatfloat('## ### ### ###.00',(xmont_cumule*tx_forf)/100*1.17);
    QRLabel26.Caption:=formatfloat('## ### ### ###.00',(xmont_cumule*tx_appros)/100*1.17);
    //Convertion chiffre vers lettre
    xval:=floattostr(total_ht+total_tva);
    xval1:=NbEnLettres(strtofloat(xval),false);
    QRLabel27.Caption:=AnsiUpperCase(xval1);
End;

end.
