unit MODULE_TABLE;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TModule1 = class(TDataModule)
    TCLIENT: TTable;
    TAFFAIRE: TTable;
    TLIGNE_DEVIS: TTable;
    TATTACH: TTable;
    TLIGNE_ATTCH: TTable;
    TFACTURE: TTable;
    TLIGNE_FACT: TTable;
    Dtaffaire: TDataSource;
    Dtclient: TDataSource;
    Dt_ligneDevis: TDataSource;
    Dt_attach: TDataSource;
    Dt_ligneAttach: TDataSource;
    DT_FACTURE: TDataSource;
    Dt_ligneFact: TDataSource;
    TAFFAIRENaffaire: TStringField;
    TAFFAIRENcontrat: TStringField;
    TAFFAIREObjetcontrat: TMemoField;
    TAFFAIREMont_ht: TFloatField;
    TAFFAIREMont_tva: TFloatField;
    TAFFAIREMont_ttc: TFloatField;
    TAFFAIRETaux_Forf: TFloatField;
    TAFFAIRETaux_appros: TFloatField;
    TAFFAIRETaux_garentie: TFloatField;
    TAFFAIRETaux_tva: TFloatField;
    TAFFAIREBanque: TStringField;
    TAFFAIRERembours: TStringField;
    TAFFAIREDate_sig1: TDateField;
    TAFFAIREDate_sig2: TDateField;
    TAFFAIREDelai_realis: TStringField;
    TAFFAIREDebut_trav: TDateField;
    TAFFAIREFin_trav: TDateField;
    TAFFAIRENods: TStringField;
    TAFFAIREType_ode: TStringField;
    TAFFAIREDate_ods: TDateField;
    TAFFAIREClause: TMemoField;
    TAFFAIREDeclarations: TMemoField;
    TCLIENTNom: TStringField;
    TCLIENTSociete: TStringField;
    TCLIENTADRESSE1: TStringField;
    TCLIENTADRESSE2: TStringField;
    TCLIENTCOD_pos: TStringField;
    TCLIENTPays: TStringField;
    TCLIENTVille: TStringField;
    TCLIENTTel: TStringField;
    TCLIENTGsm: TStringField;
    TCLIENTFax: TStringField;
    TCLIENTEmail: TStringField;
    TCLIENTObs: TMemoField;
    TAFFAIREclient: TStringField;
    TATTACHNAVISEXP: TStringField;
    TATTACHDate_attach: TDateField;
    TATTACHDate_exp: TDateField;
    TATTACHNAFFAIRE: TStringField;
    TATTACHlib_affaire: TStringField;
    TLIGNE_ATTCHLigne: TAutoIncField;
    TLIGNE_ATTCHNposte: TStringField;
    TLIGNE_ATTCHUm: TStringField;
    TLIGNE_ATTCHPu: TFloatField;
    TLIGNE_ATTCHQte: TFloatField;
    TLIGNE_ATTCHTotal: TFloatField;
    TLIGNE_ATTCHNaffaire: TStringField;
    TFACTURENfact: TStringField;
    TFACTUREDate_Fact: TDateField;
    TFACTURENattach: TStringField;
    TFACTURENAffaire: TStringField;
    TFACTUREMont_ht: TFloatField;
    TFACTURETva: TFloatField;
    TFACTUREMont_ttc: TFloatField;
    TFACTUREDernier: TStringField;
    TLIGNE_FACTLigne: TAutoIncField;
    TLIGNE_FACTNligne: TStringField;
    TLIGNE_FACTUm: TStringField;
    TLIGNE_FACTPu: TFloatField;
    TLIGNE_FACTQte: TFloatField;
    TLIGNE_FACTMontant: TFloatField;
    TLIGNE_FACTCumule: TFloatField;
    TLIGNE_FACTNfact: TStringField;
    TFACTURENet: TFloatField;
    TAFFAIREHt: TFloatField;
    TAFFAIRETva: TFloatField;
    TAFFAIRETtc: TFloatField;
    TAFFAIREObs: TMemoField;
    TLIGNE_FACTNaffaire: TStringField;
    TEtat_Facture: TTable;
    Dt_TEtatFacture: TDataSource;
    TEtat_FactureNum_ligne: TStringField;
    TEtat_FactureNaffaire: TStringField;
    TEtat_FactureNfact: TStringField;
    TEtat_FactureUm: TStringField;
    TEtat_FactureDsig: TStringField;
    TEtat_FactureQte: TFloatField;
    TEtat_FacturePu: TFloatField;
    TEtat_FactureMontant: TFloatField;
    Tab_Attach: TTable;
    Tab_AttachNATTACH: TStringField;
    Tab_AttachNAVISEXP: TStringField;
    Tab_AttachDate_attach: TDateField;
    Tab_AttachDate_exp: TDateField;
    Tab_AttachNAFFAIRE: TStringField;
    TLIGNE_DEVISLigne: TAutoIncField;
    TLIGNE_DEVISNligne_devis: TStringField;
    TLIGNE_DEVISUm: TStringField;
    TLIGNE_DEVISPu: TFloatField;
    TLIGNE_DEVISQte: TFloatField;
    TLIGNE_DEVISTotal: TFloatField;
    TLIGNE_DEVISNaffaire: TStringField;
    TLIGNE_DEVISHt: TFloatField;
    TLIGNE_DEVISTtc: TFloatField;
    TLIGNE_DEVISTva: TFloatField;
    TLIGNE_DEVISFdfer: TStringField;
    DEVIS: TTable;
    Ligne_attch: TTable;
    Ligne_fact: TTable;
    TAFFAIREAutre_taux: TFloatField;
    Ligne_attchLigne: TAutoIncField;
    Ligne_attchNposte: TStringField;
    Ligne_attchDesig_post: TStringField;
    Ligne_attchUm: TStringField;
    Ligne_attchPu: TCurrencyField;
    Ligne_attchQte: TFloatField;
    Ligne_attchTotal: TCurrencyField;
    Ligne_attchNaffaire: TStringField;
    Ligne_attchCumule: TFloatField;
    TLIGNE_ATTCHCumule: TFloatField;
    TLIGNE_ATTCHQte_prev: TFloatField;
    TFACTUREAutre_taux: TCurrencyField;
    TFACTUREChiffre: TMemoField;
    TFACTURE2: TTable;
    TFACT: TTable;
    TFACTNfact: TStringField;
    TFACTDate: TDateField;
    TFACTNaffaire: TStringField;
    Dt_tfact: TDataSource;
    TLIGNE_DEVISDesig_devis: TStringField;
    TLIGNE_ATTCHDesig_post: TStringField;
    TLIGNE_FACTDesig_fact: TStringField;
    Ligne_factLigne: TAutoIncField;
    Ligne_factNligne: TStringField;
    Ligne_factDesig_fact: TStringField;
    Ligne_factUm: TStringField;
    Ligne_factPu: TCurrencyField;
    Ligne_factQte: TCurrencyField;
    Ligne_factMontant: TCurrencyField;
    Ligne_factCumule: TCurrencyField;
    Ligne_factNfact: TStringField;
    Ligne_factNaffaire: TStringField;
    DEVISLigne: TAutoIncField;
    DEVISNligne_devis: TStringField;
    DEVISDesig_devis: TStringField;
    DEVISUm: TStringField;
    DEVISPu: TFloatField;
    DEVISQte: TFloatField;
    DEVISTotal: TFloatField;
    DEVISNaffaire: TStringField;
    DEVISHt: TFloatField;
    DEVISTtc: TFloatField;
    DEVISTva: TFloatField;
    DEVISFdfer: TStringField;
    TFACTVREF: TStringField;
    TFACTDATE1: TDateField;
    TFACTNREF: TStringField;
    TAFFAIREObjet: TStringField;
    TFACTURE2Nligne: TAutoIncField;
    TFACTURE2Nfact: TStringField;
    TFACTURE2Date: TDateField;
    TFACTURE2Naffaire: TStringField;
    TFACTURE2Desig: TStringField;
    TFACTURE2Prix_unit: TCurrencyField;
    TFACTURE2Montant: TCurrencyField;
    TFACTURE2Arrete: TMemoField;
    TFACTUREDate1: TDateField;
    TCLIENTNUM: TAutoIncField;
    TAFFAIRENum: TStringField;
    TFACTURE2Num: TStringField;
    TFACTNum: TStringField;
    TCLIENTNcompte: TStringField;
    TCLIENTNregistre: TStringField;
    TCLIENTNarticle: TStringField;
    TCLIENTCode_fiscal: TStringField;
    TLIGNE_ATTCHNattach: TStringField;
    TATTACHNattach: TAutoIncField;
    TATTACHNATTACH2: TStringField;
    Ligne_attchQte_prev: TCurrencyField;
    Ligne_attchNattach: TStringField;
    TFACTURE2Solde_forf: TCurrencyField;
    TFACTURE2Solde_appros: TCurrencyField;
    TFACTURElibelle_Affaire: TStringField;
    TFACTURESolde_cde: TCurrencyField;
    TAFFAIRETx_remb: TCurrencyField;
    TATTACHNFACTURE: TStringField;
    TATTACHMon_encaiss: TCurrencyField;
    TATTACHMont_net: TCurrencyField;
    TATTACHSolde: TCurrencyField;
    TATTACHDate_fact: TDateField;
    TFACTTva: TCurrencyField;
    TFACTMont_ht: TCurrencyField;
    TFACTMont_ttc: TCurrencyField;
    TFACTArrete: TMemoField;
    Dt_societe: TDataSource;
    Tsociete: TTable;
    TFACTUREMont_encais: TCurrencyField;
    TFACTURESolde: TCurrencyField;
    TFACTURETaux1: TCurrencyField;
    TFACTURETaux2: TCurrencyField;
    TFACTURETaux3: TCurrencyField;
    TFACTUREVref: TStringField;
    TFACTURENref: TStringField;
    TFACTURESolde_forf: TCurrencyField;
    TFACTURESolde_appros: TCurrencyField;
    TATTACHTva: TCurrencyField;
    TATTACHTtc: TCurrencyField;
    TATTACHHt: TCurrencyField;
    TLIGNE_ATTCHNfact: TStringField;
    ETAT: TQuery;
    affaires: TTable;
    TEtat_FactureLigne: TAutoIncField;
    affairesNaffaire: TStringField;
    affairesNcontrat: TStringField;
    affairesObjetcontrat: TMemoField;
    affairesObjet: TStringField;
    affairesNum: TStringField;
    affairesMont_ht: TFloatField;
    affairesMont_tva: TFloatField;
    affairesMont_ttc: TFloatField;
    affairesTaux_Forf: TFloatField;
    affairesTaux_appros: TFloatField;
    affairesTaux_garentie: TFloatField;
    affairesTaux_tva: TFloatField;
    affairesAutre_taux: TFloatField;
    affairesBanque: TStringField;
    affairesRembours: TStringField;
    affairesDate_sig1: TDateField;
    affairesDate_sig2: TDateField;
    affairesDelai_realis: TStringField;
    affairesDebut_trav: TDateField;
    affairesFin_trav: TDateField;
    affairesNods: TStringField;
    affairesType_ode: TStringField;
    affairesDate_ods: TDateField;
    affairesClause: TMemoField;
    affairesDeclarations: TMemoField;
    affairesHt: TFloatField;
    affairesTva: TFloatField;
    affairesTtc: TFloatField;
    affairesTx_remb: TCurrencyField;
    affairesObs: TMemoField;
    affairesclient: TStringField;
    TEtat_FactureDate1: TDateField;
    TEtat_FactureDate2: TDateField;
    TEtat_FactureNum: TStringField;
    TFACTURENum: TStringField;
    TFACTUREclient: TStringField;
    procedure TLIGNE_DEVISBeforePost(DataSet: TDataSet);
    procedure TLIGNE_ATTCHBeforePost(DataSet: TDataSet);
    procedure TLIGNE_FACTBeforePost(DataSet: TDataSet);
    procedure TLIGNE_FACTAfterPost(DataSet: TDataSet);
    procedure TLIGNE_ATTCHAfterPost(DataSet: TDataSet);
    procedure TLIGNE_FACTAfterDelete(DataSet: TDataSet);
    procedure TLIGNE_ATTCHAfterDelete(DataSet: TDataSet);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Module1: TModule1;

