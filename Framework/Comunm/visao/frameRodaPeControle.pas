unit frameRodaPeControle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Grids;

type
  TfraRodaPeControle = class(TFrame)
    pnRodape: TPanel;
    spdExcel: TSpeedButton;
    spdExcluir: TSpeedButton;
    spdEditar: TSpeedButton;
    spdImprimir: TSpeedButton;
    lblRegistro: TLabel;
    procedure spdExcelClick(Sender: TObject);
  private
    registro: String;
    form: TForm;
    grid: TStringGrid;
  public
    { Public declarations }
    procedure setRegistro(registros: integer);
    procedure iniciar(registro: String; form: TForm; grid: TStringGrid);
    procedure setHintFaturar(const AHint: String);
  end;

implementation

Uses Constantes, Biblioteca;

{$R *.dfm}

{ TfraRodaPeControle }

procedure TfraRodaPeControle.iniciar(registro: String; form: TForm; grid: TStringGrid);
begin
  self.form := form;
  self.grid := grid;
  lblRegistro.Caption := registro;
end;

procedure TfraRodaPeControle.setHintFaturar(const AHint: String);
begin
end;


procedure TfraRodaPeControle.setRegistro(registros: integer);
var
  habilita: boolean;
begin
  habilita := (registros > 0);
  if (habilita) then
    lblRegistro.Caption := 'Registros (' + IntToStr(registros) + ')  '
  else
    lblRegistro.Caption := NULL_STRING;
  form.Refresh;

  spdImprimir.Enabled := habilita;
  spdImprimir.Hint := 'Imprimir';
  //spdFiltro.Enabled := habilita;
  spdEditar.Enabled := habilita;
  spdEditar.Hint := 'Editar';
  spdExcluir.Enabled := habilita;
  spdExcluir.Hint := 'Excluir';
  spdExcel.Enabled := habilita;
  spdExcel.Hint := 'Gerar excel';
end;

procedure TfraRodaPeControle.spdExcelClick(Sender: TObject);
begin
//
end;

end.
