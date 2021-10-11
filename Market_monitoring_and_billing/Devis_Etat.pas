unit Devis_Etat;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TEtat_Devis = class(TQuickRep)
    Table1: TTable;
    Table2: TTable;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    Table2Ligne: TAutoIncField;
    Table2Nligne_devis: TStringField;
    Table2Um: TStringField;
    Table2Pu: TFloatField;
    Table2Qte: TFloatField;
    Table2Total: TFloatField;
    Table2Naffaire: TStringField;
    Table2affaire: TStringField;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    Table1Naffaire: TStringField;
    Table1Ncontrat: TStringField;
    Table1Objetcontrat: TMemoField;
    Table1Num: TStringField;
    Table1Mont_ht: TFloatField;
    Table1Mont_tva: TFloatField;
    Table1Mont_ttc: TFloatField;
    Table1Taux_Forf: TFloatField;
    Table1Taux_appros: TFloatField;
    Table1Taux_garentie: TFloatField;
    Table1Taux_tva: TFloatField;
    Table1Banque: TStringField;
    Table1Rembours: TStringField;
    Table1Date_sig1: TDateField;
    Table1Date_sig2: TDateField;
    Table1Delai_realis: TStringField;
    Table1Debut_trav: TDateField;
    Table1Fin_trav: TDateField;
    Table1Nods: TStringField;
    Table1Type_ode: TStringField;
    Table1Date_ods: TDateField;
    Table1Clause: TMemoField;
    Table1Declarations: TMemoField;
    Table1Ht: TFloatField;
    Table1Tva: TFloatField;
    Table1Ttc: TFloatField;
    Table1Obs: TMemoField;
    Table2ht: TFloatField;
    Table2tva: TFloatField;
    Table2ttc: TFloatField;
    Table2chiffre: TStringField;
    Table2Desig_devis: TStringField;
    Table2Fdfer: TStringField;
    QRDBText7: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel16: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Etat_Devis: TEtat_Devis;

implementation

uses MODULE_TABLE;

{$R *.DFM}

procedure TEtat_Devis.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var xnclient:string;
begin
//  xnclient:=module1.TAFFAIRE.fieldbyname('num').AsString;
//  Module1.TCLIENT.FindKey([xnclient]) ;
//  QRLabel15.Caption:=module1.TCLIENT.fieldbyname('nom').AsString;

end;

end.