implementation

uses Menu;

{$R *.dfm}

procedure TModule1.TLIGNE_DEVISBeforePost(DataSet: TDataSet);
begin
Module1.TLIGNE_DEVIS.FieldValues['total']:=module1.TLIGNE_DEVIS.FieldValues['pu']*module1.TLIGNE_DEVIS.FieldValues['qte'];
end;

procedure TModule1.TLIGNE_ATTCHBeforePost(DataSet: TDataSet);
begin
 MODULE1.TLIGNE_ATTCH.FieldValues['total']:=  MODULE1.TLIGNE_ATTCH.FieldValues['Pu']*  MODULE1.TLIGNE_ATTCH.FieldValues['qte'];
 MODULE1.TLIGNE_ATTCH.FieldValues['nfact']:=  MODULE1.TATTACH.FieldValues['nfacture'];
end;

procedure TModule1.TLIGNE_FACTBeforePost(DataSet: TDataSet);

begin
                                 MODULE1.TLIGNE_fact.FieldByName('naffaire').AsString:=xnaffaire;
 MODULE1.TLIGNE_fact.FieldByName('montant').AsString:=MODULE1.TLIGNE_fact.FieldValues['qte']*MODULE1.TLIGNE_fact.FieldValues['pu'];
end;

procedure TModule1.TLIGNE_FACTAfterPost(DataSet: TDataSet);
var xht,xtva,xttc:Currency;
begin
 xht:=0;
 xtva:=0;
 xttc:=0;
 MODULE1.TLIGNE_fact.First;
  while not MODULE1.TLIGNE_fact.Eof do
  begin
    MODULE1.TFACTURE.Edit;
     xht:= xht+MODULE1.TLIGNE_fact.FieldValues['montant'];
     MODULE1.TLIGNE_fact.Next;
  end;
 MODULE1.TFACTURE.FieldByName('mont_ht').AsCurrency:=xht;
 Xtva:=(xht*17)/100;
 MODULE1.TFACTURE.FieldByName('tva').AsCurrency:=xtva;
 xttc:=xht+xtva;
 MODULE1.TFACTURE.FieldByName('mont_ttc').AsCurrency:=xttc;
 xht:=(xttc*module1.TAFFAIRE.fieldbyname('autre_taux').AsCurrency)/100;
 MODULE1.TFACTURE.FieldByName('net').AsCurrency:=(xht/ module1.TAFFAIRE.fieldbyname('tx_remb').AsCurrency)/100;
 Module1.TFACTURE.FieldByName('solde').AsCurrency:=Module1.TFACTURE.FieldByName('net').AsCurrency-
 Module1.TFACTURE.FieldByName('mont_encais').AsCurrency;

 MODULE1.TFACTURE.Post;

