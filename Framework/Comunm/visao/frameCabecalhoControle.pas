unit frameCabecalhoControle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Biblioteca, Constantes, Vcl.Mask;

type
  TfraCabecalhoControle = class(TFrame)
    pnCabecalho: TPanel;
    spdProcurar: TSpeedButton;
    pnlNovo: TPanel;
    btnNovo: TSpeedButton;
    LblTipoFiltro: TLabel;
    edtDescricao: TEdit;
    GBPeriodo: TGroupBox;
    LblDe: TLabel;
    LblAte: TLabel;
    CmbTipo: TComboBox;
    LblFiltro: TLabel;
    EdtAte: TMaskEdit;
    EdtDe: TMaskEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cmbPrioridade: TComboBox;
    Label2: TLabel;
    cmbStatus: TComboBox;
    procedure edtDescricaoChange(Sender: TObject);
  private
    { Private declarations }
    form: TForm;
  public
    { Public declarations }
    procedure iniciar(form: TForm; NovoFiltro: String = NULL_STRING);
    procedure FrameKeyPress(Sender: TObject; var Key: Char);
    procedure alterarNomeItemTipo(const NovoNome: string);
  end;

implementation

{$R *.dfm}

{ TfraCabecalhoControle }


{ TfraCabecalhoControle }

procedure TfraCabecalhoControle.alterarNomeItemTipo(const NovoNome: string);
begin
  if cmbTipo.Items.Count > 0 then
    cmbTipo.Items[0] := NovoNome;
end;


procedure TfraCabecalhoControle.edtDescricaoChange(Sender: TObject);
begin
  cmbTipo.ItemIndex := escolherFiltroMercadoria(cmbTipo, edtDescricao.Text);
end;

procedure TfraCabecalhoControle.FrameKeyPress(Sender: TObject; var Key: Char);
begin
  if key = KEY_ENTER then
  begin
    if (edtDescricao.Focused) then
      spdProcurar.OnClick(self)
    else
    begin
      key := KEY_TAB;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TfraCabecalhoControle.iniciar(form: TForm; NovoFiltro: String);
begin
  self.form := form;
  UsarArredondarView(pnlNovo);
  UsarArredondarView(edtDescricao);
  spdProcurar.Hint := 'Procurar F3';
  btnNovo.Hint := 'Novo F2';
  edtDescricao.MaxLength := 250;
  edtDescricao.Hint := 'Filtro';
  edtDescricao.OnKeyPress := FrameKeyPress;
  if (NovoFiltro <> NULL_STRING) then
    cmbTipo.Items.Add(NovoFiltro);
end;

end.
