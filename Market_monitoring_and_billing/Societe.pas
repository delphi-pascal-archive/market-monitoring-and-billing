unit Societe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ExtDlgs;

type
  TFSociete = class(TForm)
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBImage1: TDBImage;
    OpenPictureDialog1: TOpenPictureDialog;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    DBNavigator1: TDBNavigator;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FSociete: TFSociete;

implementation

uses MODULE_TABLE;

{$R *.dfm}

procedure TFSociete.SpeedButton1Click(Sender: TObject);
begin
module1.Tsociete.Edit;
if OpenPictureDialog1.Execute then
    begin
    dbimage1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    module1.Tsociete.Post;
    end;

end;

end.
