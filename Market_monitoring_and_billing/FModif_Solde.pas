unit FModif_Solde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TModif_Solde = class(TForm)
    Panel1: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit14: TDBEdit;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Modif_Solde: TModif_Solde;

implementation

{$R *.dfm}

end.
