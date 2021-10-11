unit Menu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Menus, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

  const
     xunite = 'UNITE CHARPENTE AIN-DEFLA';
     XANNEE = '2004';
  var
     xnaffaire: string;

type
  TFMENU = class(TForm)
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    SuiviMarch1: TMenuItem;
    Editions1: TMenuItem;
    Affaire1: TMenuItem;
    Clients1: TMenuItem;
    Devis1: TMenuItem;
    Attachements1: TMenuItem;
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Aide: TMenuItem;
    APropos: TMenuItem;
    N1: TMenuItem;
    Quitter1: TMenuItem;
    BitBtn11: TBitBtn;
    Configurationdelimpression1: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Outils1: TMenuItem;
    Sauvegarde1: TMenuItem;
    Restaurer1: TMenuItem;
    Calculatrice1: TMenuItem;
    Calendrie1: TMenuItem;
    BitBtn12: TBitBtn;
    Supprimer1: TMenuItem;
    Affaire2: TMenuItem;
    Clients2: TMenuItem;
    FactureTravaux1: TMenuItem;
    Attachements2: TMenuItem;
    Factures1: TMenuItem;
    Facturesdavoirs1: TMenuItem;
    SituationDesTravaux1: TMenuItem;
    Facturesdavances1: TMenuItem;
    Affichage1: TMenuItem;
    N1001: TMenuItem;
    N501: TMenuItem;
    Image1: TImage;
    Label2: TLabel;
    Comptabilite1: TMenuItem;
    Comptabilisation1: TMenuItem;
    Journaldesventes1: TMenuItem;
    Global1: TMenuItem;
    Parpriode1: TMenuItem;
    Parclient1: TMenuItem;
    Etatdescrances1: TMenuItem;
    Parclient2: TMenuItem;
    Globals1: TMenuItem;
    Parpriode2: TMenuItem;
    Journaldesventes2: TMenuItem;
    Etatdestravauxsupplimentaires1: TMenuItem;
    Etatdestachesplusvalue1: TMenuItem;
    Etatdestachesmoinsvalue1: TMenuItem;
    Facturesdesventesdivers2: TMenuItem;
    Ouvrir1: TMenuItem;
    InfoSocite1: TMenuItem;
    SpeedButton1: TSpeedButton;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Attachements1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Affaire1Click(Sender: TObject);
    procedure Clients1Click(Sender: TObject);
    procedure Devis1Click(Sender: TObject);
    procedure Facturedetravaux1Click(Sender: TObject);
    procedure Quitter1Click(Sender: TObject);
    procedure AProposClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Configurationdelimpression1Click(Sender: TObject);
    procedure Affaire2Click(Sender: TObject);
    procedure Clients2Click(Sender: TObject);
    procedure FactureTravaux1Click(Sender: TObject);
    procedure Attachements2Click(Sender: TObject);
    procedure Factures1Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure Calculatrice1Click(Sender: TObject);
    procedure N1001Click(Sender: TObject);
    procedure N501Click(Sender: TObject);
    procedure Facturesdavances1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ouvrir1Click(Sender: TObject);
    procedure InfoSocite1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Facturesdesventesdivers2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Global1Click(Sender: TObject);
    procedure Parpriode1Click(Sender: TObject);
    procedure Parclient1Click(Sender: TObject);
    procedure Globals1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Parclient2Click(Sender: TObject);
    procedure Parpriode2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FMENU: TFMENU;
  xnom_client:string;
  function convertir(Montant:Currency):string;
  function cenvtir(Valeur:Currency):string;
implementation

uses CLIENT, AFFAIRE, DEVIS, Attachement, Facure_Travaux, Apropos,
  Encaissement, MODULE_TABLE, FSAVE, ESitu_Travaux, Fouvrir, Societe,
  chiffre_global, periode_chiffre, chiffre_clientt, chiffre_periode,
  creance_global, creance_clientt, periode_creanc;

{$R *.dfm}
//------------------------------------------|
//        * Borland Delphi 5 Unit *         |
//    Unité de Conversion des montants      |
//    en Lettres .par FERAOUN SOFIANE       |
// -----------------------------------------|

