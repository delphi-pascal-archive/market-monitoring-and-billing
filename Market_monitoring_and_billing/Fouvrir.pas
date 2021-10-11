unit Fouvrir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TOvrire = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Ovrire: TOvrire;

implementation

uses MODULE_TABLE, Menu, AFFAIRE, LISTE_AFFAIRE2;

{$R *.dfm}

procedure TOvrire.Button1Click(Sender: TObject);
begin
  module1.TAFFAIRE.Active:=true;
  xnaffaire:=edit1.Text;
if module1.TAFFAIRE.FindKey([xnaffaire]) then
 begin
  module1.TCLIENT.Active:=true;
  module1.TAFFAIRE.Filter:='naffaire = ' + Quotedstr(xnaffaire);
  module1.TAFFAIRE.Filtered:=true;
  module1.TLIGNE_DEVIS.Active:=true;
  module1.TATTACH.Active:=true;
  module1.TATTACH.Filter:='naffaire = ' + Quotedstr(xnaffaire);
  module1.TATTACH.Filtered:=true;
  module1.TFACT.Active:=true;
  module1.TFACT.Filter:='naffaire = ' + Quotedstr(xnaffaire);
  module1.TFACT.Filtered:=true;
  module1.TFACTURE.Active:=true;
  module1.TLIGNE_FACT.Filtered:=true;
  module1.TLIGNE_FACT.Active:=true;
  module1.TLIGNE_FACT.Filter:='naffaire = ' + Quotedstr(xnaffaire);
  module1.TLIGNE_attch.Filtered:=true;
  module1.TLIGNE_attch.Active:=true;
  module1.TLIGNE_attch.Filter:='naffaire = ' + Quotedstr(xnaffaire);
  //active les menus
  fmenu.Fichier1.Enabled:=true;
  fmenu.SuiviMarch1.Enabled:=true;
  fmenu.Comptabilite1.Enabled:=true;
  fmenu.Editions1.Enabled:=true;
  fmenu.Outils1.Enabled:=true;
  fmenu.Aide.Enabled:=true;
  fmenu.BitBtn8.Enabled:=true;
  fmenu.BitBtn7.Enabled:=true;
  fmenu.BitBtn6.Enabled:=true;
  fmenu.BitBtn11.Enabled:=true;
  close;
 end else begin module1.TAFFAIRE.Active:=false; showmessage('Affaire Introuvable'); end;
end;

procedure TOvrire.Button2Click(Sender: TObject);
begin
Module1.TAFFAIRE.Active:=true;
faffaire.ShowModal;
edit1.Text:=Module1.TAFFAIRE.fieldbyname('naffaire').AsString;
Module1.TAFFAIRE.Active:=false;
end;
procedure TOvrire.SpeedButton1Click(Sender: TObject);
begin
IF Fliste_affaire2.ShowModal=mrok then
   edit1.Text:=module1.TAFFAIRE.fieldbyname('naffaire').AsString;
end;

end.
