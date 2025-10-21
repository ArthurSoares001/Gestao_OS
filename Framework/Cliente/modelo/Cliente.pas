unit Cliente;

interface

uses OrObject, SysUtils, Classes, JSON;

type
   TCliente = class(TOrObject)
      constructor Create;
      destructor Destroy; override;
      private
         id: Integer;
         nomeRazao: string;
         documento: string;
         inscricaoEstadual: string;
         tipoPessoa: string;
         email: string;
         telefonePrincipal: string;
         telefoneSecundario: string;
         contato: string;
         enderecoRua: string;
         enderecoNumero: string;
         enderecoCompl: string;
         enderecoBairro: string;
         enderecoCidade: string;
         enderecoUf: string;
         enderecoCep: string;
         ativo: Boolean;
         observacoes: string;
         dtCadastro: TDateTime;
         dtAtualizacao: TDateTime;
      public
         procedure setId(id: Integer); override;
         procedure setNomeRazao(nomeRazao: string);
         procedure setDocumento(documento: string);
         procedure setInscricaoEstadual(inscricaoEstadual: string);
         procedure setTipoPessoa(tipoPessoa: string);
         procedure setEmail(email: string);
         procedure setTelefonePrincipal(telefonePrincipal: string);
         procedure setTelefoneSecundario(telefoneSecundario: string);
         procedure setContato(contato: string);
         procedure setEnderecoRua(enderecoRua: string);
         procedure setEnderecoNumero(enderecoNumero: string);
         procedure setEnderecoCompl(enderecoCompl: string);
         procedure setEnderecoBairro(enderecoBairro: string);
         procedure setEnderecoCidade(enderecoCidade: string);
         procedure setEnderecoUf(enderecoUf: string);
         procedure setEnderecoCep(enderecoCep: string);
         procedure setAtivo(ativo: Boolean);
         procedure setObservacoes(observacoes: string);
         procedure setDtCadastro(dtCadastro: TDateTime);
         procedure setDtAtualizacao(dtAtualizacao: TDateTime);

         function getId: Integer; override;
         function getNomeRazao: string;
         function getDocumento: string;
         function getInscricaoEstadual: string;
         function getTipoPessoa: string;
         function getEmail: string;
         function getTelefonePrincipal: string;
         function getTelefoneSecundario: string;
         function getContato: string;
         function getEnderecoRua: string;
         function getEnderecoNumero: string;
         function getEnderecoCompl: string;
         function getEnderecoBairro: string;
         function getEnderecoCidade: string;
         function getEnderecoUf: string;
         function getEnderecoCep: string;
         function getAtivo: Boolean;
         function getObservacoes: string;
         function getDtCadastro: TDateTime;
         function getDtAtualizacao: TDateTime;

         function validar: Boolean; override;
         procedure ocopy(AObject: TOrObject); override;

      end;

implementation

uses Constantes, Biblioteca;

constructor TCliente.Create;
begin
  setId(NULL_INTEGER);
  setAtivo(True);
  setDtCadastro(Now);
  setDtAtualizacao(Now);
end;

destructor TCliente.Destroy;
begin
  inherited;
end;

//---------------- gets
function TCliente.getId: Integer;
begin
  Result := id;
end;

function TCliente.getNomeRazao: string;
begin
  Result := nomeRazao;
end;

function TCliente.getDocumento: string;
begin
  Result := documento;
end;

function TCliente.getInscricaoEstadual: string;
begin
  Result := inscricaoEstadual;
end;

function TCliente.getTipoPessoa: string;
begin
  Result := tipoPessoa;
end;

function TCliente.getEmail: string;
begin
  Result := email;
end;

function TCliente.getTelefonePrincipal: string;
begin
  Result := telefonePrincipal;
end;

function TCliente.getTelefoneSecundario: string;
begin
  Result := telefoneSecundario;
end;

function TCliente.getContato: string;
begin
  Result := contato;
end;

function TCliente.getEnderecoRua: string;
begin
  Result := enderecoRua;
end;

function TCliente.getEnderecoNumero: string;
begin
  Result := enderecoNumero;
end;

function TCliente.getEnderecoCompl: string;
begin
  Result := enderecoCompl;
end;

function TCliente.getEnderecoBairro: string;
begin
  Result := enderecoBairro;
end;

function TCliente.getEnderecoCidade: string;
begin
  Result := enderecoCidade;
end;

function TCliente.getEnderecoUf: string;
begin
  Result := enderecoUf;
end;

function TCliente.getEnderecoCep: string;
begin
  Result := enderecoCep;
end;

function TCliente.getAtivo: Boolean;
begin
  Result := ativo;
end;

function TCliente.getObservacoes: string;
begin
  Result := observacoes;
end;

function TCliente.getDtCadastro: TDateTime;
begin
  Result := dtCadastro;
end;

function TCliente.getDtAtualizacao: TDateTime;
begin
  Result := dtAtualizacao;
end;

//---------------- sets
procedure TCliente.setId(id: Integer);
begin
  inherited;
  self.id := id;
end;

procedure TCliente.setNomeRazao(nomeRazao: string);
begin
  self.nomeRazao := nomeRazao;
end;

procedure TCliente.setDocumento(documento: string);
begin
  self.documento := documento;
end;

procedure TCliente.setInscricaoEstadual(inscricaoEstadual: string);
begin
  self.inscricaoEstadual := inscricaoEstadual;
