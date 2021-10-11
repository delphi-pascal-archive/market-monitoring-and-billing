unit FImp_Facture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Mask;

type
  TImp_Facture = class(TForm)
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
    Label6: TLabel;
    Edit4: TEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Imp_Facture: TImp_Facture;
  xval:string;
implementation

{$R *.dfm}
uses module_table,EETAT_FACTURE, FListe_Fact3, Menu, facture_avance;


procedure TImp_Facture.SpeedButton2Click(Sender: TObject);
begin
close;
end;

procedure TImp_Facture.SpeedButton1Click(Sender: TObject);
var xttc,xmontht,xtaux:real;
    xn,xn1:string;

begin
if edit1.Text='' then
   begin
    ShowMessage('Entrez le N°Facture');
    edit1.SetFocus;
    EXIT;
   end;
   If not MODULE1.TFACT.FindKey([edit1.text]) then
   begin
  //création de la  facture c'est elle n'existe pas
   if RadioGroup1.Items[RadioGroup1.ItemIndex] = 'Avance Forfaitaire' then
       xtaux:=module1.TAFFAIRE.fieldbyname('Autre_taux').AsCurrency;
   if RadioGroup1.Items[RadioGroup1.ItemIndex] = 'Avance Sur Appros' then
       xtaux:=module1.TAFFAIRE.fieldbyname('Autre_taux').AsCurrency;
   if RadioGroup1.Items[RadioGroup1.ItemIndex] = 'Avance sur la commande' then
       xtaux:=module1.TAFFAIRE.fieldbyname('Autre_taux').AsCurrency;
               //-------REMPLIRE LE FICHEIR   FACT
        MODULE1.TFACT.Insert;
        MODULE1.TFACT.FieldByName('date').AsString:=MaskEdit1.text;
        MODULE1.TFACT.FieldByName('nfact').AsString:=edit1.text;
        MODULE1.TFACT.FieldByName('naffaire').AsString:=
        Module1.TAFFAIRE.FieldValues['naffaire'];
        MODULE1.TFACT.FieldByName('num').AsString:=
        Module1.TAFFAIRE.FieldValues['num'];
        MODULE1.TFACT.post;
        //-------REMPLIRE LE FICHEIR FACTURE 2
        MODULE1.TFACTURE2.Insert;
        MODULE1.TFACTURE2.FieldByName('nfact').AsString:=edit1.text;
        MODULE1.TFACTURE2.FieldByName('naffaire').AsString:=
        Module1.TAFFAIRE.FieldValues['naffaire'];
        MODULE1.TFACTURE2.post;
        //---------------
        MODULE1.TFACTURE2.Insert;
        MODULE1.TFACTURE2.FieldByName('nfact').AsString:=edit1.text;
        MODULE1.TFACTURE2.FieldByName('naffaire').AsString:=
        Module1.TAFFAIRE.FieldValues['naffaire'];
        MODULE1.TFACTURE2.FieldByName('desig').AsString:='MONTANT DU MARCHE EN HT';
        MODULE1.TFACTURE2.post;
        //---------------------
        MODULE1.TFACTURE2.Insert;
        MODULE1.TFACTURE2.FieldByName('nfact').AsString:=edit1.text;
        MODULE1.TFACTURE2.FieldByName('naffaire').AsString:=Module1.TAFFAIRE.FieldValues['naffaire'];
        MODULE1.TFACTURE2.FieldByName('num').AsString:=Module1.TAFFAIRE.FieldValues['num'];
        xmontht:=module1.TAFFAIRE.fieldbyname('mont_ht').AsCurrency;
        xn:=floattostr(xmontht);
        xn1:=formatfloat('## ### ### ###.00',strtofloat(xn));
        MODULE1.TFACTURE2.FieldByName('desig').AsString:='                     '+xn1;
        MODULE1.TFACTURE2.post;
         //----------ARTICLE 14 PAGE 16
        MODULE1.TFACTURE2.Insert;
        MODULE1.TFACTURE2.FieldByName('nfact').AsString:=edit1.text;
        MODULE1.TFACTURE2.FieldByName('naffaire').AsString:=
        Module1.TAFFAIRE.FieldValues['naffaire'];
        MODULE1.TFACTURE2.FieldByName('num').AsString:=
        Module1.TAFFAIRE.FieldValues['num'];
        MODULE1.TFACTURE2.FieldByName('desig').AsString:='MODALITES DE PAIEMENT :'+'  '+edit4.Text;
        MODULE1.TFACTURE2.post;
         //----------
        MODULE1.TFACTURE2.Insert;
        MODULE1.TFACTURE2.FieldByName('nfact').AsString:=edit1.text;
        MODULE1.TFACTURE2.FieldByName('naffaire').AsString:=
        Module1.TAFFAIRE.FieldValues['naffaire'];
        MODULE1.TFACTURE2.FieldByName('num').AsString:=
        Module1.TAFFAIRE.FieldValues['num'];
        MODULE1.TFACTURE2.FieldByName('desig').AsString:=AnsiUpperCase(RadioGroup1.Items[RadioGroup1.ItemIndex]+'    '+floattostr(xtaux)+' %');
        MODULE1.TFACTURE2.post;
         //---------------------  XX
        xmontht:=module1.TAFFAIRE.fieldbyname('mont_ht').AsCurrency;
        xn:=floattostr(xmontht);
        xn1:=formatfloat('## ### ### ###.00',strtofloat(xn));

        //tva
        MODULE1.TFACT.edit;
        xmontht:=(xmontht*xtaux)/100;
        xtaux:=(xmontht*17)/100;
        xttc:=xmontht+xtaux;
        MODULE1.TFACT.FieldByName('mont_ht').AsCurrency:=xmontht;
        MODULE1.TFACT.FieldByName('tva').AsCurrency:=xtaux;
        MODULE1.TFACT.FieldByName('mont_ttc').AsCurrency:=xttc;
        xval:=convertir(((xttc*17)/100)+((xmontht*xtaux)/100));
        MODULE1.TFACT.FieldByName('Arrete').AsString:=AnsiUpperCase(xval);
        MODULE1.TFACT.post;
        //Impression de la facture
       end else begin
        fact_avance.Query1.Active:=false;
        fact_avance.Query1.Active:=true;
         With  fact_avance.Query1 do
         begin
          Close;
          Unprepare;
          ParamByName('xnfacture').AsString :=edit1.Text;
          Prepare;
          Open;
          fact_avance.Preview;
          exit;
         end;
       end;

End;
procedure TImp_Facture.SpeedButton3Click(Sender: TObject);
begin
 IF MODULE1.TFACT.FindKey([edit1.text]) then
     begin
    etat_facture.Query1.Active:=false;
    etat_facture.Query1.Active:=true;
     With  etat_facture.Query1 do
      begin
        Close;
        Unprepare;
        ParamByName('xnfact').AsString :=edit1.Text;
        Prepare;
        Open;
        etat_facture.Print;
        exit;
      end;
     end;
end;

procedure TImp_Facture.SpeedButton4Click(Sender: TObject);
begin
if Liste_Fact3.showmodal=mrok then
 edit1.Text:=module1.tfact.fieldbyname('nfact').asstring;
end;

End.
