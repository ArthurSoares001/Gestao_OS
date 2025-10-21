object FrmProdutoControle: TFrmProdutoControle
  Left = 0
  Top = 0
  Caption = 'FrmProdutoControle'
  ClientHeight = 459
  ClientWidth = 925
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
  inline fraCabecalhoControle1: TfraCabecalhoControle
    Left = 0
    Top = 25
    Width = 925
    Height = 68
    Align = alTop
    TabOrder = 0
    ExplicitTop = 25
    ExplicitWidth = 925
    inherited pnCabecalho: TPanel
      Width = 925
      ExplicitWidth = 925
      inherited spdProcurar: TSpeedButton
        OnClick = fraCabecalhoControle1spdProcurarClick
      end
      inherited pnlNovo: TPanel
        Left = 760
        ExplicitLeft = 760
        inherited btnNovo: TSpeedButton
          OnClick = fraCabecalhoControle1btnNovoClick
        end
      end
      inherited edtDescricao: TEdit
        Top = 19
        Height = 29
        Margins.Top = 19
        Margins.Bottom = 17
        ExplicitTop = 19
      end
      inherited GBPeriodo: TGroupBox
        inherited LblDe: TLabel
          Height = 26
        end
        inherited LblAte: TLabel
          Height = 26
        end
      end
      inherited GroupBox1: TGroupBox
        inherited cmbStatus: TComboBox
          Height = 42
        end
      end
    end
  end
  inline fraformLabel1: TfraformLabel
    Left = 0
    Top = 0
    Width = 925
    Height = 25
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 925
    inherited pnLabel: TPanel
      Width = 925
      ExplicitWidth = 925
      inherited lblTitulo: TLabel
        Width = 827
        Height = 18
      end
      inherited spdAlterar: TSpeedButton
        Left = 856
        ExplicitLeft = 906
      end
      inherited spdConsultar: TSpeedButton
        Left = 879
        ExplicitLeft = 929
      end
      inherited spdIncluir: TSpeedButton
        Left = 833
        ExplicitLeft = 883
      end
      inherited spdSair: TSpeedButton
        Left = 902
        ExplicitLeft = 952
      end
    end
  end
  inline fraRodaPeControle1: TfraRodaPeControle
    Left = 0
    Top = 415
    Width = 925
    Height = 44
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 415
    ExplicitWidth = 925
    inherited pnRodape: TPanel
      Width = 925
      ExplicitWidth = 925
      inherited spdExcluir: TSpeedButton
        OnClick = fraRodaPeControle1spdExcluirClick
        ExplicitLeft = 85
        ExplicitTop = 1
        ExplicitHeight = 31
      end
      inherited spdEditar: TSpeedButton
        OnClick = fraRodaPeControle1spdEditarClick
        ExplicitLeft = 44
        ExplicitTop = 1
        ExplicitHeight = 31
      end
      inherited lblRegistro: TLabel
        Left = 860
        Height = 37
        ExplicitLeft = 910
      end
    end
  end
  object stgDados: TStringGrid
    Left = 0
    Top = 93
    Width = 925
    Height = 322
    Align = alClient
    ColCount = 7
    TabOrder = 3
    OnDblClick = stgDadosDblClick
    OnDrawCell = stgDadosDrawCell
  end
end
