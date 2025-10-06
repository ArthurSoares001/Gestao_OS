object FrmClienteControle: TFrmClienteControle
  Left = 0
  Top = 0
  Caption = 'FrmClienteControle'
  ClientHeight = 459
  ClientWidth = 975
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inline fraformLabel1: TfraformLabel
    Left = 0
    Top = 0
    Width = 975
    Height = 25
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -75
    ExplicitTop = 80
    inherited pnLabel: TPanel
      Width = 975
      inherited lblTitulo: TLabel
        Width = 877
      end
      inherited spdAlterar: TSpeedButton
        Left = 906
      end
      inherited spdConsultar: TSpeedButton
        Left = 929
      end
      inherited spdIncluir: TSpeedButton
        Left = 883
      end
      inherited spdSair: TSpeedButton
        Left = 952
      end
    end
  end
  inline fraCabecalhoControle1: TfraCabecalhoControle
    Left = 0
    Top = 25
    Width = 975
    Height = 68
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -108
    ExplicitTop = 120
    inherited pnCabecalho: TPanel
      Width = 975
      inherited pnlNovo: TPanel
        Left = 810
      end
      inherited edtDescricao: TEdit
        Top = 19
        Height = 29
        Margins.Top = 19
        Margins.Bottom = 17
      end
      inherited GBPeriodo: TGroupBox
        inherited EdtAte: TMaskEdit
          ExplicitLeft = 156
        end
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 93
    Width = 975
    Height = 322
    Align = alClient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  inline fraRodaPeControle1: TfraRodaPeControle
    Left = 0
    Top = 415
    Width = 975
    Height = 44
    Align = alBottom
    TabOrder = 3
    ExplicitLeft = 292
    ExplicitTop = 415
    inherited pnRodape: TPanel
      Width = 975
      inherited lblRegistro: TLabel
        Left = 910
      end
    end
  end
end
