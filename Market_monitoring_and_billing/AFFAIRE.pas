unit AFFAIRE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ComCtrls, TabNotBk, DB, DBTables,
  Buttons, ImgList, DBActns, ActnList,ExtCtrls;

type
  TFAFFAIRE = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit12: TDBEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Action: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    DataSetRefresh1: TDataSetRefresh;
    ImageList1: TImageList;
    BitBtn11: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    DateTimePicker5: TDateTimePicker;
    Label22: TLabel;
    DBEdit21: TDBEdit;
    SpeedButton2: TSpeedButton;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    Bevel1: TBevel;
    Label25: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Image1: TImage;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label9: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    Function TestInteger(min,max:integer;x:char):char;
    Function TestReal(min,max:real;x:char):char;
    procedure SpeedButton1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure DateTimePicker5Change(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FAFFAIRE: TFAFFAIRE;
  value : real;
implementation

uses Math,LISTE_AFFAIRE, MODULE_TABLE, FListe_clients, FImp_Facture,
  EETAT_FACTURE, Menu, LISTE_AFFAIRE2;

{$R *.dfm}
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

procedure TFAFFAIRE.BitBtn3Click(Sender: TObject);
begin
SpeedButton1.Visible:=true;
SpeedButton2.Visible:=false;
dbedit1.SetFocus;
MODULE1.TAFFAIRE.Insert;
BitBtn1.Visible:=true;
BitBtn2.Visible:=true;
BitBtn3.Visible:=false;
BitBtn4.Visible:=false;
BitBtn5.Visible:=False;

BitBtn7.Visible:=false;
BitBtn8.Visible:=false;
BitBtn9.Visible:=False;
BitBtn10.Visible:=false;
BitBtn11.Visible:=false;
end;

Function TFAFFAIRE.testinteger(min,max:integer;x:char):char;
var
mi,ma : string;
value : real;
begin
  result:=#0;
  if x in ['0'..'9'] then begin
    result:=x;
    exit;
  end;
  if x <> #13 then begin
    showmessage('Vous devez entrer un chiffre');
    result := #0;
  end;
  if x = #13 then begin
    value := strtoint(tedit(activecontrol).text);
    mi:=floattostr(min);
    ma:=floattostr(max);
    if (value < min) or (value > max) then begin
      Showmessage ('la valeur doit être comprise entre '+mi+' et '+ma);
      result:=#0;
      exit;
    end;
    perform(WM_NEXTDLGCTL,0,0);
  end;
end;

Function TFAFFAIRE.testreal(min,max:real;x:char):char;
var
mi,ma : string;
begin
  result:=#0;
  if x in ['0'..'9','.',','] then begin
    result:=x;
    if decimalseparator =',' then  if result=#46 then result:=#44;
    if decimalseparator ='.' then  if result=#44 then result:=#46;
    exit;
  end;
  if x <> #13 then begin
    showmessage('Vous devez entrer un chiffre');
    result := #0;
  end;
  if x = #13 then begin
    value := strtofloat(tedit(activecontrol).text);
    mi:=floattostr(min);
    ma:=floattostr(max);
    if (value < min) or (value > max) then begin
      Showmessage ('la valeur doit être comprise entre '+mi+' et '+ma);
      result:=#0;
      exit;
    end;
    perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFAFFAIRE.BitBtn2Click(Sender: TObject);
begin

MODULE1.TAFFAIRE.Cancel;
BitBtn1.Visible:=false;
BitBtn2.Visible:=FALSE;
BitBtn3.Visible:=TRUE;
BitBtn4.Visible:=TRUE;
BitBtn5.Visible:=TRUE;
BitBtn7.Visible:=TRUE;
BitBtn8.Visible:=TRUE;
BitBtn9.Visible:=TRUE;
BitBtn10.Visible:=TRUE;
BitBtn11.Visible:=TRUE;
SpeedButton1.Visible:=false;
SpeedButton2.Visible:=true;
end;

procedure TFAFFAIRE.BitBtn1Click(Sender: TObject);
begin
if dbedit1.Text='' then
 begin
   ShowMessage('La Saisie Du N° D''Affaire et Obligatoire');
   dbedit1.SetFocus;
   exit;
 end;
 if MODULE1.TAFFAIRE.State in [dsinsert]Then
    begin
      if module1.affaires.FindKey([dbedit1.text]) then
       begin
        showmessage('Affaire déja saisie..');
        exit;
       end;
    end;
  MODULE1.TAFFAIRE.Post;
  BitBtn1.Visible:=false;
  BitBtn2.Visible:=FALSE;
  BitBtn3.Visible:=TRUE;
  BitBtn4.Visible:=TRUE;
  BitBtn5.Visible:=TRUE;
  BitBtn7.Visible:=TRUE;
  BitBtn8.Visible:=TRUE;
  BitBtn9.Visible:=TRUE;
  BitBtn10.Visible:=TRUE;
  BitBtn11.Visible:=TRUE;
  SpeedButton2.Visible:=true;
  SpeedButton1.Visible:=false;
end;

procedure TFAFFAIRE.BitBtn4Click(Sender: TObject);
begin
SpeedButton1.Visible:=true;
SpeedButton2.Visible:=false;
dbedit1.SetFocus;
MODULE1.TAFFAIRE.Edit;
BitBtn1.Visible:=true;
BitBtn2.Visible:=true;
BitBtn3.Visible:=false;
BitBtn4.Visible:=false;
BitBtn5.Visible:=False;
BitBtn7.Visible:=false;
BitBtn8.Visible:=false;
BitBtn9.Visible:=False;
BitBtn10.Visible:=false;
BitBtn11.Visible:=false;
end;

procedure TFAFFAIRE.BitBtn5Click(Sender: TObject);
begin
if MessageDlg('Voulez vous supprimer cette affaire?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then MODULE1.TAFFAIRE.Delete;
end;

procedure TFAFFAIRE.SpeedButton1Click(Sender: TObject);
begin
if liste_clients.showmodal=mrok then
 begin
  module1.TAFFAIRE.FieldValues['num']:=module1.TCLIENT.FieldValues['num'];
 end;
end;

procedure TFAFFAIRE.DateTimePicker1Change(Sender: TObject);
begin
DBEDIT13.Text:=datetostr(DateTimePicker1.date);
end;

procedure TFAFFAIRE.DateTimePicker2Change(Sender: TObject);
begin
DBEDIT14.Text:=datetostr(DateTimePicker2.date);
end;

procedure TFAFFAIRE.DateTimePicker3Change(Sender: TObject);
begin
DBEDIT16.Text:=datetostr(DateTimePicker3.date);
end;

procedure TFAFFAIRE.DateTimePicker4Change(Sender: TObject);
begin
DBEDIT17.Text:=datetostr(DateTimePicker4.date);
end;

procedure TFAFFAIRE.DateTimePicker5Change(Sender: TObject);
begin
DBEDIT20.Text:=datetostr(DateTimePicker5.date);
end;

procedure TFAFFAIRE.DBEdit9Exit(Sender: TObject);
begin
Module1.TAFFAIRE.FieldByName('mont_tva').AsCurrency:=
(Module1.TAFFAIRE.FieldByName('mont_ht').AsCurrency*
Module1.TAFFAIRE.FieldByName('taux_tva').AsCurrency)/100;
Module1.TAFFAIRE.FieldByName('mont_ttc').AsCurrency:=
Module1.TAFFAIRE.FieldByName('mont_tva').AsCurrency+
Module1.TAFFAIRE.FieldByName('mont_ht').AsCurrency;
end;

procedure TFAFFAIRE.DBEdit4Exit(Sender: TObject);
begin
Module1.TAFFAIRE.FieldByName('mont_tva').AsCurrency:=
(Module1.TAFFAIRE.FieldByName('mont_ht').AsCurrency*
Module1.TAFFAIRE.FieldByName('taux_tva').AsCurrency)/100;
Module1.TAFFAIRE.FieldByName('mont_ttc').AsCurrency:=
Module1.TAFFAIRE.FieldByName('mont_tva').AsCurrency+
Module1.TAFFAIRE.FieldByName('mont_ht').AsCurrency;
end;

procedure TFAFFAIRE.SpeedButton2Click(Sender: TObject);
begin
imp_facture.showmodal;
end;

procedure TFAFFAIRE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_F2 then
 winexec('calc.exe',sw_showdefault);

end;

end.
