unit EFact_vente;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  Tfact_vente = class(TQuickRep)
    Query1: TQuery;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel11: TQRLabel;
    DetailBand1: TQRBand;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    Query1Ligne: TIntegerField;
    Query1Nligne: TStringField;
    Query1Desig_fact: TStringField;
    Query1Um: TStringField;
    Query1Pu: TCurrencyField;
    Query1Qte: TCurrencyField;
    Query1Montant: TCurrencyField;
    Query1Cumule: TCurrencyField;
    Query1Nfact: TStringField;
    Query1Naffaire: TStringField;
    Query1date_facture: TDateField;
    Query1ht: TCurrencyField;
    Query1TVA: TCurrencyField;
    Query1TTC: TCurrencyField;
    Query1NET: TCurrencyField;
    QRLabel22: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  fact_vente: Tfact_vente;

implementation

uses MODULE_TABLE, Menu;

{$R *.DFM}

procedure Tfact_vente.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

  QRLabel22.Caption:=convertir(query1.fieldbyname('net').AsCurrency);


end;

end.
