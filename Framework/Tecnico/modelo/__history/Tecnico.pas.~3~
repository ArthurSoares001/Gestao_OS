unit Tecnico;

interface

uses OrObject, SysUtils, Classes;

type
   TTecnico = class(TOrObject)
      constructor Create;
      destructor Destroy; override;
      private
         id: Integer;
         nome: string;
         email: string;
         telefone: string;
         especialidade: string;
         custoHora: Double;
         ativo: Boolean;
         dtCadastro: TDateTime;
         dtAtualizacao: TDateTime;
      public
         procedure setId(id: Integer); override;
         procedure setNome(nome: string);
         procedure setEmail(email: string);
         procedure setTelefone(telefone: string);
         procedure setEspecialidade(especialidade: string);
         procedure setCustoHora(custoHora: Double);
         procedure setAtivo(ativo: Boolean);
         procedure setDtCadastro(dtCadastro: TDateTime);
         procedure setDtAtualizacao(dtAtualizacao: TDateTime);

         function getId: Integer; override;
         function getNome: string;
         function getEmail: string;
         function getTelefone: string;
         function getEspecialidade: string;
         function getCustoHora: Double;
         function getAtivo: Boolean;
         function getDtCadastro: TDateTime;
         function getDtAtualizacao: TDateTime;

         function validar: Boolean; override;
      end;

implementation

uses Constantes, Biblioteca;

constructor TTecnico.Create;
begin
  setId(NULL_INTEGER);
  setNome('');
  setEmail('');
  setTelefone('');
  setEspecialidade('');
  setCustoHora(0);
  setAtivo(True);
  setDtCadastro(Now);
  setDtAtualizacao(Now);
end;

destructor TTecnico.Destroy;
begin
  inherited;
end;

//---------------- gets
function TTecnico.getId: Integer;
begin
  Result := id;
end;

function TTecnico.getNome: string;
begin
  Result := nome;
end;

function TTecnico.getEmail: string;
begin
  Result := email;
end;

function TTecnico.getTelefone: string;
begin
  Result := telefone;
end;

function TTecnico.getEspecialidade: string;
begin
  Result := especialidade;
end;

function TTecnico.getCustoHora: Double;
begin
  Result := custoHora;
end;

function TTecnico.getAtivo: Boolean;
begin
  Result := ativo;
end;

function TTecnico.getDtCadastro: TDateTime;
begin
  Result := dtCadastro;
end;

function TTecnico.getDtAtualizacao: TDateTime;
begin
  Result := dtAtualizacao;
end;

//---------------- sets
procedure TTecnico.setId(id: Integer);
begin
  inherited;
  self.id := id;
end;

procedure TTecnico.setNome(nome: string);
begin
  self.nome := nome;
end;

procedure TTecnico.setEmail(email: string);
begin
  self.email := email;
end;

procedure TTecnico.setTelefone(telefone: string);
begin
  self.telefone := telefone;
end;

procedure TTecnico.setEspecialidade(especialidade: string);
begin
  self.especialidade := especialidade;
end;

procedure TTecnico.setCustoHora(custoHora: Double);
begin
  self.custoHora := custoHora;
end;

procedure TTecnico.setAtivo(ativo: Boolean);
begin
  self.ativo := ativo;
end;

procedure TTecnico.setDtCadastro(dtCadastro: TDateTime);
begin
  self.dtCadastro := dtCadastro;
end;

procedure TTecnico.setDtAtualizacao(dtAtualizacao: TDateTime);
begin
  self.dtAtualizacao := dtAtualizacao;
end;

function TTecnico.validar: Boolean;
begin
  Result := False;

  if Trim(getNome) = '' then
    raise Exception.Create('Campo Nome é obrigatório!');

  if Length(Trim(getNome)) > 120 then
    raise Exception.Create('Campo Nome não pode exceder 120 caracteres!');

  if (Trim(getEmail) <> '') and (Length(Trim(getEmail)) > 120) then
    raise Exception.Create('Campo Email não pode exceder 120 caracteres!');

  if (Trim(getTelefone) <> '') and (Length(Trim(getTelefone)) > 20) then
    raise Exception.Create('Campo Telefone não pode exceder 20 caracteres!');

  if (Trim(getEspecialidade) <> '') and (Length(Trim(getEspecialidade)) > 80) then
    raise Exception.Create('Campo Especialidade não pode exceder 80 caracteres!');

  if getCustoHora < 0 then
    raise Exception.Create('Campo Custo por Hora não pode ser negativo!');

  if getDtCadastro = 0 then
    raise Exception.Create('Campo Data de Cadastro é obrigatório!');

  if getDtAtualizacao = 0 then
    raise Exception.Create('Campo Data de Atualização é obrigatório!');

  Result := True;
end;

end.
