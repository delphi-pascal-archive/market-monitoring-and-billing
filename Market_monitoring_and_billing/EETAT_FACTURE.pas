unit EETAT_FACTURE;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TEtat_Facture = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    Query1: TQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    Query1Nligne: TIntegerField;
    Query1Nfact: TStringField;
    Query1Date: TDateField;
    Query1Num: TStringField;
    Query1Naffaire: TStringField;
    Query1Desig: TStringField;
    Query1Prix_unit: TCurrencyField;
    Query1Montant: TCurrencyField;
    Query1Arrete: TMemoField;
    Table1: TTable;
    Query1client: TStringField;
    Query1adresse_client: TStringField;
    Query1adressesuit: TStringField;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    Table2: TTable;
    Table2Nfact: TStringField;
    Table2Date: TDateField;
    Table2Naffaire: TStringField;
    Table2Num: TStringField;
    Table2VREF: TStringField;
    Table2DATE1: TDateField;
    Table2NREF: TStringField;
    Query1vref: TStringField;
    Query1nref: TStringField;
    Query1date1: TDateTimeField;
  private

  public

  end;

var
  Etat_Facture: TEtat_Facture;

implementation

{$R *.DFM}

end.
