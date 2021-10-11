unit Cree_Fact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFCree_Fact = class(TForm)
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    Edit2: TEdit;
    MaskEdit2: TMaskEdit;
    Label5: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FCree_Fact: TFCree_Fact;

implementation

uses MODULE_TABLE, Liste_Fact;

{$R *.dfm}

procedure TFCree_Fact.BitBtn1Click(Sender: TObject);
var xnet,xht,xtva,xautre_taux,xttc,xtaux1,xtaux2,xtaux3:real;
    xaffaire:string;
begin
xht:=0;
xttc:=0;
xtva:=0;
xnet:=0;
xtaux1:=0;
xtaux2:=0;
xtaux3:=0;
xautre_taux:=0;
Module1.TFACTURE.IndexName:='Nattach1';
if module1.TFACTURE.findkey([module1.tattach.fieldvalues['nattach']]) then
   begin
    ShowMessage('La Facture de cette attachement Existe Déja...');
    edit1.SetFocus;
    exit;
  end;
Module1.TFACTURE.IndexFieldNames:='Nfact';
if module1.TFACTURE.findkey([edit1.Text]) then
   begin
    ShowMessage('Cette Facture Existe Déja...');
    edit1.SetFocus;
  end
  else  begin
    XAffaire:=module1.TATTACH.FieldValues['naffaire'];
    Module1.TFACTURE.First;  /// MARQU2E LA DERNIERE FACTURE
      WHILE NOT Module1.TFACTURE.Eof DO
          BEGIN
               if Module1.TFACTURE.FieldByName('nAFFAIRE').AsString=XAFFAIRE then
                    if Module1.TFACTURE.FieldByName('dernier').AsString='O' then
                          begin
                            Module1.TFACTURE.Edit;
                            Module1.TFACTURE.FieldByName('dernier').AsString:='N';
                            Module1.TFACTURE.post;
                          end;
               Module1.TFACTURE.next;
           end;
    Module1.TFACTURE.Insert;
    Module1.TFACTURE.FieldValues['NATTach']:=module1.TATTACH.FieldValues['nattach'];
    Module1.TFACTURE.FieldValues['naffaire']:=module1.TATTACH.FieldValues['naffaire'];
    Module1.TFACTURE.FieldValues['nfact']:=edit1.Text;
    Module1.TFACTURE.FieldValues['vref']:=edit2.Text;
    try        //Controler  la validet
      Module1.TFACTURE.FieldValues['Date_fact']:=Maskedit1.text;
      Module1.TFACTURE.FieldValues['date1']:=Maskedit1.text;
      except
       ShowMessage('Date Incorrect');
       exit;
    end;
    Module1.TFACTURE.FieldValues['nref']:=edit3.Text;
    Module1.TFACTURE.FieldValues['dernier']:='O';
    Module1.TFACTURE.post;
    Module1.TLIGNE_ATTCH.First;
 while not module1.TLIGNE_ATTCH.Eof do begin
    module1.TLIGNE_FACT.Insert;
    module1.TLIGNE_FACT.FieldValues['nligne']:=module1.TLIGNE_ATTCH.FieldValues['nposte'];
    module1.TLIGNE_FACT.FieldValues['desig_fact']:=module1.TLIGNE_ATTCH.FieldValues['desig_post'];
    module1.TLIGNE_FACT.FieldValues['um']:=module1.TLIGNE_ATTCH.FieldValues['um'];
    module1.TLIGNE_FACT.FieldValues['pu']:=module1.TLIGNE_ATTCH.FieldValues['pu'];
    module1.TLIGNE_FACT.FieldValues['qte']:=module1.TLIGNE_ATTCH.FieldValues['qte'];
    module1.TLIGNE_FACT.FieldValues['Montant']:=module1.TLIGNE_ATTCH.FieldValues['total'];
    module1.TLIGNE_FACT.FieldValues['nfact']:=edit1.Text;
    module1.TLIGNE_FACT.FieldValues['naffaire']:=xaffaire;
    xht:=xht+module1.TLIGNE_ATTCH.FieldValues['total'];
    module1.TLIGNE_FACT.post;
    module1.TLIGNE_ATTCH.Next;
 end;
 xtva:=(xht*17)/100;
 xttc:=xtva+xht;
 Module1.TAFFAIRE.FindKey([xaffaire]);
 xtaux1:=(xttc*Module1.TAFFAIRE.FieldByName('taux_forf').AsCurrency )/100;
 xtaux2:=(xttc*Module1.TAFFAIRE.FieldByName('taux_appros').AsCurrency)/100;
 xtaux3:=(xttc*Module1.TAFFAIRE.FieldByName('taux_garentie').AsCurrency)/100;
 xautre_taux:=(xttc*Module1.TAFFAIRE.FieldByName('autre_taux').AsCurrency )/100;
 xnet:=xttc-xtaux1-xtaux2-xtaux3-xautre_taux;
  Module1.TFACTURE.Edit;
  Module1.TFACTURE.FieldByName('mont_ht').AsCurrency:=xht;
  Module1.TFACTURE.FieldByName('tva').AsCurrency:=xtva;
  Module1.TFACTURE.FieldByName('mont_ttc').AsCurrency:=xttc;
  Module1.TFACTURE.FieldByName('taux1').AsCurrency:=xtaux1;
  Module1.TFACTURE.FieldByName('taux2').AsCurrency:=xtaux2;
  Module1.TFACTURE.FieldByName('taux3').AsCurrency:=xtaux3;
  Module1.TFACTURE.FieldByName('autre_taux').AsCurrency:=xautre_taux;
  Module1.TFACTURE.FieldByName('net').AsCurrency:=xnet;
  Module1.TFACTURE.post;
 ShowMessage('Facture Crée');
  end;

end;

procedure TFCree_Fact.BitBtn3Click(Sender: TObject);
begin
FListe_fact.showmodal;
end;

end.
