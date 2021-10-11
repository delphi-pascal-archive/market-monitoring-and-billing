unit imprime_facture;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QUICKRPT, QRCTRLS, ExtCtrls, jpeg;

type
  TQRMDForm = class(TForm)
    Facture_Trav: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    DetailTable: TTable;
    QRLabel2: TQRLabel;
    QRImage1: TQRImage;
    QRLabel3: TQRLabel;
    Table1: TTable;
    DetailTableLigne: TAutoIncField;
    DetailTableNligne: TStringField;
    DetailTableDesig_fact: TStringField;
    DetailTableUm: TStringField;
    DetailTablePu: TFloatField;
    DetailTableQte: TFloatField;
    DetailTableMontant: TFloatField;
    DetailTableCumule: TFloatField;
    DetailTableNfact: TStringField;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    DetailTableDATE: TDateField;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText17: TQRDBText;
    DetailTableNAFFAIRE: TStringField;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText2: TQRDBText;
    DetailTableTVA: TFloatField;
    QRDBText8: TQRDBText;
    DetailTableTTC: TFloatField;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    DetailTableNET: TFloatField;
    DetailTableTA1: TFloatField;
    DetailTableTA2: TFloatField;
    DetailTableT3: TFloatField;
    Table1Nfact: TStringField;
    Table1Date_Fact: TDateField;
    Table1Nattach: TStringField;
    Table1NAffaire: TStringField;
    Table1Mont_ht: TCurrencyField;
    Table1Tva: TCurrencyField;
    Table1Mont_ttc: TCurrencyField;
    Table1Taux1: TCurrencyField;
    Table1Taux2: TCurrencyField;
    Table1Taux3: TCurrencyField;
    Table1Net: TCurrencyField;
    Table1Dernier: TStringField;
    QRDBText14: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText18: TQRDBText;
    Table1Autre_taux: TCurrencyField;
    Table1Chiffre: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRMDForm: TQRMDForm;

implementation

{$R *.dfm}

end.
