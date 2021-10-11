        unit DEVIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ExtCtrls, Buttons,
  DBActns, ActnList, ImgList;

type
  TFDEVIS = class(TForm)
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    ImageList1: TImageList;
    ActionList1: TActionList;
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
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    BitBtn8: TBitBtn;
    Bevel1: TBevel;
    Label15: TLabel;
    Image1: TImage;
    Label14: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FDEVIS: TFDEVIS;

implementation

uses MODULE_TABLE, LISTE_AFFAIRE, imprime_facture, Devis_Etat, Menu;

{$R *.dfm}

procedure TFDEVIS.BitBtn1Click(Sender: TObject);
var xht,xtva,xttc:real;
begin
xht:=0;
xtva:=0;
xttc:=0;
//Calculer le Montant TTC d'un Devis
 module1.TLIGNE_DEVIS.First;
 While not module1.TLIGNE_DEVIS.Eof do
      begin
       xht:=xht+ module1.TLIGNE_DEVIS.FieldValues['total'];
       Module1.TLIGNE_DEVIS.next;
     End;
     xtva:=(xht*17)/100;
     xttc:=xht+xtva;
      module1.TAFFAIRE.Edit;
      module1.TAFFAIRE.FieldValues['ht']:=xht;
      module1.TAFFAIRE.FieldValues['tva']:=xtva;
      module1.TAFFAIRE.FieldValues['ttc']:=xttc;
      module1.TAFFAIRE.Post;
      module1.TAFFAIRE.Refresh;
      module1.TLIGNE_DEVIS.Refresh;
     etat_devis.Table1.Active:=false;
     etat_devis.Table2.Active:=false;
     etat_devis.Table1.Active:=true;
     etat_devis.Table2.Active:=true;

     etat_devis.Table2.Filter:='naffaire=' + QUOTEDSTR(dbedit1.text);
     etat_devis.Table2.FILTeRED:=true;
     etat_devis.Preview;

end;

procedure TFDEVIS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_F2 then
 winexec('calc.exe',sw_showdefault);
end;

procedure TFDEVIS.SpeedButton7Click(Sender: TObject);
begin
module1.TLIGNE_DEVIS.Append;
end;

procedure TFDEVIS.SpeedButton6Click(Sender: TObject);
begin
if MessageDlg('Confirmer la suppression .  Qui?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then module1.TLIGNE_DEVIS.Delete;;

end;

end.
