unit Facure_Travaux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons,
  Menus, DB, DBTables, ComCtrls;

type
  TFFact_Trav = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBEdit8: TDBEdit;
    DBMemo1: TDBMemo;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Sp4: TSpeedButton;
    Button1: TButton;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    Sp3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Date: TDateTimePicker;
    SpeedButton2: TSpeedButton;
    procedure FactureGnrale1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Sp4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Sp3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DateChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Déclarations privées }

  public
    { Déclarations publiques }
  end;

var
FFact_Trav: TFFact_Trav;
xnfact,xval:string;
implementation
uses imprime_facture, Liste_Fact, MODULE_TABLE, EFacture_Baticic, Math,
  Menu, FModif_Solde, EFact_vente, facture_avance, liste_client;
{$R *.dfm}

procedure TFFact_Trav.FactureGnrale1Click(Sender: TObject);
begin
 QRMDForm.DetailTable.Filter:='nfact=' + QUOTEDSTR(dbedit1.text);
 QRMDForm.DetailTable.FILTeRED:=true;
 QRMDForm.Facture_Trav.Preview;
end;
procedure TFFact_Trav.Button1Click(Sender: TObject);
begin
Module1.TFACTURE.Edit;
sp3.Visible:=true;
sp4.Visible:=false;
Button1.Visible:=false;
end;

procedure TFFact_Trav.Sp4Click(Sender: TObject);
begin
Module1.TFACTURE.Edit;
Module1.TFACTURE.FieldByName('mont_encais').AsCurrency:=Module1.TFACTURE.FieldByName('net').AsCurrency;
Module1.TFACTURE.FieldByName('solde').AsCurrency:=0;
Module1.TFACTURE.Post;
showmessage('Facture soldée');
End;

procedure TFFact_Trav.BitBtn5Click(Sender: TObject);
begin
DBEDIT1.SetFocus;
module1.TFACTURE.Insert;
dbgrid1.ReadOnly:=true;
bitbtn3.Visible:=true;
bitbtn4.Visible:=true;
bitbtn5.Visible:=false;
bitbtn6.Visible:=false;
bitbtn7.Visible:=false;
SpeedButton1.Visible:=false;
SpeedButton2.Visible:=true;
DBNavigator1.Visible:=false;
Date.Visible:=true;
end;

procedure TFFact_Trav.BitBtn6Click(Sender: TObject);
begin

DBEDIT1.SetFocus;
module1.TFACTURE.edit;
dbgrid1.ReadOnly:=true;
bitbtn3.Visible:=true;
bitbtn4.Visible:=true;
bitbtn5.Visible:=false;
bitbtn6.Visible:=false;
bitbtn7.Visible:=false;
SpeedButton1.Visible:=false;
SpeedButton2.Visible:=true;
DBNavigator1.Visible:=false;
Date.Visible:=true;
end;

procedure TFFact_Trav.BitBtn7Click(Sender: TObject);
 var xNFACT:string;
 begin
   if MessageDlg('Voulez vous supprimer La facture en cours ...?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      xnfact:=dbedit1.Text;
      Module1.TLIGNE_fact.First;
      WHILE NOT Module1.TLIGNE_fact.Eof DO
        BEGIN
         IF Module1.TLIGNE_fact.FieldValues['nfact']=xnfact then Module1.TLIGNE_fact.Delete;
        end;
      Module1.Tfacture.Delete;
      ShowMessage('Facture Supprmée...');
   end;   

end;

procedure TFFact_Trav.Sp3Click(Sender: TObject);
begin
Module1.TFACTURE.FieldByName('solde').AsCurrency:=Module1.TFACTURE.FieldByName('net').AsCurrency-
Module1.TFACTURE.FieldByName('mont_encais').AsCurrency;
Module1.TFACTURE.Post;
sp3.Visible:=false;
sp4.Visible:=true;
Button1.Visible:=true;

end;

procedure TFFact_Trav.SpeedButton1Click(Sender: TObject);
begin
        fact_vente.Query1.Active:=false;
        fact_vente.Query1.Active:=true;
         With  fact_vente.Query1 do
         begin
          Close;
          Unprepare;
          ParamByName('xnfact').AsString :=dbedit1.Text;
          Prepare;
          Open;
          fact_vente.Preview;
          exit;
         end;
end;

procedure TFFact_Trav.BitBtn3Click(Sender: TObject);
begin
DBEDIT1.SetFocus;
module1.TFACTURE.Post;
dbgrid1.ReadOnly:=false;
bitbtn3.Visible:=false;
bitbtn4.Visible:=false;
bitbtn5.Visible:=true;
bitbtn6.Visible:=true;
bitbtn7.Visible:=true;
SpeedButton1.Visible:=true;
SpeedButton2.Visible:=false;
DBNavigator1.Visible:=true;
Date.Visible:=false;
end;

procedure TFFact_Trav.BitBtn4Click(Sender: TObject);
begin
DBEDIT1.SetFocus;
module1.TFACTURE.Cancel;
dbgrid1.ReadOnly:=false;
bitbtn3.Visible:=false;
bitbtn4.Visible:=false;
bitbtn5.Visible:=true;
bitbtn6.Visible:=true;
bitbtn7.Visible:=true;
SpeedButton1.Visible:=true;
SpeedButton2.Visible:=false;
DBNavigator1.Visible:=true;
Date.Visible:=false;
end;

procedure TFFact_Trav.DateChange(Sender: TObject);
begin
DBEDIT3.Text:=datetostr(Date.date);
end;

procedure TFFact_Trav.SpeedButton2Click(Sender: TObject);
begin
if FListe_Client.Showmodal=MrOk then
  begin
  dbedit2.Text:=module1.TCLIENT.fieldbyname('num').AsString;
  module1.TCLIENT.FILTeRED:=false;
  end;

end;

end.
