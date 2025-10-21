object FrmTecnico: TFrmTecnico
  Left = 0
  Top = 0
  Caption = 'FrmTecnico'
  ClientHeight = 272
  ClientWidth = 593
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
  object PnlTecnico: TPanel
    Left = 0
    Top = 0
    Width = 593
    Height = 272
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object lblNomeRazao: TLabel
      Left = 29
      Top = 44
      Width = 43
      Height = 14
      Caption = 'Nome*:'
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
      Left = 26
      Top = 148
      Width = 60
      Height = 14
      Caption = 'Telefone*:'
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
      Left = 27
      Top = 96
      Width = 31
      Height = 14
      Caption = 'Email:'
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
      Left = 384
      Top = 97
      Width = 65
      Height = 14
      Caption = 'Custo/Hora:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 384
      Top = 47
      Width = 75
      Height = 14
      Caption = 'Especialidade:'
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
      Width = 589
      Height = 25
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 591
      inherited pnLabel: TPanel
        Width = 589
        ExplicitWidth = 591
        inherited lblTitulo: TLabel
          Width = 491
          Height = 18
        end
        inherited spdAlterar: TSpeedButton
          Left = 520
          ExplicitLeft = 573
        end
        inherited spdConsultar: TSpeedButton
          Left = 543
          ExplicitLeft = 596
        end
        inherited spdIncluir: TSpeedButton
          Left = 497
          ExplicitLeft = 550
        end
        inherited spdSair: TSpeedButton
          Left = 566
          ExplicitLeft = 619
        end
      end
    end
    object ChkAtivo: TCheckBox
      Left = 502
      Top = 113
      Width = 51
      Height = 17
      Caption = 'Ativo'
      TabOrder = 1
    end
    inline fraSalvaCancela1: TfraSalvaCancela
      Left = 151
      Top = 223
      Width = 271
      Height = 37
      TabOrder = 2
      ExplicitLeft = 151
      ExplicitTop = 223
      inherited pnlCancelar: TPanel
        inherited btnCancelar: TSpeedButton
          OnClick = fraSalvaCancela1btnCancelarClick
        end
      end
      inherited pnlSalvar: TPanel
        inherited btnSalvar: TSpeedButton
          OnClick = fraSalvaCancela1btnSalvarClick
        end
      end
    end
    object EdtNome: TEdit
      Left = 26
      Top = 62
      Width = 352
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object EdtEmail: TEdit
      Left = 26
      Top = 113
      Width = 352
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object EdtTelefone: TMaskEdit
      Left = 26
      Top = 164
      Width = 137
      Height = 29
      EditMask = '!\(99\)00000-0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 21
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 5
      Text = '(  )     -    '
    end
    object EdtCustoHora: TEdit
      Left = 384
      Top = 113
      Width = 109
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object EdtEspecialidade: TEdit
      Left = 384
      Top = 62
      Width = 169
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