end;

procedure TModule1.TLIGNE_ATTCHAfterPost(DataSet: TDataSet);
var xht,xtva,xttc:Currency;
begin
 xht:=0;
 xtva:=0;
 xttc:=0;
 MODULE1.TLIGNE_attch.First;
  while not MODULE1.TLIGNE_attch.Eof do
  begin
     MODULE1.TATTACH.Edit;
     xht:= xht+MODULE1.TLIGNE_attch.FieldValues['total'];
     MODULE1.TLIGNE_attch.Next;
  end;
 MODULE1.TATTACH.FieldByName('Ht').AsCurrency:=xht;
 Xtva:=(xht*17)/100;
 MODULE1.TATTACH.FieldByName('tva').AsCurrency:=xtva;
 xttc:=xht+xtva;
 MODULE1.TATTACH.FieldByName('ttc').AsCurrency:=xttc;
 xht:=(xttc*module1.TAFFAIRE.fieldbyname('autre_taux').AsCurrency)/100;
 MODULE1.TATTACH.FieldByName('mont_net').AsCurrency:=(xht/ module1.TAFFAIRE.fieldbyname('tx_remb').AsCurrency)/100;
 module1.TATTACH.FieldByName('solde').AsCurrency:=
 module1.TATTACH.FieldByName('mont_net').AsCurrency-
 module1.TATTACH.FieldByName('mon_encaiss').AsCurrency;
 Module1.TATTACH.post;