function convertir(Montant: Currency): string;
var some,centim, differ:string;
    nombre:real;
begin
 result:='';
if (montant=0) then begin
result:='Zero Dinar'  ;exit;end else begin
if(montant<0)then result:='';
str(montant:15:2,Some);
centim:=copy(some,14,2);
result:='';
montant:=Int(Montant);
//*******Milliards*******//
nombre:= Int(montant /1000000000);
      if (nombre>0) then begin
         result:=result+cenvtir(nombre)+' Milliards ';
         if copy(result,1,3)=' et' then begin delete(result,1,3);delete(result,13,1)end;
         montant:= montant-(Nombre*1000000000);
      end;
//*******Millions*******//
nombre:= Int(montant /1000000);
      if (nombre>0)then begin
         result:=result+cenvtir(nombre)+' Millions ';
         if copy(result,1,3)=' et' then begin delete(result,1,3);delete(result,12,1)end;
         montant:= montant-(Nombre*1000000);
      end;
//*******Milliers*******//
nombre:= Int(montant /1000);
      if (nombre>0)then begin
        if (nombre>1)then result:=result+cenvtir(nombre)+' Mille '
        else  result:=result+' Mille ' ;
        montant:= montant-(Nombre*1000);
      end;
//*******Centaines & down*******//
nombre:=Montant;
if (nombre>0)then  result:= result+cenvtir(Nombre);

if (copy(result,1,6)=' et Un')  and (Length(Result)=6)then
        begin
             delete(result,1,3);
             Result:=Result+' Dinar' ;
             if StrToInt(Centim)<>0 then begin
                                         differ:=(cenvtir(StrTofloat(Centim))+' Centimes');
                                         if copy(differ,1,6)=' et Un' then begin delete(differ,length(differ),1);Result:=result+' '+ differ ;
                                           end else
                                         Result:=result+' et '+ differ
                                         end;
        end else
        begin
             Result:=Result+' Dinars';
             if StrToInt(Centim)<>0 then begin
                                         differ:=(cenvtir(StrTofloat(Centim))+' Centimes');//**
                                         if copy(differ,1,6)=' et Un' then begin delete(differ,length(differ),1) ;Result:=result+' '+ differ ;
                                         end else
                                         Result:=result+' et '+ differ
                                         end;
        end;
end;
end;
function cenvtir(Valeur:Currency):string;
var SUnit,SDiz,Code:String;n1:Integer;DDD:Boolean;
begin
SUnit:='et Un   Deux    Trois   Quatres Cinq    Six     Sept    Huit    Neuf    '+
       'Dix     Onze    Douze   Treize  QuatorzeQuinze  Seize   Dix-SeptDix-Huit'+
       'Dix-Neuf';
SDiz:='Vingt       Trente      Quarante    Cinquante   Soixante    Soixante    '+
      'Quatre VingtQuatre Vingt';
code:='';
DDD:=False;
//N1:=0;
if Valeur>99 then begin
    N1:=Trunc(valeur/100);
    if N1>1 then  code:=code+trim(copy(Sunit,(N1*8)-7,8));
    valeur:=valeur-(N1*100);
    code:=code+' Cents ';
end;
if valeur<>0 then begin
      if valeur>19 then
        begin
        N1:=Trunc(Valeur/10)-1;
        code:=code+trim(copy(SDiz,(N1*12)-11,12));
        N1:=Trunc(Valeur/10)*10;
              if (valeur>=70) and(valeur<80)or(valeur>=90) then valeur:=valeur+10;
              if valeur=10 then  DDD:=false;
        valeur:=valeur-N1;
      end;
      if valeur>0 then
          code:=code+' '+trim(copy(SUnit,(trunc(valeur)*8)-7,8))
          else if ddd=true then code:=code+'Dix';

end;
result:=code;
end;
procedure TFMENU.BitBtn10Click(Sender: TObject);
begin
fclient.ShowModal;
end;

procedure TFMENU.BitBtn9Click(Sender: TObject);
begin
Faffaire.showmodal;
end;

procedure TFMENU.BitBtn8Click(Sender: TObject);
begin
Fdevis.Showmodal;
end;

