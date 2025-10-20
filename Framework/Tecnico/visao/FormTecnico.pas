unit FormTecnico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Constantes, Biblioteca, Tecnico, frameformLabel,
  frameSalvaCancela, Filtro;

type
  TFrmTecnico = class(TForm)
    PnlTecnico: TPanel;
    lblNomeRazao: TLabel;
    lblTelefone1: TLabel;
    lblEmail: TLabel;
    lblPontoDeReferencia: TLabel;
    Label3: TLabel;
    fraformLabel1: TfraformLabel;
    ChkAtivo: TCheckBox;
    fraSalvaCancela1: TfraSalvaCancela;
    EdtNome: TEdit;
    EdtEmail: TEdit;
    EdtTelefone: TMaskEdit;
    EdtCustoHora: TEdit;
    EdtEspecialidade: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSalvaCancela1btnSalvarClick(Sender: TObject);
    procedure fraSalvaCancela1btnCancelarClick(Sender: TObject);
  private
    statusInterface: TStatusInterface;
    tecnico: TTecnico;
    procedure setAtributos;
    procedure getAtributos;
    procedure atualizarInterface;
  public
    procedure setStatusInterface(statusInterface: TStatusInterface);
    procedure setTecnico(tecnico: TTecnico);
    function getTecnico: TTecnico;
  end;

var
  FrmTecnico: TFrmTecnico;

implementation

uses
  DataModule;

{$R *.dfm}

procedure TFrmTecnico.atualizarInterface;
begin
  EdtNome.MaxLength := 120;
  EdtEmail.MaxLength := 120;
  EdtTelefone.MaxLength := 15; // Formato (99) 99999-9999
  EdtEspecialidade.MaxLength := 80;
  EdtCustoHora.MaxLength := 12; // Considera formato numérico com até 2 decimais
  organizarTabOrder(Self);
  Position := poScreenCenter;
  KeyPreview := True;
  ShowHint := True;
  BorderStyle := bsNone;
end;

procedure TFrmTecnico.FormCreate(Sender: TObject);
begin
  statusInterface := stConsultar;
  fraformLabel1.iniciar('Técnico - Cadastro', Self);
  fraSalvaCancela1.iniciar(Self);
  atualizarInterface;
end;

procedure TFrmTecnico.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F12 then
    fraSalvaCancela1btnSalvarClick(Self)
  else if Key = VK_ESCAPE then
    if Application.MessageBox(PChar(MSG_SAIR), PChar(MT_CONFIRMACAO), MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
      fraSalvaCancela1.btnCancelarClick(Self);
end;

procedure TFrmTecnico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = KEY_ENTER then
  begin
    Key := KEY_TAB;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmTecnico.FormShow(Sender: TObject);
begin
  limparInterface(Self);
  arredondarInterface(Self);
  if statusInterface in [stConsultar, stAlterar] then
    getAtributos
  else
    chkAtivo.Checked := True;
end;

procedure TFrmTecnico.fraSalvaCancela1btnCancelarClick(Sender: TObject);
begin
  fraSalvaCancela1.btnCancelarClick(Sender);
end;

procedure TFrmTecnico.fraSalvaCancela1btnSalvarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar(MSG_CONFIRMAR), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    setAtributos;
    fraSalvaCancela1.btnSalvarClick(Sender);
  end;
end;

procedure TFrmTecnico.getAtributos;
begin
  with tecnico do
  begin
    EdtNome.Text := getNome;
    EdtEmail.Text := getEmail;
    EdtTelefone.Text := getTelefone;
    EdtEspecialidade.Text := getEspecialidade;
    EdtCustoHora.Text := FloatToStr(getCustoHora);
    chkAtivo.Checked := getAtivo;
  end;
end;

function TFrmTecnico.getTecnico: TTecnico;
begin
  Result := tecnico;
end;

procedure TFrmTecnico.setAtributos;
begin
  with tecnico do
  begin
    setNome(EdtNome.Text);
    setEmail(EdtEmail.Text);
    setTelefone(EdtTelefone.Text);
    setEspecialidade(EdtEspecialidade.Text);
    setCustoHora(StrToFloatDef(EdtCustoHora.Text, 0));
    setAtivo(chkAtivo.Checked);
  end;
end;

procedure TFrmTecnico.setTecnico(tecnico: TTecnico);
begin
  Self.tecnico := tecnico;
end;

procedure TFrmTecnico.setStatusInterface(statusInterface: TStatusInterface);
begin
  Self.statusInterface := statusInterface;
  fraformLabel1.setStatusInterface(Self.statusInterface);
end;

end.
