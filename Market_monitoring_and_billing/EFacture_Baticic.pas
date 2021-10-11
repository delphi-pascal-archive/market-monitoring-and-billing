unit EFacture_Baticic;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, DB, DBTables;

type
  TFacture_Baticic = class(TQuickRep)
    DetailBand1: TQRBand;
    TEtat_Facture: TTable;
    TEtat_FactureNum_ligne: TStringField;
    TEtat_FactureNaffaire: TStringField;
    TEtat_FactureNfact: TStringField;
    TEtat_FactureUm: TStringField;
    TEtat_FactureDsig: TStringField;
    TEtat_FactureQte: TFloatField;
    TEtat_FacturePu: TFloatField;
    TEtat_FactureMontant: TFloatField;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    TEtat_FactureLigne: TAutoIncField;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData2: TQRSysData;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Facture_Baticic: TFacture_Baticic;

implementation

uses MODULE_TABLE, Facure_Travaux, Menu;

{$R *.DFM}

procedure TFacture_Baticic.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var  xnclient:string[10];
begin
  Module1.TFACTURE.FindKey([xnfact]);
  qrlabel3.Caption:=Module1.TFACTURE.fieldbyname('vref').AsString;
  qrlabel5.Caption:=Module1.TFACTURE.fieldbyname('date1').AsString;
  qrlabel4.Caption:=Module1.TFACTURE.fieldbyname('nref').AsString;
  Module1.TAFFAIRE.FindKey([xnaffaire]);
  xnclient:=Module1.TAFFAIRE.fieldbyname('num').AsString;
  Module1.TCLIENT.FindKey([xnclient]);
  qrlabel1.Caption:=Module1.TCLIENT.fieldbyname('nom').AsString;
  qrlabel2.Caption:=Module1.TCLIENT.fieldbyname('adresse1').AsString;
  qrlabel6.Caption:=Module1.TCLIENT.fieldbyname('adresse2').AsString;
end;

end.