procedure TFMENU.BitBtn7Click(Sender: TObject);
begin
Fattachement.ShowModal;
end;

procedure TFMENU.Attachements1Click(Sender: TObject);
begin
Fattachement.showmodal;
end;

procedure TFMENU.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TFMENU.Affaire1Click(Sender: TObject);
begin
faffaire.showmodal;
end;
procedure TFMENU.Clients1Click(Sender: TObject);
begin
FCLIENT.ShowModal;
end;
procedure TFMENU.Devis1Click(Sender: TObject);
begin
fdevis.ShowModal;
end;
procedure TFMENU.Facturedetravaux1Click(Sender: TObject);
begin
ffact_trav.showmodal;
end;
procedure TFMENU.Quitter1Click(Sender: TObject);
begin
Application.Terminate;
end;
Procedure TFMENU.AProposClick(Sender: TObject);
begin
FApropos.showmodal;
end;

procedure TFMENU.BitBtn2Click(Sender: TObject);
begin
FEncaissement.showmodal;
end;

procedure TFMENU.Configurationdelimpression1Click(Sender: TObject);
begin
PrinterSetupDialog1.Execute;
end;

procedure TFMENU.Affaire2Click(Sender: TObject);
begin
   if MessageDlg('Voulez vous supprimer toutes les affaires ...?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
       Module1.TAFFAIRE.First;
       if Module1.TAFFAIRE.Eof then
       begin
         showmessage('Le Fichier est vide');
         exit;
       end;
       While Not Module1.TAFFAIRE.Eof do
        Begin
         Module1.TAFFAIRE.Delete;
        end;
        ShowMessage('Toutes les affaires sont supprimées...');
     end;

end;
procedure TFMENU.Clients2Click(Sender: TObject);
begin
   if MessageDlg('Voulez vous supprimer toutes les clients ...?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
       Module1.Tclient.First;
       if Module1.Tclient.Eof then
       begin
         showmessage('Le Fichier est vide');
         exit;
       end;
       While Not Module1.Tclient.Eof do
        Begin
         Module1.Tclient.Delete;
        end;
       ShowMessage('Toutes les clients sont supprimées...'); 
     end;

end;

procedure TFMENU.FactureTravaux1Click(Sender: TObject);
begin
   if MessageDlg('Voulez vous supprimer toutes les devis ...?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
       Module1.DEVIS.First;
       if Module1.DEVIS.Eof then
       begin
         showmessage('Le Fichier est vide');
         exit;
       end;
       While Not Module1.DEVIS.Eof do
        Begin
         Module1.DEVIS.Delete;
        end;
        ShowMessage('Toutes les Devis sont supprimées...');
     end;
End;

procedure TFMENU.Attachements2Click(Sender: TObject);
begin
if MessageDlg('Voulez vous supprimer toutes les Attachements ...?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
       Module1.Tattach.First;
       if Module1.Tattach.Eof then
       begin
         Showmessage('Le Fichier est vide');
         exit;
       end;
       While Not Module1.Tattach.Eof do
        Begin
        Module1.Tattach.Delete;
        end;
        MODULE1.Ligne_attch.first; //Ligne Attachement
        While Not Module1.Ligne_attch.Eof do
        Begin
         Module1.Ligne_attch.Delete;
        end;
        ShowMessage('Toutes les attachements sont supprimées...');
      end;
end;

procedure TFMENU.Factures1Click(Sender: TObject);
begin
if MessageDlg('Voulez vous supprimer toutes les Factures ...?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
       Module1.Tfacture.First;
       if Module1.Tfacture.Eof then
       begin
         showmessage('Le Fichier est vide');
         exit;
       end;
       While Not Module1.Tfacture.Eof do
        Begin
        Module1.Tfacture.Delete;
        end;
        MODULE1.Ligne_fact.first; //Ligne Facture
        While Not Module1.Ligne_fact.Eof do
        Begin
         Module1.Ligne_fact.Delete;
        end;
       ShowMessage('Toutes les Factures sont supprimées...');
     end;
end;
procedure TFMENU.BitBtn12Click(Sender: TObject);
begin
   winexec('calc.exe',sw_showdefault);
end;

procedure TFMENU.Calculatrice1Click(Sender: TObject);
begin
   winexec('calc.exe',sw_showdefault);
end;

procedure TFMENU.N1001Click(Sender: TObject);
var mode:TDeviceMode; 
a:integer;
begin 
mode.dmSize := sizeof (MODE); 
mode.dmPelsWidth := 800; 
mode.dmPelsHeight := 600;
mode.dmBitsPerPel := 16; 
mode.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT or DM_BITSPERPEL; 
a := ChangeDisplaySettings(mode, CDS_TEST);
if a=DISP_CHANGE_SUCCESSFUL then ChangeDisplaySettings(mode, 0) 
end;

procedure TFMENU.N501Click(Sender: TObject);
var mode:TDeviceMode; 
a:integer; 
begin 
mode.dmSize := sizeof (MODE); 
mode.dmPelsWidth := 1024;
mode.dmPelsHeight := 768; 
mode.dmBitsPerPel := 16; 
mode.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT or DM_BITSPERPEL; 
a := ChangeDisplaySettings(mode, CDS_TEST); 
if a=DISP_CHANGE_SUCCESSFUL then ChangeDisplaySettings(mode, 0) 

end;

procedure TFMENU.Facturesdavances1Click(Sender: TObject);
begin
if MessageDlg('Voulez vous supprimer toutes les Factures ...?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
       Module1.TFACT.First;
       if Module1.TFACT.Eof then
       begin
         Showmessage('Le Fichier est vide');
         exit;
       end;
       While Not Module1.TFACT.Eof do
        Begin
        Module1.TFACT.Delete;
        end;
        MODULE1.TFACTURE2.first; //Ligne FACTURE
        While Not Module1.TFACTURE2.Eof do
        Begin
         Module1.TFACTURE2.Delete;
        end;
       ShowMessage('Toutes les Factures sont supprimées...');
     end;
end;

procedure TFMENU.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_F2 then
 winexec('calc.exe',sw_showdefault);
end;

procedure TFMENU.Ouvrir1Click(Sender: TObject);
begin
 module1.TAFFAIRE.Filtered:=false;
 ovrire.ShowModal;
end;

procedure TFMENU.InfoSocite1Click(Sender: TObject);
begin
fsociete.ShowModal;
end;

procedure TFMENU.SpeedButton1Click(Sender: TObject);
begin
 module1.TAFFAIRE.Filtered:=false;
 ovrire.ShowModal;
end;

procedure TFMENU.Facturesdesventesdivers2Click(Sender: TObject);
begin
FFact_trav.showmodal;
end;

procedure TFMENU.BitBtn6Click(Sender: TObject);
begin
FFact_trav.showmodal;
end;

procedure TFMENU.Global1Click(Sender: TObject);
var xx:string;
begin
module1.TEtat_Facture.Active:=true;
module1.TEtat_Facture.First;
while not module1.TEtat_Facture.Eof do
  begin
   Module1.TEtat_Facture.Delete;
  end;
  //fACTURE DES VENTES DIVERS
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT *');
  module1.ETAT.SQL.Add('FROM Facture.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfact');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfact').AsString;
    module1.TEtat_Facture.FieldByName('num').AsString:= module1.ETAT.FieldByName('num').AsString;
    xx:=module1.ETAT.FieldByName('num').AsString;
    module1.TCLIENT.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.TCLIENT.fieldbyname('nom').AsString;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('net').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('mont_encais').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=module1.ETAT.FieldByName('solde').AsCurrency;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
    //fACTURE des travaux
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT Nfacture, NAffaire, mont_Net, Mon_encaiss, Solde');
  module1.ETAT.SQL.Add('FROM attachement.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfacture');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfacture').AsString;
    xx:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.affaires.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.affaires.fieldbyname('client').AsString;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('mont_net').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('mon_encaiss').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=module1.ETAT.FieldByName('solde').AsCurrency;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
  //fACTURE des d'avoires
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT Nfact, Naffaire, Num, Mont_ttc');
  module1.ETAT.SQL.Add('FROM facture3.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfact');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfact').AsString;
    xx:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.affaires.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.affaires.fieldbyname('client').AsString;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('Mont_ttc').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('Mont_ttc').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=0;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
   chiffre_glob.Query1.Close;
   chiffre_glob.Query1.Open;
   chiffre_glob.Preview;

end;

procedure TFMENU.Parpriode1Click(Sender: TObject);
begin
periode.ShowModal;
end;

procedure TFMENU.Parclient1Click(Sender: TObject);
var xnclient,xx:string;
begin
xnclient:=InputBox('Entrez le N°Client', 'N°C l i e n t :','');
if not module1.TCLIENT.FindKey([xnclient]) then
   begin
     showmessage('Client Introuvable');
     exit;
   end else begin xnom_client:=module1.TCLIENT.fieldbyname('nom').AsString end;
module1.TEtat_Facture.Active:=true;
module1.TEtat_Facture.First;
while not module1.TEtat_Facture.Eof do
  begin
   Module1.TEtat_Facture.Delete;
  end;
  //fACTURE DES VENTES DIVERS
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT *');
  module1.ETAT.SQL.Add('FROM Facture.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfact');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfact').AsString;
    module1.TEtat_Facture.FieldByName('num').AsString:= module1.ETAT.FieldByName('num').AsString;
    xx:=module1.ETAT.FieldByName('num').AsString;
    module1.TCLIENT.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.TCLIENT.fieldbyname('nom').AsString;
    module1.TEtat_Facture.FieldByName('num').AsString:=module1.affaires.fieldbyname('num').AsString;
    module1.TEtat_Facture.FieldByName('date1').AsDateTime:=module1.ETAT.FieldByName('date_fact').AsDateTime;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('net').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('mont_encais').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=module1.ETAT.FieldByName('solde').AsCurrency;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
  //fACTURE des travaux
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT *');
  module1.ETAT.SQL.Add('FROM attachement.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfacture');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfacture').AsString;
    xx:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.affaires.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.affaires.fieldbyname('client').AsString;
    module1.TEtat_Facture.FieldByName('num').AsString:=module1.affaires.fieldbyname('num').AsString;
    module1.TEtat_Facture.FieldByName('date1').AsDateTime:=module1.ETAT.FieldByName('date_fact').AsCurrency;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('mont_net').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('mon_encaiss').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=module1.ETAT.FieldByName('solde').AsCurrency;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
  //fACTURE des d'avoires
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT *');
  module1.ETAT.SQL.Add('FROM facture3.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfact');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfact').AsString;
    xx:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.affaires.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.affaires.fieldbyname('client').AsString;
    module1.TEtat_Facture.FieldByName('num').AsString:=module1.affaires.fieldbyname('num').AsString;
    module1.TEtat_Facture.FieldByName('date1').AsDateTime:=module1.ETAT.FieldByName('date').AsDateTime;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('Mont_ttc').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('Mont_ttc').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=0;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
        chiffre_client.Query1.Active:=false;
        chiffre_client.Query1.Active:=true;
         With  chiffre_client.Query1 do
         begin
          Close;
          Unprepare;
          ParamByName('xnclient').AsString :=xnclient;
          Prepare;
          Open;
          chiffre_client.Preview;
          exit;
         end;
end;

procedure TFMENU.Globals1Click(Sender: TObject);
var xx:string;
begin
module1.TEtat_Facture.Active:=true;
module1.TEtat_Facture.First;
while not module1.TEtat_Facture.Eof do
  begin
   Module1.TEtat_Facture.Delete;
  end;
  //fACTURE DES VENTES DIVERS
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT *');
  module1.ETAT.SQL.Add('FROM Facture.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfact');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfact').AsString;
    module1.TEtat_Facture.FieldByName('num').AsString:= module1.ETAT.FieldByName('num').AsString;
    xx:=module1.ETAT.FieldByName('num').AsString;
    module1.TCLIENT.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.TCLIENT.fieldbyname('nom').AsString;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('net').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('mont_encais').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=module1.ETAT.FieldByName('solde').AsCurrency;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
    //fACTURE des travaux
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT Nfacture, NAffaire, mont_Net, Mon_encaiss, Solde');
  module1.ETAT.SQL.Add('FROM attachement.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfacture');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfacture').AsString;
    xx:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.affaires.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.affaires.fieldbyname('client').AsString;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('mont_net').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('mon_encaiss').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=module1.ETAT.FieldByName('solde').AsCurrency;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
  //fACTURE des d'avoires
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT Nfact, Naffaire, Num, Mont_ttc');
  module1.ETAT.SQL.Add('FROM facture3.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfact');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfact').AsString;
    xx:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.affaires.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.affaires.fieldbyname('client').AsString;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('Mont_ttc').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('Mont_ttc').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=0;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
   Creance_glob.Query1.Close;
   Creance_glob.Query1.Open;
   Creance_glob.Preview;
end;

procedure TFMENU.FormShow(Sender: TObject);
begin
fmenu.Fichier1.Enabled:=false;
fmenu.SuiviMarch1.Enabled:=false;
fmenu.Comptabilite1.Enabled:=false;
fmenu.Editions1.Enabled:=false;
fmenu.Outils1.Enabled:=false;
fmenu.Aide.Enabled:=false;
BitBtn8.Enabled:=false;
BitBtn7.Enabled:=false;
BitBtn6.Enabled:=false;
BitBtn11.Enabled:=false;

end;

procedure TFMENU.Parclient2Click(Sender: TObject);
var xnclient,xx:string;
begin
xnclient:=InputBox('Entrez le N°Client', 'N°C l i e n t :','');
if not module1.TCLIENT.FindKey([xnclient]) then
   begin
     showmessage('Client Introuvable');
     exit;
   end else begin xnom_client:=module1.TCLIENT.fieldbyname('nom').AsString end;
module1.TEtat_Facture.Active:=true;
module1.TEtat_Facture.First;
while not module1.TEtat_Facture.Eof do
  begin
   Module1.TEtat_Facture.Delete;
  end;
  //fACTURE DES VENTES DIVERS
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT *');
  module1.ETAT.SQL.Add('FROM Facture.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfact');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfact').AsString;
    module1.TEtat_Facture.FieldByName('num').AsString:= module1.ETAT.FieldByName('num').AsString;
    xx:=module1.ETAT.FieldByName('num').AsString;
    module1.TCLIENT.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.TCLIENT.fieldbyname('nom').AsString;
    module1.TEtat_Facture.FieldByName('num').AsString:=module1.affaires.fieldbyname('num').AsString;
    module1.TEtat_Facture.FieldByName('date1').AsDateTime:=module1.ETAT.FieldByName('date_fact').AsDateTime;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('net').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('mont_encais').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=module1.ETAT.FieldByName('solde').AsCurrency;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
  //fACTURE des travaux
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT *');
  module1.ETAT.SQL.Add('FROM attachement.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfacture');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfacture').AsString;
    xx:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.affaires.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.affaires.fieldbyname('client').AsString;
    module1.TEtat_Facture.FieldByName('num').AsString:=module1.affaires.fieldbyname('num').AsString;
    module1.TEtat_Facture.FieldByName('date1').AsDateTime:=module1.ETAT.FieldByName('date_fact').AsCurrency;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('mont_net').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('mon_encaiss').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=module1.ETAT.FieldByName('solde').AsCurrency;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
  //fACTURE des d'avoires
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT *');
  module1.ETAT.SQL.Add('FROM facture3.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfact');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfact').AsString;
    xx:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.affaires.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.affaires.fieldbyname('client').AsString;
    module1.TEtat_Facture.FieldByName('num').AsString:=module1.affaires.fieldbyname('num').AsString;
    module1.TEtat_Facture.FieldByName('date1').AsDateTime:=module1.ETAT.FieldByName('date').AsDateTime;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('Mont_ttc').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('Mont_ttc').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=0;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
        creance_client.Query1.Active:=false;
        creance_client.Query1.Active:=true;
         With  creance_client.Query1 do
         begin
          Close;
          Unprepare;
          ParamByName('xnclient').AsString :=xnclient;
          Prepare;
          Open;
          creance_client.Preview;
          exit;
         end;
end;

procedure TFMENU.Parpriode2Click(Sender: TObject);
begin
periode_creance.ShowModal;
end;

end.


