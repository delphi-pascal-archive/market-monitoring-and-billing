unit Liste_devis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TFListe_Devis = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FListe_Devis: TFListe_Devis;

implementation

{$R *.dfm}

end.
