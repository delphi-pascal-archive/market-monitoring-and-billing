object Modif_Solde: TModif_Solde
  Left = 390
  Top = 273
  Width = 294
  Height = 157
  AutoSize = True
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Modifier solde'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 286
    Height = 123
    TabOrder = 0
    object Label13: TLabel
      Left = 5
      Top = 7
      Width = 114
      Height = 13
      Caption = 'Solde Avance Forfetaire'
    end
    object Label14: TLabel
      Left = 5
      Top = 37
      Width = 103
      Height = 13
      Caption = 'Solde Avance Appros'
    end
    object Label15: TLabel
      Left = 4
      Top = 65
      Width = 139
      Height = 13
      Caption = 'Solde Avance sur commande'
    end
    object DBEdit12: TDBEdit
      Left = 146
      Top = 4
      Width = 121
      Height = 21
      DataField = 'Solde_forf'
      DataSource = Module1.DT_FACTURE
      TabOrder = 0
    end
    object DBEdit13: TDBEdit
      Left = 146
      Top = 31
      Width = 121
      Height = 21
      DataField = 'Solde_appros'
      DataSource = Module1.DT_FACTURE
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 5
      Top = 91
      Width = 75
      Height = 25
      TabOrder = 2
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 87
      Top = 91
      Width = 75
      Height = 25
      TabOrder = 3
      Kind = bkCancel
    end
    object DBEdit14: TDBEdit
      Left = 146
      Top = 60
      Width = 121
      Height = 21
      DataField = 'Solde_cde'
      DataSource = Module1.DT_FACTURE
      TabOrder = 4
    end
  end
end
