unit Encaissement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, Grids, DBGrids, ExtCtrls,
  ComCtrls;

type
  TFEncaissement = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DateTimePicker1: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FEncaissement: TFEncaissement;

implementation

uses LISTE_AFFAIRE2, MODULE_TABLE, Liste_Fact, Fliste_fACT2, EEtat_Encaiss;

{$R *.dfm}

procedure TFEncaissement.BitBtn1Click(Sender: TObject);
begin
IF Fliste_AFFAIRE2.showmodal=mrOk then
  dbedit3.Text:=MODULE1.taffaire.FieldValues['naffaire'] ;
  dbmemo1.Text:=MODULE1.TAFFAIRE.FieldValues['Objet contrat'] ;
end;

procedure TFEncaissement.BitBtn7Click(Sender: TObject);
begin
Etat_Encaiss.PREVIEW;
end;

procedure TFEncaissement.DateTimePicker1Change(Sender: TObject);
begin
dbedit2.Text:=datetostr(DateTimePicker1.Date);
end;

end.
