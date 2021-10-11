object Module1: TModule1
  OldCreateOrder = False
  Left = 200
  Top = 231
  Height = 490
  Width = 660
  object TCLIENT: TTable
    Active = True
    DatabaseName = 'GEST_FACT'
    FilterOptions = [foCaseInsensitive]
    TableName = 'Client.db'
    Left = 24
    Top = 8
    object TCLIENTNom: TStringField
      FieldName = 'Nom'
      Size = 50
    end
    object TCLIENTSociete: TStringField
      FieldName = 'Societe'
      Size = 50
    end
    object TCLIENTADRESSE1: TStringField
      FieldName = 'ADRESSE1'
      Size = 50
    end
    object TCLIENTADRESSE2: TStringField
      FieldName = 'ADRESSE2'
      Size = 50
    end
    object TCLIENTCOD_pos: TStringField
      FieldName = 'COD_pos'
      Size = 10
    end
    object TCLIENTPays: TStringField
      FieldName = 'Pays'
      Size = 25
    end
    object TCLIENTVille: TStringField
      FieldName = 'Ville'
      Size = 25
    end
    object TCLIENTTel: TStringField
      FieldName = 'Tel'
      Size = 12
    end
    object TCLIENTGsm: TStringField
      FieldName = 'Gsm'
      Size = 12
    end
    object TCLIENTFax: TStringField
      FieldName = 'Fax'
      Size = 12
    end
    object TCLIENTEmail: TStringField
      FieldName = 'Email'
      Size = 50
    end
    object TCLIENTObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 10
    end
    object TCLIENTNUM: TAutoIncField
      FieldName = 'NUM'
      ReadOnly = True
    end
    object TCLIENTNcompte: TStringField
      FieldName = 'Ncompte'
      Size = 25
    end
    object TCLIENTNregistre: TStringField
      FieldName = 'Nregistre'
      Size = 25
    end
    object TCLIENTNarticle: TStringField
      FieldName = 'Narticle'
      Size = 25
    end
    object TCLIENTCode_fiscal: TStringField
      FieldName = 'Code_fiscal'
      Size = 25
    end
  end
  object TAFFAIRE: TTable
    DatabaseName = 'GEST_FACT'
    TableName = 'AFFAIRE.db'
    TableType = ttParadox
    Left = 24
    Top = 64
    object TAFFAIRENaffaire: TStringField
      FieldName = 'Naffaire'
      Size = 10
    end
    object TAFFAIRENcontrat: TStringField
      FieldName = 'Ncontrat'
      Size = 10
    end
    object TAFFAIREObjetcontrat: TMemoField
      FieldName = 'Objet contrat'
      BlobType = ftMemo
      Size = 10
    end
    object TAFFAIREMont_ht: TFloatField
      FieldName = 'Mont_ht'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TAFFAIREMont_tva: TFloatField
      FieldName = 'Mont_tva'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TAFFAIREMont_ttc: TFloatField
      FieldName = 'Mont_ttc'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TAFFAIRETaux_Forf: TFloatField
      FieldName = 'Taux_Forf'
      DisplayFormat = '0.00%;(0.00%);0%'
      currency = True
    end
    object TAFFAIRETaux_appros: TFloatField
      FieldName = 'Taux_appros'
      DisplayFormat = '0.00%;(0.00%);0%'
      currency = True
    end
    object TAFFAIRETaux_garentie: TFloatField
      FieldName = 'Taux_garentie'
      DisplayFormat = '0.00%;(0.00%);0%'
      currency = True
    end
    object TAFFAIRETaux_tva: TFloatField
      FieldName = 'Taux_tva'
      DisplayFormat = '0.00%;(0.00%);0%'
      currency = True
    end
    object TAFFAIREBanque: TStringField
      FieldName = 'Banque'
      Size = 40
    end
    object TAFFAIRERembours: TStringField
      FieldName = 'Rembours'
      Size = 3
    end
    object TAFFAIREDate_sig1: TDateField
      FieldName = 'Date_sig1'
    end
    object TAFFAIREDate_sig2: TDateField
      FieldName = 'Date_sig2'
    end
    object TAFFAIREDelai_realis: TStringField
      FieldName = 'Delai_realis'
      Size = 10
    end
    object TAFFAIREDebut_trav: TDateField
      FieldName = 'Debut_trav'
    end
    object TAFFAIREFin_trav: TDateField
      FieldName = 'Fin_trav'
    end
    object TAFFAIRENods: TStringField
      FieldName = 'Nods'
      Size = 10
    end
    object TAFFAIREType_ode: TStringField
      FieldName = 'Type_ode'
    end
    object TAFFAIREDate_ods: TDateField
      FieldName = 'Date_ods'
    end
    object TAFFAIREClause: TMemoField
      FieldName = 'Clause'
      BlobType = ftMemo
      Size = 10
    end
    object TAFFAIREDeclarations: TMemoField
      FieldName = 'Declarations'
      BlobType = ftMemo
      Size = 10
    end
    object TAFFAIREclient: TStringField
      FieldKind = fkLookup
      FieldName = 'client'
      LookupDataSet = TCLIENT
      LookupKeyFields = 'NUM'
      LookupResultField = 'Nom'
      KeyFields = 'Num'
      Size = 40
      Lookup = True
    end
    object TAFFAIREHt: TFloatField
      FieldName = 'Ht'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TAFFAIRETva: TFloatField
      FieldName = 'Tva'
      DisplayFormat = '0.00%;(0.00%);0%'
      currency = True
    end
    object TAFFAIRETtc: TFloatField
      FieldName = 'Ttc'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TAFFAIREObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 10
    end
    object TAFFAIREAutre_taux: TFloatField
      FieldName = 'Autre_taux'
      DisplayFormat = '0.00%;(0.00%);0%'
      currency = True
    end
    object TAFFAIREObjet: TStringField
      FieldName = 'Objet'
      Size = 30
    end
    object TAFFAIRENum: TStringField
      FieldName = 'Num'
      Size = 5
    end
    object TAFFAIRETx_remb: TCurrencyField
      FieldName = 'Tx_remb'
      DisplayFormat = '0.00%;(0.00%);0%'
    end
  end
  object TLIGNE_DEVIS: TTable
    Active = True
    BeforePost = TLIGNE_DEVISBeforePost
    DatabaseName = 'GEST_FACT'
    IndexName = 'naffaire_devis'
    MasterFields = 'Naffaire'
    MasterSource = Dtaffaire
    TableName = 'Ligne_Devis.DB'
    Left = 24
    Top = 128
    object TLIGNE_DEVISLigne: TAutoIncField
      FieldName = 'Ligne'
      ReadOnly = True
    end
    object TLIGNE_DEVISNligne_devis: TStringField
      FieldName = 'Nligne_devis'
      Size = 4
    end
    object TLIGNE_DEVISUm: TStringField
      FieldName = 'Um'
      Size = 6
    end
    object TLIGNE_DEVISPu: TFloatField
      FieldName = 'Pu'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TLIGNE_DEVISQte: TFloatField
      FieldName = 'Qte'
      DisplayFormat = '0.00'
      currency = True
    end
    object TLIGNE_DEVISTotal: TFloatField
      FieldName = 'Total'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TLIGNE_DEVISNaffaire: TStringField
      FieldName = 'Naffaire'
      Size = 10
    end
    object TLIGNE_DEVISHt: TFloatField
      FieldName = 'Ht'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TLIGNE_DEVISTtc: TFloatField
      FieldName = 'Ttc'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TLIGNE_DEVISTva: TFloatField
      FieldName = 'Tva'
      DisplayFormat = '0.00%;(0.00%);0%'
      currency = True
    end
    object TLIGNE_DEVISFdfer: TStringField
      FieldName = 'Fdfer'
      Size = 5
    end
    object TLIGNE_DEVISDesig_devis: TStringField
      FieldName = 'Desig_devis'
      Size = 250
    end
  end
  object TATTACH: TTable
    Active = True
    DatabaseName = 'GEST_FACT'
    TableName = 'Attachement.db'
    Left = 24
    Top = 184
    object TATTACHNAVISEXP: TStringField
      FieldName = 'NAVISEXP'
      Size = 10
    end
    object TATTACHDate_attach: TDateField
      FieldName = 'Date_attach'
    end
    object TATTACHDate_exp: TDateField
      FieldName = 'Date_exp'
    end
    object TATTACHNAFFAIRE: TStringField
      FieldName = 'NAFFAIRE'
      Size = 10
    end
    object TATTACHlib_affaire: TStringField
      FieldKind = fkLookup
      FieldName = 'lib_affaire'
      LookupDataSet = TAFFAIRE
      LookupKeyFields = 'Naffaire'
      LookupResultField = 'Objet contrat'
      KeyFields = 'NAFFAIRE'
      Size = 1000
      Lookup = True
    end
    object TATTACHNattach: TAutoIncField
      FieldName = 'Nattach'
      ReadOnly = True
    end
    object TATTACHNATTACH2: TStringField
      FieldName = 'NATTACH2'
      Size = 10
    end
    object TATTACHNFACTURE: TStringField
      FieldName = 'NFACTURE'
      Size = 10
    end
    object TATTACHMon_encaiss: TCurrencyField
      FieldName = 'Mon_encaiss'
      DisplayFormat = '## ### ### ###.00'
    end
    object TATTACHMont_net: TCurrencyField
      FieldName = 'Mont_net'
      DisplayFormat = '## ### ### ###.00'
    end
    object TATTACHSolde: TCurrencyField
      FieldName = 'Solde'
      DisplayFormat = '## ### ### ###.00'
    end
    object TATTACHDate_fact: TDateField
      FieldName = 'Date_fact'
    end
    object TATTACHTva: TCurrencyField
      FieldName = 'Tva'
      DisplayFormat = '## ### ### ###.00'
    end
    object TATTACHTtc: TCurrencyField
      FieldName = 'Ttc'
      DisplayFormat = '## ### ### ###.00'
    end
    object TATTACHHt: TCurrencyField
      FieldName = 'Ht'
      DisplayFormat = '## ### ### ###.00'
    end
  end
  object TLIGNE_ATTCH: TTable
    Active = True
    BeforePost = TLIGNE_ATTCHBeforePost
    AfterPost = TLIGNE_ATTCHAfterPost
    AfterDelete = TLIGNE_ATTCHAfterDelete
    DatabaseName = 'GEST_FACT'
    IndexFieldNames = 'Nattach'
    MasterFields = 'NATTACH'
    MasterSource = Dt_attach
    TableName = 'LIGNE_ATTCH.db'
    Left = 24
    Top = 240
    object TLIGNE_ATTCHLigne: TAutoIncField
      FieldName = 'Ligne'
      ReadOnly = True
    end
    object TLIGNE_ATTCHNposte: TStringField
      FieldName = 'Nposte'
      Size = 5
    end
    object TLIGNE_ATTCHUm: TStringField
      FieldName = 'Um'
      Size = 5
    end
    object TLIGNE_ATTCHPu: TFloatField
      FieldName = 'Pu'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TLIGNE_ATTCHQte: TFloatField
      FieldName = 'Qte'
      DisplayFormat = '0.00'
      currency = True
    end
    object TLIGNE_ATTCHTotal: TFloatField
      FieldName = 'Total'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TLIGNE_ATTCHNaffaire: TStringField
      FieldName = 'Naffaire'
      Size = 10
    end
    object TLIGNE_ATTCHCumule: TFloatField
      FieldName = 'Cumule'
    end
    object TLIGNE_ATTCHQte_prev: TFloatField
      FieldName = 'Qte_prev'
    end
    object TLIGNE_ATTCHDesig_post: TStringField
      FieldName = 'Desig_post'
      Size = 250
    end
    object TLIGNE_ATTCHNattach: TStringField
      FieldName = 'Nattach'
      Size = 10
    end
    object TLIGNE_ATTCHNfact: TStringField
      FieldName = 'Nfact'
      Size = 10
    end
  end
  object TFACTURE: TTable
    Active = True
    DatabaseName = 'GEST_FACT'
    IndexFieldNames = 'Nfact'
    TableName = 'Facture.db'
    Left = 24
    Top = 296
    object TFACTURENfact: TStringField
      FieldName = 'Nfact'
      Size = 10
    end
    object TFACTUREDate_Fact: TDateField
      FieldName = 'Date_Fact'
    end
    object TFACTURENattach: TStringField
      FieldName = 'Nattach'
      Size = 10
    end
    object TFACTURENAffaire: TStringField
      FieldName = 'NAffaire'
      Size = 10
    end
    object TFACTUREMont_ht: TFloatField
      FieldName = 'Mont_ht'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TFACTURETva: TFloatField
      FieldName = 'Tva'
      DisplayFormat = '0.00'
      currency = True
    end
    object TFACTUREMont_ttc: TFloatField
      FieldName = 'Mont_ttc'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TFACTUREDernier: TStringField
      FieldName = 'Dernier'
      Size = 1
    end
    object TFACTURENet: TFloatField
      FieldName = 'Net'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TFACTUREAutre_taux: TCurrencyField
      FieldName = 'Autre_taux'
    end
    object TFACTUREChiffre: TMemoField
      FieldName = 'Chiffre'
      BlobType = ftMemo
      Size = 10
    end
    object TFACTUREDate1: TDateField
      FieldName = 'Date1'
    end
    object TFACTURElibelle_Affaire: TStringField
      FieldKind = fkLookup
      FieldName = 'libelle_Affaire'
      LookupDataSet = TAFFAIRE
      LookupKeyFields = 'Naffaire'
      LookupResultField = 'Objet contrat'
      KeyFields = 'NAffaire'
      Size = 256
      Lookup = True
    end
    object TFACTURESolde_cde: TCurrencyField
      FieldName = 'Solde_cde'
      DisplayFormat = '## ### ### ###.00'
    end
    object TFACTUREMont_encais: TCurrencyField
      FieldName = 'Mont_encais'
      DisplayFormat = '## ### ### ###.00'
    end
    object TFACTURESolde: TCurrencyField
      FieldName = 'Solde'
      DisplayFormat = '## ### ### ###.00'
    end
    object TFACTURETaux1: TCurrencyField
      FieldName = 'Taux1'
    end
    object TFACTURETaux2: TCurrencyField
      FieldName = 'Taux2'
    end
    object TFACTURETaux3: TCurrencyField
      FieldName = 'Taux3'
    end
    object TFACTUREVref: TStringField
      FieldName = 'Vref'
      Size = 10
    end
    object TFACTURENref: TStringField
      FieldName = 'Nref'
      Size = 10
    end
    object TFACTURESolde_forf: TCurrencyField
      FieldName = 'Solde_forf'
    end
    object TFACTURESolde_appros: TCurrencyField
      FieldName = 'Solde_appros'
    end
    object TFACTURENum: TStringField
      FieldName = 'Num'
      Size = 5
    end
    object TFACTUREclient: TStringField
      FieldKind = fkLookup
      FieldName = 'client'
      LookupDataSet = TCLIENT
      LookupKeyFields = 'NUM'
      LookupResultField = 'Nom'
      KeyFields = 'Num'
      Size = 50
      Lookup = True
    end
  end
  object TLIGNE_FACT: TTable
    Active = True
    BeforePost = TLIGNE_FACTBeforePost
    AfterPost = TLIGNE_FACTAfterPost
    AfterDelete = TLIGNE_FACTAfterDelete
    DatabaseName = 'GEST_FACT'
    IndexFieldNames = 'Nfact;Ligne'
    MasterFields = 'Nfact'
    MasterSource = DT_FACTURE
    TableName = 'Ligne_Fact.db'
    Left = 24
    Top = 352
    object TLIGNE_FACTLigne: TAutoIncField
      FieldName = 'Ligne'
      ReadOnly = True
    end
    object TLIGNE_FACTNligne: TStringField
      FieldName = 'Nligne'
      Size = 5
    end
    object TLIGNE_FACTUm: TStringField
      FieldName = 'Um'
      Size = 5
    end
    object TLIGNE_FACTPu: TFloatField
      FieldName = 'Pu'
      DisplayFormat = '0.00'
      currency = True
    end
    object TLIGNE_FACTQte: TFloatField
      FieldName = 'Qte'
      DisplayFormat = '0.00'
      currency = True
    end
    object TLIGNE_FACTMontant: TFloatField
      FieldName = 'Montant'
      DisplayFormat = '0.00'
      currency = True
    end
    object TLIGNE_FACTCumule: TFloatField
      FieldName = 'Cumule'
      currency = True
    end
    object TLIGNE_FACTNfact: TStringField
      FieldName = 'Nfact'
      Size = 10
    end
    object TLIGNE_FACTNaffaire: TStringField
      FieldName = 'Naffaire'
      Size = 10
    end
    object TLIGNE_FACTDesig_fact: TStringField
      FieldName = 'Desig_fact'
      Size = 250
    end
  end
  object Dtaffaire: TDataSource
    DataSet = TAFFAIRE
    Left = 112
    Top = 64
  end
  object Dtclient: TDataSource
    DataSet = TCLIENT
    Left = 112
    Top = 9
  end
  object Dt_ligneDevis: TDataSource
    DataSet = TLIGNE_DEVIS
    Left = 112
    Top = 128
  end
  object Dt_attach: TDataSource
    DataSet = TATTACH
    Left = 112
    Top = 184
  end
  object Dt_ligneAttach: TDataSource
    DataSet = TLIGNE_ATTCH
    Left = 120
    Top = 240
  end
  object DT_FACTURE: TDataSource
    AutoEdit = False
    DataSet = TFACTURE
    Left = 120
    Top = 296
  end
  object Dt_ligneFact: TDataSource
    DataSet = TLIGNE_FACT
    Left = 128
    Top = 352
  end
  object TEtat_Facture: TTable
    Active = True
    DatabaseName = 'GEST_FACT'
    TableName = 'Etat_Facture.DB'
    Left = 584
    Top = 16
    object TEtat_FactureNum_ligne: TStringField
      FieldName = 'Num_ligne'
      Size = 5
    end
    object TEtat_FactureNaffaire: TStringField
      FieldName = 'Naffaire'
      Size = 10
    end
    object TEtat_FactureNfact: TStringField
      FieldName = 'Nfact'
      Size = 10
    end
    object TEtat_FactureUm: TStringField
      FieldName = 'Um'
      Size = 5
    end
    object TEtat_FactureDsig: TStringField
      FieldName = 'D'#233'sig'
      Size = 100
    end
    object TEtat_FactureQte: TFloatField
      FieldName = 'Qte'
      DisplayFormat = '0.00'
      currency = True
    end
    object TEtat_FacturePu: TFloatField
      FieldName = 'Pu'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TEtat_FactureMontant: TFloatField
      FieldName = 'Montant'
      DisplayFormat = '## ### ### ###.00'
      currency = True
    end
    object TEtat_FactureLigne: TAutoIncField
      FieldName = 'Ligne'
      ReadOnly = True
    end
    object TEtat_FactureDate1: TDateField
      FieldName = 'Date1'
    end
    object TEtat_FactureDate2: TDateField
      FieldName = 'Date2'
    end
    object TEtat_FactureNum: TStringField
      FieldName = 'Num'
      Size = 5
    end
  end
  object Dt_TEtatFacture: TDataSource
    DataSet = TEtat_Facture
    Left = 584
    Top = 290
  end
  object Tab_Attach: TTable
    DatabaseName = 'GEST_FACT'
    TableName = 'Attachement.db'
    Left = 584
    Top = 352
    object Tab_AttachNATTACH: TStringField
      FieldName = 'NATTACH'
      Size = 10
    end
    object Tab_AttachNAVISEXP: TStringField
      FieldName = 'NAVISEXP'
      Size = 10
    end
    object Tab_AttachDate_attach: TDateField
      FieldName = 'Date_attach'
    end
    object Tab_AttachDate_exp: TDateField
      FieldName = 'Date_exp'
    end
    object Tab_AttachNAFFAIRE: TStringField
      FieldName = 'NAFFAIRE'
      Size = 10
    end
  end
  object DEVIS: TTable
    Active = True
    DatabaseName = 'GEST_FACT'
    IndexFieldNames = 'Naffaire;Nligne_devis'
    TableName = 'Ligne_Devis.DB'
    Left = 528
    Top = 408
    object DEVISLigne: TAutoIncField
      FieldName = 'Ligne'
      ReadOnly = True
    end
    object DEVISNligne_devis: TStringField
      FieldName = 'Nligne_devis'
      Size = 4
    end
    object DEVISDesig_devis: TStringField
      FieldName = 'Desig_devis'
      Size = 250
    end
    object DEVISUm: TStringField
      FieldName = 'Um'
      Size = 6
    end
    object DEVISPu: TFloatField
      FieldName = 'Pu'
    end
    object DEVISQte: TFloatField
      FieldName = 'Qte'
    end
    object DEVISTotal: TFloatField
      FieldName = 'Total'
    end
    object DEVISNaffaire: TStringField
      FieldName = 'Naffaire'
      Size = 10
    end
    object DEVISHt: TFloatField
      FieldName = 'Ht'
    end
    object DEVISTtc: TFloatField
      FieldName = 'Ttc'
    end
    object DEVISTva: TFloatField
      FieldName = 'Tva'
    end
    object DEVISFdfer: TStringField
      FieldName = 'Fdfer'
      Size = 5
    end
  end
  object Ligne_attch: TTable
    Active = True
    DatabaseName = 'GEST_FACT'
    TableName = 'LIGNE_ATTCH.DB'
    Left = 528
    Top = 304
    object Ligne_attchLigne: TAutoIncField
      FieldName = 'Ligne'
      ReadOnly = True
    end
    object Ligne_attchNposte: TStringField
      FieldName = 'Nposte'
      Size = 5
    end
    object Ligne_attchDesig_post: TStringField
      FieldName = 'Desig_post'
      Size = 250
    end
    object Ligne_attchUm: TStringField
      FieldName = 'Um'
      Size = 5
    end
    object Ligne_attchPu: TCurrencyField
      FieldName = 'Pu'
    end
    object Ligne_attchQte: TFloatField
      FieldName = 'Qte'
    end
    object Ligne_attchTotal: TCurrencyField
      FieldName = 'Total'
    end
    object Ligne_attchNaffaire: TStringField
      FieldName = 'Naffaire'
      Size = 10
    end
    object Ligne_attchCumule: TFloatField
      FieldName = 'Cumule'
    end
    object Ligne_attchQte_prev: TCurrencyField
      FieldName = 'Qte_prev'
    end
    object Ligne_attchNattach: TStringField
      FieldName = 'Nattach'
      Size = 10
    end
  end
  object Ligne_fact: TTable
    Active = True
    DatabaseName = 'GEST_FACT'
    TableName = 'Ligne_Fact.DB'
    Left = 528
    Top = 352
    object Ligne_factLigne: TAutoIncField
      FieldName = 'Ligne'
      ReadOnly = True
    end
    object Ligne_factNligne: TStringField
      FieldName = 'Nligne'
      Size = 5
    end
    object Ligne_factDesig_fact: TStringField
      FieldName = 'Desig_fact'
      Size = 250
    end
    object Ligne_factUm: TStringField
      FieldName = 'Um'
      Size = 5
    end
    object Ligne_factPu: TCurrencyField
      FieldName = 'Pu'
    end
    object Ligne_factQte: TCurrencyField
      FieldName = 'Qte'
    end
    object Ligne_factMontant: TCurrencyField
      FieldName = 'Montant'
    end
    object Ligne_factCumule: TCurrencyField
      FieldName = 'Cumule'
    end
    object Ligne_factNfact: TStringField
      FieldName = 'Nfact'
      Size = 10
    end
    object Ligne_factNaffaire: TStringField
      FieldName = 'Naffaire'
      Size = 10
    end
  end
  object TFACTURE2: TTable
    Active = True
    DatabaseName = 'GEST_FACT'
    IndexFieldNames = 'Nfact'
    MasterFields = 'Nfact'
    MasterSource = Dt_tfact
    TableName = 'facture2.db'
    Left = 176
    Top = 408
    object TFACTURE2Nligne: TAutoIncField
      FieldName = 'Nligne'
      ReadOnly = True
    end
    object TFACTURE2Nfact: TStringField
      FieldName = 'Nfact'
      Size = 10
    end
    object TFACTURE2Date: TDateField
      FieldName = 'Date'
    end
    object TFACTURE2Naffaire: TStringField
      FieldName = 'Naffaire'
      Size = 10
    end
    object TFACTURE2Desig: TStringField
      FieldName = 'Desig'
      Size = 200
    end
    object TFACTURE2Prix_unit: TCurrencyField
      FieldName = 'Prix_unit'
    end
    object TFACTURE2Montant: TCurrencyField
      FieldName = 'Montant'
    end
    object TFACTURE2Arrete: TMemoField
      FieldName = 'Arrete'
      BlobType = ftMemo
      Size = 10
    end
    object TFACTURE2Num: TStringField
      FieldName = 'Num'
      Size = 10
    end
    object TFACTURE2Solde_forf: TCurrencyField
      FieldName = 'Solde_forf'
    end
    object TFACTURE2Solde_appros: TCurrencyField
      FieldName = 'Solde_appros'
    end
  end
  object TFACT: TTable
    Active = True
    DatabaseName = 'GEST_FACT'
    IndexFieldNames = 'Nfact'
    TableName = 'facture3.DB'
    Left = 24
    Top = 408
    object TFACTNfact: TStringField
      FieldName = 'Nfact'
      Size = 10
    end
    object TFACTDate: TDateField
      FieldName = 'Date'
    end
    object TFACTNaffaire: TStringField
      FieldName = 'Naffaire'
      Size = 10
    end
    object TFACTVREF: TStringField
      FieldName = 'VREF'
      Size = 10
    end
    object TFACTDATE1: TDateField
      FieldName = 'DATE1'
    end
    object TFACTNREF: TStringField
      FieldName = 'NREF'
      Size = 10
    end
    object TFACTNum: TStringField
      FieldName = 'Num'
      Size = 10
    end
    object TFACTTva: TCurrencyField
      FieldName = 'Tva'
    end
    object TFACTMont_ht: TCurrencyField
      FieldName = 'Mont_ht'
    end
    object TFACTMont_ttc: TCurrencyField
      FieldName = 'Mont_ttc'
    end
    object TFACTArrete: TMemoField
      FieldName = 'Arrete'
      BlobType = ftMemo
      Size = 200
    end
  end
  object Dt_tfact: TDataSource
    DataSet = TFACT
    Left = 120
    Top = 408
  end
  object Dt_societe: TDataSource
    DataSet = Tsociete
    Left = 280
    Top = 16
  end
  object Tsociete: TTable
    Active = True
    DatabaseName = 'gest_fact'
    TableName = 'info_societe.DB'
    Left = 208
    Top = 16
  end
  object ETAT: TQuery
    Active = True
    DatabaseName = 'gest_fact'
    SQL.Strings = (
      'SELECT DISTINCT Nfact, NAffaire, Net, Mont_encais, Solde'
      'FROM Facture.DB'
      'ORDER BY Nfact')
    Left = 504
    Top = 16
  end
  object affaires: TTable
    Active = True
    DatabaseName = 'gest_fact'
    TableName = 'AFFAIRE.DB'
    Left = 592
    Top = 64
    object affairesNaffaire: TStringField
      FieldName = 'Naffaire'
      Size = 10
    end
    object affairesNcontrat: TStringField
      FieldName = 'Ncontrat'
      Size = 10
    end
    object affairesObjetcontrat: TMemoField
      FieldName = 'Objet contrat'
      BlobType = ftMemo
      Size = 10
    end
    object affairesObjet: TStringField
      FieldName = 'Objet'
      Size = 30
    end
    object affairesNum: TStringField
      FieldName = 'Num'
      Size = 5
    end
    object affairesMont_ht: TFloatField
      FieldName = 'Mont_ht'
    end
    object affairesMont_tva: TFloatField
      FieldName = 'Mont_tva'
    end
    object affairesMont_ttc: TFloatField
      FieldName = 'Mont_ttc'
    end
    object affairesTaux_Forf: TFloatField
      FieldName = 'Taux_Forf'
    end
    object affairesTaux_appros: TFloatField
      FieldName = 'Taux_appros'
    end
    object affairesTaux_garentie: TFloatField
      FieldName = 'Taux_garentie'
    end
    object affairesTaux_tva: TFloatField
      FieldName = 'Taux_tva'
    end
    object affairesAutre_taux: TFloatField
      FieldName = 'Autre_taux'
    end
    object affairesBanque: TStringField
      FieldName = 'Banque'
      Size = 40
    end
    object affairesRembours: TStringField
      FieldName = 'Rembours'
      Size = 3
    end
    object affairesDate_sig1: TDateField
      FieldName = 'Date_sig1'
    end
    object affairesDate_sig2: TDateField
      FieldName = 'Date_sig2'
    end
    object affairesDelai_realis: TStringField
      FieldName = 'Delai_realis'
      Size = 10
    end
    object affairesDebut_trav: TDateField
      FieldName = 'Debut_trav'
    end
    object affairesFin_trav: TDateField
      FieldName = 'Fin_trav'
    end
    object affairesNods: TStringField
      FieldName = 'Nods'
      Size = 10
    end
    object affairesType_ode: TStringField
      FieldName = 'Type_ode'
    end
    object affairesDate_ods: TDateField
      FieldName = 'Date_ods'
    end
    object affairesClause: TMemoField
      FieldName = 'Clause'
      BlobType = ftMemo
      Size = 10
    end
    object affairesDeclarations: TMemoField
      FieldName = 'Declarations'
      BlobType = ftMemo
      Size = 10
    end
    object affairesHt: TFloatField
      FieldName = 'Ht'
    end
    object affairesTva: TFloatField
      FieldName = 'Tva'
    end
    object affairesTtc: TFloatField
      FieldName = 'Ttc'
    end
    object affairesTx_remb: TCurrencyField
      FieldName = 'Tx_remb'
    end
    object affairesObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 10
    end
    object affairesclient: TStringField
      FieldKind = fkLookup
      FieldName = 'client'
      LookupDataSet = TCLIENT
      LookupKeyFields = 'NUM'
      LookupResultField = 'Societe'
      KeyFields = 'Num'
      Size = 50
      Lookup = True
    end
  end
end
