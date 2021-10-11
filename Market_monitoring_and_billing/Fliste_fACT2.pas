unit Fliste_fACT2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TListe_Fact2 = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Liste_Fact2: TListe_Fact2;

implementation

{$R *.dfm}

end.
