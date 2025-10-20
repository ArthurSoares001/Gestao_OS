unit FormProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Constantes, Biblioteca, Produto, frameformLabel, frameSalvaCancela, Filtro;

type
  TFrmProduto = class(TForm)
    PnlCliente: TPanel;
    lblIeRg: TLabel;
    lblTipo: TLabel;
    lblNomeRazao: TLabel;
    lblTelefone1: TLabel;
    lblEmail: TLabel;
    lblPontoDeReferencia: TLabel;
    fraformLabel1: TfraformLabel;
    fraSalvaCancela1: TfraSalvaCancela;
    ChkAtivo: TCheckBox;
    EdtDescricao: TEdit;
    cmbTipo: TComboBox;
    EdtCodBarras: TEdit;
    EdtPrecoPadrao: TEdit;
    edtUnidade: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSalvaCancela1btnSalvarClick(Sender: TObject);
    procedure fraSalvaCancela1btnCancelarClick(Sender: TObject);
  private
    statusInterface: TStatusInterface;
    produto: TProduto;
    procedure setAtributos;
    procedure getAtributos;
    procedure atualizarInterface;
  public
    procedure setStatusInterface(statusInterface: TStatusInterface);
    procedure setProduto(produto: TProduto);
    function getProduto: TProduto;
  end;

var
  FrmProduto: TFrmProduto;

implementation

uses
  DataModule;

{$R *.dfm}

procedure TFrmProduto.atualizarInterface;
begin
  EdtDescricao.MaxLength := 150;
  EdtPrecoPadrao.MaxLength := 12; // Considerando formato numérico com até 12 dígitos (incluindo 2 decimais)
  EdtUnidade.MaxLength := 10;
  EdtCodBarras.MaxLength := 50;
  organizarTabOrder(Self);
  Position := poScreenCenter;
  KeyPreview := True;
  ShowHint := True;
  BorderStyle := bsNone;
end;

procedure TFrmProduto.FormCreate(Sender: TObject);
begin
  statusInterface := stConsultar;
  fraformLabel1.iniciar('Produto - Cadastro', Self);
  fraSalvaCancela1.iniciar(Self);
  atualizarInterface;
end;

procedure TFrmProduto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F12 then
    fraSalvaCancela1btnSalvarClick(Self)
  else if Key = VK_ESCAPE then
    if Application.MessageBox(PChar(MSG_SAIR), PChar(MT_CONFIRMACAO), MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
      fraSalvaCancela1.btnCancelarClick(Self);
end;

procedure TFrmProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = KEY_ENTER then
  begin
    Key := KEY_TAB;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmProduto.FormShow(Sender: TObject);
begin
  limparInterface(Self);
  arredondarInterface(Self);
  if statusInterface in [stConsultar, stAlterar] then
    getAtributos
  else
    chkAtivo.Checked := True;
end;

procedure TFrmProduto.fraSalvaCancela1btnCancelarClick(Sender: TObject);
begin
  fraSalvaCancela1.btnCancelarClick(Sender);
end;

procedure TFrmProduto.fraSalvaCancela1btnSalvarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar(MSG_CONFIRMAR), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    setAtributos;
    fraSalvaCancela1.btnSalvarClick(Sender);
  end;
end;

procedure TFrmProduto.getAtributos;
begin
  with produto do
  begin
    EdtDescricao.Text := getDescricao;
    if getTipo = 'P' then
      cmbTipo.ItemIndex := 0
    else
      cmbTipo.ItemIndex := 1;
    EdtPrecoPadrao.Text := FormatFloat('0.00', getPrecoPadrao);
    EdtUnidade.Text := getUnidade;
    EdtCodBarras.Text := getCodigoBarras;
    chkAtivo.Checked := getAtivo;
  end;
end;

function TFrmProduto.getProduto: TProduto;
begin
  Result := produto;
end;

procedure TFrmProduto.setAtributos;
begin
  with produto do
  begin
    setDescricao(EdtDescricao.Text);
    if cmbTipo.ItemIndex = 0 then
      setTipo('P')
    else
      setTipo('S');
    setPrecoPadrao(StrToFloatDef(EdtPrecoPadrao.Text, 0));
    setUnidade(EdtUnidade.Text);
    setCodigoBarras(EdtCodBarras.Text);
    setAtivo(chkAtivo.Checked);
  end;
end;

procedure TFrmProduto.setProduto(produto: TProduto);
begin
  Self.produto := produto;
end;

procedure TFrmProduto.setStatusInterface(statusInterface: TStatusInterface);
begin
  Self.statusInterface := statusInterface;
  fraformLabel1.setStatusInterface(Self.statusInterface);
end;

end.
