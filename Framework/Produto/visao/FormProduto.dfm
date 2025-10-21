object FrmProduto: TFrmProduto
  Left = 0
  Top = 0
  Caption = 'FrmProduto'
  ClientHeight = 211
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCliente: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 211
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object lblIeRg: TLabel
      Left = 26
      Top = 42
      Width = 51
      Height = 14
      Caption = 'Descri'#231#227'o'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblTipo: TLabel
      Left = 389
      Top = 40
      Width = 31
      Height = 14
      Caption = 'Tipo*'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblNomeRazao: TLabel
      Left = 340
      Top = 92
      Width = 72
      Height = 14
      Caption = 'Pre'#231'o Padr'#227'o'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblTelefone1: TLabel
      Left = 68
      Top = 295
      Width = 4
      Height = 14
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblEmail: TLabel
      Left = 529
      Top = 92
      Width = 44
      Height = 14
      Caption = 'Unidade'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblPontoDeReferencia: TLabel
      Left = 26
      Top = 95
      Width = 91
      Height = 14
      Caption = 'Codigo de Barras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inline fraformLabel1: TfraformLabel
      Left = 0
      Top = 0
      Width = 633
      Height = 25
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 635
      inherited pnLabel: TPanel
        Width = 633
        ExplicitWidth = 635
        inherited lblTitulo: TLabel
          Width = 535
          Height = 18
        end
        inherited spdAlterar: TSpeedButton
          Left = 564
          ExplicitLeft = 573
        end
        inherited spdConsultar: TSpeedButton
          Left = 587
          ExplicitLeft = 596
        end
        inherited spdIncluir: TSpeedButton
          Left = 541
          ExplicitLeft = 550
        end
        inherited spdSair: TSpeedButton
          Left = 610
          ExplicitLeft = 619
        end
      end
    end
    inline fraSalvaCancela1: TfraSalvaCancela
      Left = 183
      Top = 193
      Width = 271
      Height = 37
      TabOrder = 1
      ExplicitLeft = 183
      ExplicitTop = 193
    end
    object ChkAtivo: TCheckBox
      Left = 565
      Top = 155
      Width = 51
      Height = 17
      Caption = 'Ativo'
      TabOrder = 2
    end
    object EdtDescricao: TEdit
      Left = 26
      Top = 62
      Width = 348
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object cmbTipo: TComboBox
      Left = 380
      Top = 62
      Width = 236
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Items.Strings = (
        'Produto'
        'Servi'#231'o')
    end
    object EdtCodBarras: TEdit
      Left = 26
      Top = 109
      Width = 308
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object EdtPrecoPadrao: TEdit
      Left = 340
      Top = 109
      Width = 170
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edtUnidade: TEdit
      Left = 516
      Top = 109
      Width = 100
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
end
