unit liste_client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TFListe_Client = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FListe_Client: TFListe_Client;

implementation

uses MODULE_TABLE;

{$R *.dfm}

procedure TFListe_Client.Button1Click(Sender: TObject);
var x1:string;
    xx:integer;
begin
X1:='*';
xx:=ComboBox1.itemindex;
   case xx of
   0: begin module1.TCLIENT.Filtered:=false;
       end;
    1: begin module1.TCLIENT.filter:='nom = ' + QUOTEDSTR((edit1.text)+x1);
       module1.TCLIENT.FILTeRED:=true;
       end;
    2: begin module1.TCLIENT.filter:='societe = ' + QUOTEDSTR((edit1.text)+x1);
       module1.TCLIENT.FILTeRED:=true;
       end
    end
end;

procedure TFListe_Client.BitBtn2Click(Sender: TObject);
var x1:string;
    xx:integer;
begin
X1:='*';
xx:=ComboBox1.itemindex;
   case xx of
   0: begin module1.TCLIENT.Filtered:=false;
       end;
    1: begin module1.TCLIENT.filter:='nom = ' + QUOTEDSTR((edit1.text)+x1);
       module1.TCLIENT.FILTeRED:=true;
       end;
    2: begin module1.TCLIENT.filter:='societe = ' + QUOTEDSTR((edit1.text)+x1);
       module1.TCLIENT.FILTeRED:=true;
       end
    end
end;

end.
