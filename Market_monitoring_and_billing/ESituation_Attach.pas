unit ESituation_Attach;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, jpeg;

type
  TSituation_Attach = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText9: TQRDBText;
    QUERY1: TQuery;
    QUERY1Nposte: TStringField;
    QUERY1Desig_post: TStringField;
    QUERY1Um: TStringField;
    QUERY1Qte: TFloatField;
    QUERY1Nattach: TStringField;
    QUERY1Cumule: TFloatField;
    QUERY1Qte_prev: TFloatField;
    QUERY1naffaire: TStringField;
    QRSysData1: TQRSysData;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Situation_Attach: TSituation_Attach;

implementation

uses MODULE_TABLE;

{$R *.DFM}

procedure TSituation_Attach.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  VAR xnaffaire,xnclient:string;
begin
    xnaffaire:=Module1.TATTACH.fieldbyname('naffaire').AsString;
    MODULE1.TAFFAIRE.FindKey([xnaffaire]);
    QRLabel22.Caption:=MODULE1.TAFFAIRE.fieldbyname('objet').asstring;
    xnclient:=MODULE1.TAFFAIRE.fieldbyname('num').AsString;
    QRLabel21.Caption:=module1.TCLIENT.fieldbyname('nom').AsString

end;

end.
