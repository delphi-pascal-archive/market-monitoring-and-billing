unit LISTE_AFFAIRE2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TFliste_affaire2 = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fliste_affaire2: TFliste_affaire2;

implementation

{$R *.dfm}

end.