end;

procedure TModule1.TLIGNE_FACTAfterDelete(DataSet: TDataSet);
var xht,xtva,xttc:Currency;
begin
 xht:=0;
 xtva:=0;
 xttc:=0;
 MODULE1.TLIGNE_fact.First;
  while not MODULE1.TLIGNE_fact.Eof do
  begin
    MODULE1.TFACTURE.Edit;
     xht:= xht+MODULE1.TLIGNE_fact.FieldValues['montant'];
     MODULE1.TLIGNE_fact.Next;
  end;
 MODULE1.TFACTURE.FieldByName('mont_ht').AsCurrency:=xht;
 Xtva:=(xht*17)/100;
 MODULE1.TFACTURE.FieldByName('tva').AsCurrency:=xtva;
 xttc:=xht+xtva;
 MODULE1.TFACTURE.FieldByName('mont_ttc').AsCurrency:=xttc;
 xht:=(xttc*module1.TAFFAIRE.fieldbyname('autre_taux').AsCurrency)/100;

 MODULE1.TFACTURE.FieldByName('net').AsCurrency:=(xht/ module1.TAFFAIRE.fieldbyname('tx_remb').AsCurrency)/100;
 Module1.TFACTURE.FieldByName('solde').AsCurrency:=Module1.TFACTURE.FieldByName('net').AsCurrency-
 Module1.TFACTURE.FieldByName('mont_encais').AsCurrency;

 MODULE1.TFACTURE.Post;

