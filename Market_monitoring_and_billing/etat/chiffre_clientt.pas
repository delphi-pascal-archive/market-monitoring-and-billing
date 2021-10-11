unit chiffre_clientt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  Tchiffre_client = class(TQuickRep)
    SummaryBand1: TQRBand;
    QRShape14: TQRShape;
    QRShape13: TQRShape;
    QRShape12: TQRShape;
    QRShape11: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    DetailBand1: TQRBand;
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
    QRShape15: TQRShape;
    QRLabel13: TQRLabel;
    QRShape16: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  chiffre_client: Tchiffre_client;

implementation

uses Menu;

{$R *.DFM}

procedure Tchiffre_client.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
QRLabel10.Caption:=xnom_client;
end;

end.
