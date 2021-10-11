unit periode_chiffre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Mask, ComCtrls;

type
  Tperiode = class(TForm)
    Panel1: TPanel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  periode: Tperiode;
  DATE1,date2 :string;
implementation

uses MODULE_TABLE, chiffre_global, chiffre_periode, EFact_vente;

{$R *.dfm}

procedure Tperiode.DateTimePicker1Change(Sender: TObject);
begin
MaskEdit1.Text:=datetostr(DateTimePicker1.date);
end;

procedure Tperiode.DateTimePicker2Change(Sender: TObject);
begin
MaskEdit2.Text:=datetostr(DateTimePicker2.date);
end;

procedure Tperiode.SpeedButton1Click(Sender: TObject);
var xx:string;
begin
module1.TEtat_Facture.Active:=true;
module1.TEtat_Facture.First;
while not module1.TEtat_Facture.Eof do
  begin
   Module1.TEtat_Facture.Delete;
  end;
  //fACTURE DES VENTES DIVERS
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT *');
  module1.ETAT.SQL.Add('FROM Facture.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfact');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfact').AsString;
     module1.TEtat_Facture.FieldByName('num').AsString:= module1.ETAT.FieldByName('num').AsString;
    xx:=module1.ETAT.FieldByName('num').AsString;
    module1.TCLIENT.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.TCLIENT.fieldbyname('nom').AsString;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('net').AsCurrency;
    module1.TEtat_Facture.FieldByName('date1').AsDateTime:=module1.ETAT.FieldByName('date_fact').AsDateTime;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('mont_encais').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=module1.ETAT.FieldByName('solde').AsCurrency;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
  //fACTURE des travaux
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT *');
  module1.ETAT.SQL.Add('FROM attachement.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfacture');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfacture').AsString;
    xx:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.affaires.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.affaires.fieldbyname('client').AsString;
     module1.TEtat_Facture.FieldByName('date1').AsDateTime:=module1.ETAT.FieldByName('date_fact').AsCurrency;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('mont_net').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('mon_encaiss').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=module1.ETAT.FieldByName('solde').AsCurrency;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
  //fACTURE des d'avoires
  module1.ETAT.SQL.Clear;
  module1.ETAT.SQL.Add('SELECT DISTINCT *');
  module1.ETAT.SQL.Add('FROM facture3.DB');
  module1.ETAT.SQL.Add('ORDER BY Nfact');
  module1.ETAT.Open;
  module1.ETAT.First;
  while not module1.ETAT.Eof do
   begin
    module1.TEtat_Facture.Insert;
    module1.TEtat_Facture.FieldByName('naffaire').AsString:=module1.ETAT.FieldByName('naffaire').AsString;
    module1.TEtat_Facture.FieldByName('nfact').AsString:= module1.ETAT.FieldByName('nfact').AsString;
    xx:=module1.ETAT.FieldByName('naffaire').AsString;    
    module1.affaires.FindKey([xx]);
    module1.TEtat_Facture.FieldByName('désig').AsString:=module1.affaires.fieldbyname('client').AsString;
    module1.TEtat_Facture.FieldByName('date1').AsDateTime:=module1.ETAT.FieldByName('date').AsDateTime;
    module1.TEtat_Facture.FieldByName('qte').AsCurrency:=module1.ETAT.FieldByName('Mont_ttc').AsCurrency;
    module1.TEtat_Facture.FieldByName('pu').AsCurrency:=module1.ETAT.FieldByName('Mont_ttc').AsCurrency;
    module1.TEtat_Facture.FieldByName('montant').AsCurrency:=0;
    module1.TEtat_Facture.Post;
    module1.ETAT.Next;
   end;
        date1:=maskedit1.Text;
        date2:=maskedit2.Text;
        chiffre_period.Query1.Active:=false;
        chiffre_period.Query1.Active:=true;
         With  chiffre_period.Query1 do
         begin
          Close;
          Unprepare;
          ParamByName('xdate').AsDate :=strtodate(maskedit1.Text);
          ParamByName('xdate1').AsDate :=strtodate(maskedit2.Text);
          Prepare;
          Open;
          chiffre_period.Preview;
          exit;
         end;

end;

end.
