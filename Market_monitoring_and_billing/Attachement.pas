unit Attachement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, Buttons, Menus,
  ComCtrls, ExtCtrls, DB, DBTables;

type
  TFAttachement = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Image1: TImage;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBNavigator1: TDBNavigator;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    DateTimePicker3: TDateTimePicker;
    SpeedButton1: TSpeedButton;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    BitBtn9: TBitBtn;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    trouve:string;
  end;

var
  FAttachement: TFAttachement;

implementation

uses MODULE_TABLE, Liste_devis, LISTE_AFFAIRE2, Cree_Fact, Liste_Attach,
  ESituation_Attach, fact_travaux;

{$R *.dfm}

procedure TFAttachement.BitBtn3Click(Sender: TObject);
begin
DBEDIT6.SetFocus;
module1.TATTACH.Insert;
dbgrid1.ReadOnly:=true;
bitbtn1.Visible:=true;
bitbtn2.Visible:=true;
bitbtn3.Visible:=false;
bitbtn4.Visible:=false;
bitbtn5.Visible:=false;
bitbtn7.Visible:=true;
bitbtn8.Visible:=false;


trouve:='Nouv';
end;

procedure TFAttachement.BitBtn4Click(Sender: TObject);
begin
DBEDIT6.SetFocus;
dbgrid1.ReadOnly:=true;
module1.TATTACH.Edit;
bitbtn1.Visible:=true;
DBEDIT1.Enabled:=false;
bitbtn2.Visible:=true;
bitbtn3.Visible:=false;
bitbtn4.Visible:=false;
bitbtn5.Visible:=false;
bitbtn8.Visible:=false;


bitbtn7.Visible:=true;
trouve:='Modif';
end;

