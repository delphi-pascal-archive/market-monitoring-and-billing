unit facture_avance;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, jpeg;

type
  Tfact_avance = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText17: TQRDBText;
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
    QRLabel2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    Query1: TQuery;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText4: TQRDBText;
    SummaryBand1: TQRBand;
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
    QRLabel22: TQRLabel;
    Query1Nfact: TStringField;
    Query1Nligne: TIntegerField;
    Query1Num: TStringField;
    Query1Naffaire: TStringField;
    Query1Desig: TStringField;
    Query1Prix_unit: TCurrencyField;
    Query1Montant: TCurrencyField;
    Query1Arrete: TMemoField;
    Query1Solde_forf: TCurrencyField;
    Query1Solde_appros: TCurrencyField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  fact_avance: Tfact_avance;

implementation

uses MODULE_TABLE, Menu;

{$R *.DFM}

procedure Tfact_avance.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabel22.Caption:=convertir(Module1.TFACT.fieldbyname('mont_ttc').AsCurrency);
end;

end.
