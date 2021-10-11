unit chiffre_global;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  Tchiffre_glob = class(TQuickRep)
    Query1: TQuery;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
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
    QRSysData1: TQRSysData;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRShape3: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape14: TQRShape;
    QRShape13: TQRShape;
    QRShape12: TQRShape;
    QRShape11: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRSysData2: TQRSysData;
    Query1Nfact: TStringField;
    Query1Dsig: TStringField;
    Query1Qte: TFloatField;
    Query1Pu: TFloatField;
    Query1Montant: TFloatField;
    Query1naffaire: TStringField;
  private

  public

  end;

var
  chiffre_glob: Tchiffre_glob;

implementation

uses MODULE_TABLE;

{$R *.DFM}

end.