procedure TFAttachement.BitBtn5Click(Sender: TObject);
 var xattach:string;
 begin
   if MessageDlg('Voulez vous supprimer L''attachement en cours ...?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      xattach:=dbedit1.Text;
      Module1.TLIGNE_ATTCH.First;
      WHILE NOT Module1.TLIGNE_ATTCH.Eof DO
        BEGIN
         IF Module1.TLIGNE_ATTCH.FieldValues['nattach']=xattach then Module1.TLIGNE_ATTCH.Delete;
        end;
      Module1.TATTACH.Delete;
      ShowMessage('Attachement Supprmé...');
   end;   
 End;

procedure TFAttachement.BitBtn1Click(Sender: TObject);
begin
if Trouve='Modif' then   begin
     If not module1.TAFFAIRE.FindKey([dbedit5.text]) then
       begin
        ShowMessage('Affaire  introuvable...');
        dbedit5.SetFocus;
        EXIT;
       end;
        dbgrid1.ReadOnly:=false;
        module1.TATTACH.post;
        bitbtn1.Visible:=false;
        bitbtn2.Visible:=false;
        bitbtn3.Visible:=true;
        bitbtn4.Visible:=true;
        bitbtn5.Visible:=true;
        bitbtn7.Visible:=false;
        bitbtn8.Visible:=true;
        DBEDIT1.Enabled:=TRUE;

        Showmessage('Modifications Enregistrées..');
      END;
 if Trouve='Nouv' then
   begin
        if not module1.TAFFAIRE.FindKey([dbedit5.text]) then begin
           ShowMessage('Affaire  introuvable...');
           dbedit5.SetFocus;
           end
         ELsE
          BEGIN
           dbgrid1.ReadOnly:=false;
           module1.TATTACH.post;
           bitbtn1.Visible:=false;
           bitbtn2.Visible:=false;
           bitbtn3.Visible:=true;
           bitbtn4.Visible:=true;
           bitbtn5.Visible:=true;
           bitbtn7.Visible:=false;
           bitbtn8.Visible:=true;
           Showmessage('Fiche Enregistrée..');
          END;
     end;
end;

procedure TFAttachement.BitBtn2Click(Sender: TObject);
begin
dbgrid1.ReadOnly:=false;
module1.TATTACH.Cancel;
bitbtn1.Visible:=false;
bitbtn2.Visible:=false;
bitbtn3.Visible:=true;
bitbtn4.Visible:=true;
bitbtn5.Visible:=true;

bitbtn8.Visible:=true;
bitbtn7.Visible:=false;
end;

procedure TFAttachement.DateTimePicker1Change(Sender: TObject);
begin
DBEDIT3.Text:=datetostr(DateTimePicker1.date);
end;

procedure TFAttachement.DBGrid1EditButtonClick(Sender: TObject);
VAR XNATTaCH,xndevis:string;
begin
//module1.TAFFAIRE.FindKey([dbedit5.text]);
 module1.TAFFAIRE.Filter:='naffaire = ' + QUOTEDSTR(dbedit5.text);
 module1.TAFFAIRE.FILTeRED:=true;
  xnattach:= module1.tattach.fieldvalues['nattach'];
 IF fliste_devis.showmodal=mrOk then
 begin
   xndevis:= module1.TLIGNE_DEVIS.fieldvalues['Nligne_devis'];
   IF MODULE1.TLIGNE_ATTCH.FindKey([xnattach,xndevis]) then
    begin
     ShowMessage('Cette Ligne Est Déja saisie....');
     exit;
    end;
   MODULE1.TLIGNE_ATTCH.Insert;
   MODULE1.TLIGNE_ATTCH.FieldValues['Naffaire']:=dbedit5.Text;
   MODULE1.TLIGNE_ATTCH.FieldValues['Nattach']:=dbedit1.Text;
   MODULE1.TLIGNE_ATTCH.FieldValues['NPOSTe']:=MODULE1.TLIGNE_DEVIS['Nligne_DEVIS'];
   MODULE1.TLIGNE_ATTCH.FieldValues['Desig_post']:=MODULE1.TLIGNE_DEVIS['desig_devis'];
   MODULE1.TLIGNE_ATTCH.FieldValues['um']:=MODULE1.TLIGNE_DEVIS['um'];
   MODULE1.TLIGNE_ATTCH.FieldValues['Pu']:=MODULE1.TLIGNE_DEVIS['pu'];
 end else begin  MODULE1.TLIGNE_ATTCH.Cancel; end;
end;

procedure TFAttachement.BitBtn7Click(Sender: TObject);
begin
IF Fliste_AFFAIRE2.showmodal=mrOk then
  dbedit5.Text:=MODULE1.TAFFAIRE.FieldValues['naffaire'];
  dbmemo1.Text:=MODULE1.TAFFAIRE.FieldValues['Objet contrat'];
end;



procedure TFAttachement.BitBtn8Click(Sender: TObject);
begin
        Fact_trav.Query1.Active:=false;
        Fact_trav.Query1.Active:=true;
         With  Fact_trav.Query1 do
         begin
          Close;
          Unprepare;
          ParamByName('xnfact').AsString :=dbedit8.Text;
          Prepare;
          Open;
          Fact_trav.Preview;
          exit;
         end;
end;

procedure TFAttachement.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_F2 then
 winexec('calc.exe',sw_showdefault);
end;

procedure TFAttachement.SpeedButton6Click(Sender: TObject);
begin
if MessageDlg('Confirmer la suppression .  Qui?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then Module1.TLIGNE_ATTCH.Delete;

end;

procedure TFAttachement.SpeedButton7Click(Sender: TObject);
begin
Module1.TLIGNE_ATTCH.Append;
end;

procedure TFAttachement.DateTimePicker3Change(Sender: TObject);
begin
DBEDIT9.Text:=datetostr(DateTimePicker3.date);
end;

procedure TFAttachement.SpeedButton1Click(Sender: TObject);
begin
BitBtn9.Visible:=true;
dbedit2.SetFocus;
SpeedButton1.Visible:=false;
module1.TATTACH.Edit;

end;

procedure TFAttachement.BitBtn9Click(Sender: TObject);
begin
BitBtn9.Visible:=false;
SpeedButton1.Visible:=true;
module1.TATTACH.FieldByName('solde').AsCurrency:=
module1.TATTACH.FieldByName('mont_net').AsCurrency-
module1.TATTACH.FieldByName('mon_encaiss').AsCurrency;
module1.TATTACH.Post;

end;

end.
