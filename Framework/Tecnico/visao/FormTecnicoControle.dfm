object FrmTecnicoControle: TFrmTecnicoControle
  Left = 0
  Top = 0
  Caption = 'FrmTecnicoControle'
  ClientHeight = 459
  ClientWidth = 1182
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
  inline fraformLabel1: TfraformLabel
    Left = 0
    Top = 0
    Width = 1182
    Height = 25
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1182
    inherited pnLabel: TPanel
      Width = 1182
      ExplicitWidth = 1182
      inherited lblTitulo: TLabel
        Width = 1084
        Height = 18
      end
      inherited spdAlterar: TSpeedButton
        Left = 1113
        ExplicitLeft = 906
      end
      inherited spdConsultar: TSpeedButton
        Left = 1136
        ExplicitLeft = 929
      end
      inherited spdIncluir: TSpeedButton
        Left = 1090
        ExplicitLeft = 883
      end
      inherited spdSair: TSpeedButton
        Left = 1159
        ExplicitLeft = 952
      end
    end
  end
  inline fraRodaPeControle1: TfraRodaPeControle
    Left = 0
    Top = 415
    Width = 1182
    Height = 44
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 415
    ExplicitWidth = 1182
    inherited pnRodape: TPanel
      Width = 1182
      ExplicitWidth = 1182
      inherited spdExcluir: TSpeedButton
        OnClick = fraRodaPeControle1spdExcluirClick
      end
      inherited spdEditar: TSpeedButton
        OnClick = fraRodaPeControle1spdEditarClick
      end
      inherited lblRegistro: TLabel
        Left = 1117
        Height = 37
        ExplicitLeft = 910
      end
    end
  end
  object stgDados: TStringGrid
    Left = 0
    Top = 93
    Width = 1182
    Height = 322
    Align = alClient
    ColCount = 6
    TabOrder = 2
    OnDblClick = stgDadosDblClick
    OnDrawCell = stgDadosDrawCell
  end
  inline fraCabecalhoControle1: TfraCabecalhoControle
    Left = 0
    Top = 25
    Width = 1182
    Height = 68
    Align = alTop
    TabOrder = 3
    ExplicitTop = 25
    ExplicitWidth = 1182
    inherited pnCabecalho: TPanel
      Width = 1182
      ExplicitWidth = 1182
      inherited spdProcurar: TSpeedButton
        OnClick = fraCabecalhoControle1spdProcurarClick
      end
      inherited pnlNovo: TPanel
        Left = 1017
        ExplicitLeft = 1017
        inherited btnNovo: TSpeedButton
          OnClick = fraCabecalhoControle1btnNovoClick
          ExplicitLeft = -2
          ExplicitWidth = 132
        end
      end
      inherited GBPeriodo: TGroupBox
        inherited LblDe: TLabel
          Height = 26
        end
        inherited LblAte: TLabel
          Height = 26
        end
      end
    end
  end
end
