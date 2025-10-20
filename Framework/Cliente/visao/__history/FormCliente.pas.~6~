unit FormCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Constantes, Biblioteca, Cliente, frameformLabel,
  frameSalvaCancela, Filtro;

type
  TFrmCliente = class(TForm)
    PnlCliente: TPanel;
    fraformLabel1: TfraformLabel;
    fraSalvaCancela1: TfraSalvaCancela;
    lblNomeRazao: TLabel;
    lblEmail: TLabel;
    cmbTipoPessoa: TComboBox;
    chkAtivo: TCheckBox;
    EdtRgIe: TEdit;
    EdtDocumento: TEdit;
    EdtNomeRazao: TEdit;
    EdtEmail: TEdit;
    EdtTelPrincipal: TMaskEdit;
    EdtTelSecundario: TMaskEdit;
    EdtContato: TEdit;
    EdtRua: TEdit;
    EdtNumero: TEdit;
    EdtComplemento: TEdit;
    EdtBairro: TEdit;
    EdtCidade: TEdit;
    EdtUF: TEdit;
    EdtCep: TEdit;
    MemoObs: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSalvaCancela1btnSalvarClick(Sender: TObject);
    procedure fraSalvaCancela1btnCancelarClick(Sender: TObject);
  private
    statusInterface: TStatusInterface;
    cliente: TCliente;
    procedure setAtributos;
    procedure getAtributos;
    procedure atualizarInterface;
  public
    procedure setStatusInterface(statusInterface: TStatusInterface);
    procedure setCliente(cliente: TCliente);
    function getCliente: TCliente;
  end;

var
  FrmCliente: TFrmCliente;

implementation

uses
  DataModule;

{$R *.dfm}

procedure TFrmCliente.atualizarInterface;
begin
  EdtNomeRazao.MaxLength := 250;
  EdtDocumento.MaxLength := 14; // CPF (11) ou CNPJ (14)
  EdtRgIe.MaxLength := 20;
  EdtEmail.MaxLength := 100;
  EdtTelPrincipal.MaxLength := 15; // Formato (99) 99999-9999
  EdtTelSecundario.MaxLength := 15;
  EdtContato.MaxLength := 100;
  EdtRua.MaxLength := 100;
  EdtNumero.MaxLength := 10;
  EdtComplemento.MaxLength := 50;
  EdtBairro.MaxLength := 50;
  EdtCep.MaxLength := 8; // CEP sem hífen
  MemoObs.MaxLength := 1000;
  organizarTabOrder(Self);
  Position := poScreenCenter;
  KeyPreview := True;
  ShowHint := True;
  BorderStyle := bsNone;
end;

procedure TFrmCliente.FormCreate(Sender: TObject);
begin
  statusInterface := stConsultar;
  fraformLabel1.iniciar('Cliente - Cadastro', Self);
  fraSalvaCancela1.iniciar(Self);
  atualizarInterface;
end;

procedure TFrmCliente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F12 then
    fraSalvaCancela1btnSalvarClick(Self)
  else if Key = VK_ESCAPE then
    if Application.MessageBox(PChar(MSG_SAIR), PChar(MT_CONFIRMACAO), MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
      fraSalvaCancela1.btnCancelarClick(Self);
end;

procedure TFrmCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = KEY_ENTER then
  begin
    Key := KEY_TAB;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  limparInterface(Self);
  arredondarInterface(Self);
  if statusInterface in [stConsultar, stAlterar] then
    getAtributos
  else
    chkAtivo.Checked := True;
end;

procedure TFrmCliente.fraSalvaCancela1btnCancelarClick(Sender: TObject);
begin
  fraSalvaCancela1.btnCancelarClick(Sender);
end;

procedure TFrmCliente.fraSalvaCancela1btnSalvarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar(MSG_CONFIRMAR), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    setAtributos;
    fraSalvaCancela1.btnSalvarClick(Sender);
  end;
end;

procedure TFrmCliente.getAtributos;
begin
  with cliente do
  begin
    EdtNomeRazao.Text := getNomeRazao;
    EdtDocumento.Text := getDocumento;
    EdtRgIe.Text := getInscricaoEstadual;
    cmbTipoPessoa.ItemIndex := cmbTipoPessoa.Items.IndexOf(getTipoPessoa);
    EdtEmail.Text := getEmail;
    EdtTelPrincipal.Text := getTelefonePrincipal;
    EdtTelSecundario.Text := getTelefoneSecundario;
    EdtContato.Text := getContato;
    EdtRua.Text := getEnderecoRua;
    EdtNumero.Text := getEnderecoNumero;
    EdtComplemento.Text := getEnderecoCompl;
    EdtBairro.Text := getEnderecoBairro;
    EdtCidade.text := getEnderecoCidade;
    EdtUF.Text := getEnderecoUf;
    EdtCep.Text := getEnderecoCep;
    chkAtivo.Checked := getAtivo;
    MemoObs.Text := getObservacoes;
  end;
end;

function TFrmCliente.getCliente: TCliente;
begin
  Result := cliente;
end;

procedure TFrmCliente.setAtributos;
begin
  with cliente do
  begin
    setNomeRazao(EdtNomeRazao.Text);
    setDocumento(EdtDocumento.Text);
    setInscricaoEstadual(EdtRgIe.Text);

    if cmbTipoPessoa.ItemIndex = 0 then
      setTipoPessoa('F')
    else
      setTipoPessoa('J');

    setEmail(EdtEmail.Text);
    setTelefonePrincipal(EdtTelPrincipal.Text);
    setTelefoneSecundario(EdtTelSecundario.Text);
    setContato(EdtContato.Text);
    setEnderecoRua(EdtRua.Text);
    setEnderecoNumero(EdtNumero.Text);
    setEnderecoCompl(EdtComplemento.Text);
    setEnderecoBairro(EdtBairro.Text);
    setEnderecoCidade(EdtCidade.Text);
    setEnderecoUf(EdtUF.Text);
    setEnderecoCep(EdtCep.Text);
    setAtivo(chkAtivo.Checked);
    setObservacoes(MemoObs.Text);
  end;
end;


procedure TFrmCliente.setCliente(cliente: TCliente);
begin
  Self.cliente := cliente;
end;

procedure TFrmCliente.setStatusInterface(statusInterface: TStatusInterface);
begin
  Self.statusInterface := statusInterface;
  fraformLabel1.setStatusInterface(Self.statusInterface);
end;

end.
