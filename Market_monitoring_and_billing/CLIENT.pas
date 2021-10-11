unit CLIENT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, DBActns, ActnList, ImgList,
  StdActns, ExtCtrls;

type
  TFCLIENT = class(TForm)
    Panel1: TPanel;
    ImageList1: TImageList;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn11: TBitBtn;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    Label15: TLabel;
    Bevel1: TBevel;
    Label14: TLabel;
    Label13: TLabel;
    Image1: TImage;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label20: TLabel;
    DBEdit1: TDBEdit;
    DBEdit13: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit12: TDBEdit;
    Label21: TLabel;
    DBEdit14: TDBEdit;
    DBMemo1: TDBMemo;
    Label12: TLabel;
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FCLIENT: TFCLIENT;
  Modefiche:string;
implementation

uses liste_client, MODULE_TABLE;

{$R *.dfm}

procedure TFCLIENT.BitBtn12Click(Sender: TObject);
begin
fliste_client.showmodal;
end;

procedure TFCLIENT.BitBtn1Click(Sender: TObject);
begin
Modefiche:='Insert';
Module1.TCLIENT.Insert;
dbedit2.SetFocus;
panel3.Visible:=true;
panel2.Visible:=false;
end;

procedure TFCLIENT.BitBtn6Click(Sender: TObject);
begin
 module1.TCLIENT.Post;
 if Modefiche='Insert' then begin
    ShowMessage('Client Enregistré...');
    END ELSE BEGIN
    ShowMessage('Client Modifier...');
    end;
    Modefiche:='';
    panel2.Visible:=true;
    panel3.Visible:=false;
end;

procedure TFCLIENT.BitBtn5Click(Sender: TObject);
begin
    module1.TCLIENT.Cancel;
    Modefiche:='';
    panel2.Visible:=true;
    panel3.Visible:=false;
end;

procedure TFCLIENT.BitBtn2Click(Sender: TObject);
begin
Modefiche:='Edit';
Module1.TCLIENT.Edit;
dbedit2.SetFocus;
panel3.Visible:=true;
panel2.Visible:=false;
end;

procedure TFCLIENT.BitBtn7Click(Sender: TObject);
begin
Module1.TCLIENT.Last;
end;

procedure TFCLIENT.BitBtn8Click(Sender: TObject);
begin
Module1.TCLIENT.Next;
end;

procedure TFCLIENT.BitBtn9Click(Sender: TObject);
begin
Module1.TCLIENT.Prior;
end;

procedure TFCLIENT.BitBtn10Click(Sender: TObject);
begin
Module1.TCLIENT.First;
end;

procedure TFCLIENT.BitBtn3Click(Sender: TObject);
begin
if MessageDlg('Confirmer la suppression .  Qui?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then module1.TCLIENT.Delete;
end;

end.