end;

procedure TModule1.TLIGNE_ATTCHAfterDelete(DataSet: TDataSet);
var xht,xtva,xttc:Currency;
begin
 xht:=0;
 xtva:=0;
 xttc:=0;
 MODULE1.TLIGNE_attch.First;
  while not MODULE1.TLIGNE_attch.Eof do
  begin
     MODULE1.TATTACH.Edit;
     xht:= xht+MODULE1.TLIGNE_attch.FieldValues['total'];
     MODULE1.TLIGNE_attch.Next;
  end;
 MODULE1.TATTACH.FieldByName('Ht').AsCurrency:=xht;
 Xtva:=(xht*17)/100;
 MODULE1.TATTACH.FieldByName('tva').AsCurrency:=xtva;
 xttc:=xht+xtva;
 MODULE1.TATTACH.FieldByName('ttc').AsCurrency:=xttc;
 xht:=(xttc*module1.TAFFAIRE.fieldbyname('autre_taux').AsCurrency)/100;
 MODULE1.TATTACH.FieldByName('mont_net').AsCurrency:=(xht/ module1.TAFFAIRE.fieldbyname('tx_remb').AsCurrency)/100;
 module1.TATTACH.FieldByName('solde').AsCurrency:=
 module1.TATTACH.FieldByName('mont_net').AsCurrency-
 module1.TATTACH.FieldByName('mon_encaiss').AsCurrency;
 Module1.TATTACH.post;
end;

end.