end;

procedure TCliente.setTipoPessoa(tipoPessoa: string);
begin
  self.tipoPessoa := tipoPessoa;
end;

procedure TCliente.setEmail(email: string);
begin
  self.email := email;
end;

procedure TCliente.setTelefonePrincipal(telefonePrincipal: string);
begin
  self.telefonePrincipal := telefonePrincipal;
end;

procedure TCliente.setTelefoneSecundario(telefoneSecundario: string);
begin
  self.telefoneSecundario := telefoneSecundario;
end;

procedure TCliente.setContato(contato: string);
begin
  self.contato := contato;
end;

procedure TCliente.setEnderecoRua(enderecoRua: string);
begin
  self.enderecoRua := enderecoRua;
end;

procedure TCliente.setEnderecoNumero(enderecoNumero: string);
begin
  self.enderecoNumero := enderecoNumero;
end;

procedure TCliente.setEnderecoCompl(enderecoCompl: string);
begin
  self.enderecoCompl := enderecoCompl;
end;

procedure TCliente.setEnderecoBairro(enderecoBairro: string);
begin
  self.enderecoBairro := enderecoBairro;
end;

procedure TCliente.setEnderecoCidade(enderecoCidade: string);
begin
  self.enderecoCidade := enderecoCidade;
end;

procedure TCliente.setEnderecoUf(enderecoUf: string);
begin
  self.enderecoUf := enderecoUf;
end;

procedure TCliente.setEnderecoCep(enderecoCep: string);
begin
  self.enderecoCep := enderecoCep;
end;

procedure TCliente.setAtivo(ativo: Boolean);
begin
  self.ativo := ativo;
end;

procedure TCliente.setObservacoes(observacoes: string);
begin
  self.observacoes := observacoes;
end;

procedure TCliente.setDtCadastro(dtCadastro: TDateTime);
begin
  self.dtCadastro := dtCadastro;
end;

procedure TCliente.setDtAtualizacao(dtAtualizacao: TDateTime);
begin
  self.dtAtualizacao := dtAtualizacao;
end;

function TCliente.validar: Boolean;
begin
  Result := False;

  if Trim(getNomeRazao).Length < 5 then
    raise Exception.Create('Campo Nome/Razão Social é obrigatório e deve ter pelo menos 5 caracteres!');

  if (getInscricaoEstadual.Length <> 11) and (getInscricaoEstadual.Length <> 14) then
    raise Exception.Create('Campo Documento é obrigatório e deve ter valor válido (CPF: 11 dígitos, CNPJ: 14 dígitos)!');

  if (getInscricaoEstadual.Length = 11) or (getInscricaoEstadual.Length = 14) then
  begin
    if getInscricaoEstadual.Length = 11 then
    begin
     // if not Biblioteca.validar(getDocumento, 1) then
     //   raise Exception.Create(MSG_ERRO_CPF_CNPJ_INVALIDO);
    end
    else
    begin
     // if not Biblioteca.validar(getDocumento, 2) then
     //   raise Exception.Create(MSG_ERRO_CPF_CNPJ_INVALIDO);
    end;
  end;

  if not (getTipoPessoa = 'F') and not (getTipoPessoa = 'J') then
    raise Exception.Create('Campo Tipo Pessoa deve ser "F" (Física) ou "J" (Jurídica)!');

  if (Trim(getInscricaoEstadual) <> '') and (Trim(getInscricaoEstadual).Length < 5) then
    raise Exception.Create('Campo Inscrição Estadual deve ter valor válido!');


  if Trim(getEnderecoRua) = '' then
    raise Exception.Create('Campo Endereço Rua é obrigatório!');

  if Trim(getEnderecoNumero) = '' then
    raise Exception.Create('Campo Endereço Número é obrigatório!');

  if Trim(getEnderecoBairro) = '' then
    raise Exception.Create('Campo Endereço Bairro é obrigatório!');

  if Trim(getEnderecoCidade) = '' then
    raise Exception.Create('Campo Endereço Cidade é obrigatório!');

  if Trim(getEnderecoUf) = '' then
    raise Exception.Create('Campo Endereço UF é obrigatório!');

  Result := True;
end;


procedure TCliente.ocopy(AObject: TOrObject);
begin
  inherited ocopy(AObject);
  with AObject as TCliente do
  begin
    self.id := getId;
    self.nomeRazao := getNomeRazao;
    self.documento := getDocumento;
    self.inscricaoEstadual := getInscricaoEstadual;
    self.tipoPessoa := getTipoPessoa;
    self.email := getEmail;
    self.telefonePrincipal := getTelefonePrincipal;
    self.telefoneSecundario := getTelefoneSecundario;
    self.contato := getContato;
    self.enderecoRua := getEnderecoRua;
    self.enderecoNumero := getEnderecoNumero;
    self.enderecoCompl := getEnderecoCompl;
    self.enderecoBairro := getEnderecoBairro;
    self.enderecoCidade := getEnderecoCidade;
    self.enderecoUf := getEnderecoUf;
    self.enderecoCep := getEnderecoCep;
    self.ativo := getAtivo;
    self.observacoes := getObservacoes;
    self.dtCadastro := getDtCadastro;
    self.dtAtualizacao := getDtAtualizacao;
  end;
end;


end.
