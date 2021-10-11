unit Liste_Fact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TFListe_fact = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FListe_fact: TFListe_fact;

implementation

{$R *.dfm}

end.
