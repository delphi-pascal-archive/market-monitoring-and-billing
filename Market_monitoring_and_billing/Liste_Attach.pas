unit Liste_Attach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TFListe_Attach = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  FListe_Attach: TFListe_Attach;

implementation

{$R *.dfm}

end.
