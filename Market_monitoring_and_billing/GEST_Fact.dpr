program GEST_Fact;

uses
  Forms,
  Menu in 'Menu.pas' {FMENU},
  MODULE_TABLE in 'MODULE_TABLE.pas' {Module1: TDataModule},
  CLIENT in 'CLIENT.pas' {FCLIENT},
  liste_client in 'liste_client.pas' {FListe_Client},
  AFFAIRE in 'AFFAIRE.pas' {FAFFAIRE},
  DEVIS in 'DEVIS.pas' {FDEVIS},
  Attachement in 'Attachement.pas' {FAttachement},
  Liste_devis in 'Liste_devis.pas' {FListe_Devis},
  LISTE_AFFAIRE2 in 'LISTE_AFFAIRE2.pas' {Fliste_affaire2},
  Cree_Fact in 'Cree_Fact.pas' {FCree_Fact},
  Facure_Travaux in 'Facure_Travaux.pas' {FFact_Trav},
  imprime_facture in 'imprime_facture.pas' {QRMDForm},
  Liste_Fact in 'Liste_Fact.pas' {FListe_fact},
  Liste_Attach in 'Liste_Attach.pas' {FListe_Attach},
  Apropos in 'Apropos.pas' {FApropos},
  Devis_Etat in 'Devis_Etat.pas' {Etat_Devis: TQuickRep},
  Encaissement in 'Encaissement.pas' {FEncaissement},
  EFacture_Baticic in 'EFacture_Baticic.pas' {Facture_Baticic: TQuickRep},
  Fliste_fACT2 in 'Fliste_fACT2.pas' {Liste_Fact2},
  EEtat_Encaiss in 'EEtat_Encaiss.pas' {Etat_Encaiss: TQuickRep},
  FSAVE in 'FSAVE.pas' {SAVE},
  FListe_clients in 'FListe_clients.pas' {Liste_Clients},
  ESituation_Attach in 'ESituation_Attach.pas' {Situation_Attach: TQuickRep},
  FImp_Facture in 'FImp_Facture.pas' {Imp_Facture},
  EETAT_FACTURE in 'EETAT_FACTURE.pas' {Etat_Facture: TQuickRep},
  FListe_Fact3 in 'FListe_Fact3.pas' {Liste_Fact3},
  ESitu_Travaux in 'ESitu_Travaux.pas' {Situ_Travaux: TQuickRep},
  FModif_Solde in 'FModif_Solde.pas' {Modif_Solde},
  Fouvrir in 'Fouvrir.pas' {Ovrire},
  Societe in 'Societe.pas' {FSociete},
  facture_avance in 'etat\facture_avance.pas' {fact_avance: TQuickRep},
  EFact_vente in 'etat\EFact_vente.pas' {fact_vente: TQuickRep},
  fact_travaux in 'etat\fact_travaux.pas' {Fact_trav: TQuickRep},
  chiffre_global in 'etat\chiffre_global.pas' {chiffre_glob: TQuickRep},
  periode_chiffre in 'periode_chiffre.pas' {periode},
  chiffre_periode in 'etat\chiffre_periode.pas' {chiffre_period: TQuickRep},
  chiffre_clientt in 'etat\chiffre_clientt.pas' {chiffre_client: TQuickRep},
  creance_global in 'etat\creance_global.pas' {Creance_glob: TQuickRep},
  creance_clientt in 'etat\creance_clientt.pas' {creance_client: TQuickRep},
  creance_periode in 'etat\creance_periode.pas' {creance_period: TQuickRep},
  periode_creanc in 'periode_creanc.pas' {periode_creance};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'GESTION COMMERCIALE';
  Application.CreateForm(TFMENU, FMENU);
  Application.CreateForm(TModule1, Module1);
  Application.CreateForm(TFCLIENT, FCLIENT);
  Application.CreateForm(TFListe_Client, FListe_Client);
  Application.CreateForm(TFAFFAIRE, FAFFAIRE);
  Application.CreateForm(TFDEVIS, FDEVIS);
  Application.CreateForm(TFAttachement, FAttachement);
  Application.CreateForm(TFListe_Devis, FListe_Devis);
  Application.CreateForm(TFliste_affaire2, Fliste_affaire2);
  Application.CreateForm(TFCree_Fact, FCree_Fact);
  Application.CreateForm(TFFact_Trav, FFact_Trav);
  Application.CreateForm(TQRMDForm, QRMDForm);
  Application.CreateForm(TFListe_fact, FListe_fact);
  Application.CreateForm(TFListe_Attach, FListe_Attach);
  Application.CreateForm(TFApropos, FApropos);
  Application.CreateForm(TEtat_Devis, Etat_Devis);
  Application.CreateForm(TFEncaissement, FEncaissement);
  Application.CreateForm(TFacture_Baticic, Facture_Baticic);
  Application.CreateForm(TListe_Fact2, Liste_Fact2);
  Application.CreateForm(TEtat_Encaiss, Etat_Encaiss);
  Application.CreateForm(TSAVE, SAVE);
  Application.CreateForm(TListe_Clients, Liste_Clients);
  Application.CreateForm(TSituation_Attach, Situation_Attach);
  Application.CreateForm(TImp_Facture, Imp_Facture);
  Application.CreateForm(TEtat_Facture, Etat_Facture);
  Application.CreateForm(TListe_Fact3, Liste_Fact3);
  Application.CreateForm(TSitu_Travaux, Situ_Travaux);
  Application.CreateForm(TModif_Solde, Modif_Solde);
  Application.CreateForm(Tfact_avance, fact_avance);
  Application.CreateForm(TOvrire, Ovrire);
  Application.CreateForm(TFSociete, FSociete);
  Application.CreateForm(Tfact_vente, fact_vente);
  Application.CreateForm(TFact_trav, Fact_trav);
  Application.CreateForm(Tchiffre_glob, chiffre_glob);
  Application.CreateForm(Tperiode, periode);
  Application.CreateForm(Tchiffre_period, chiffre_period);
  Application.CreateForm(Tchiffre_client, chiffre_client);
  Application.CreateForm(TCreance_glob, Creance_glob);
  Application.CreateForm(Tcreance_client, creance_client);
  Application.CreateForm(Tcreance_period, creance_period);
  Application.CreateForm(Tperiode_creance, periode_creance);
  Application.Run;
end.
