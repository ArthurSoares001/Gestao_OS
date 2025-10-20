unit Produto;

interface

uses OrObject, SysUtils, Classes;

type
   TProduto = class(TOrObject)
      constructor Create;
      destructor Destroy; override;
      private
         id: Integer;
         descricao: string;
         tipo: string;
         precoPadrao: Double;
         unidade: string;
         codigoBarras: string;
         ativo: Boolean;
         dtCadastro: TDateTime;
         dtAtualizacao: TDateTime;
      public
         procedure setId(id: Integer); override;
         procedure setDescricao(descricao: string);
         procedure setTipo(tipo: string);
         procedure setPrecoPadrao(precoPadrao: Double);
         procedure setUnidade(unidade: string);
         procedure setCodigoBarras(codigoBarras: string);
         procedure setAtivo(ativo: Boolean);
         procedure setDtCadastro(dtCadastro: TDateTime);
         procedure setDtAtualizacao(dtAtualizacao: TDateTime);

         function getId: Integer; override;
         function getDescricao: string;
         function getTipo: string;
         function getPrecoPadrao: Double;
         function getUnidade: string;
         function getCodigoBarras: string;
         function getAtivo: Boolean;
         function getDtCadastro: TDateTime;
         function getDtAtualizacao: TDateTime;

         function validar: Boolean; override;
         procedure ocopy(AObject: TORObject); override;
      end;

implementation

uses Constantes;

constructor TProduto.Create;
begin
  setId(NULL_INTEGER);
  setDescricao('');
  setTipo('');
  setPrecoPadrao(0);
  setUnidade('UN');
  setCodigoBarras('');
  setAtivo(True);
  setDtCadastro(Now);
  setDtAtualizacao(Now);
end;

destructor TProduto.Destroy;
begin
  inherited;
end;

//---------------- gets
function TProduto.getId: Integer;
begin
  Result := id;
end;

function TProduto.getDescricao: string;
begin
  Result := descricao;
end;

function TProduto.getTipo: string;
begin
  Result := tipo;
end;

function TProduto.getPrecoPadrao: Double;
begin
  Result := precoPadrao;
end;

function TProduto.getUnidade: string;
begin
  Result := unidade;
end;

function TProduto.getCodigoBarras: string;
begin
  Result := codigoBarras;
end;

function TProduto.getAtivo: Boolean;
begin
  Result := ativo;
end;

function TProduto.getDtCadastro: TDateTime;
begin
  Result := dtCadastro;
end;

function TProduto.getDtAtualizacao: TDateTime;
begin
  Result := dtAtualizacao;
end;

//---------------- sets
procedure TProduto.setId(id: Integer);
begin
  inherited;
  self.id := id;
end;

procedure TProduto.setDescricao(descricao: string);
begin
  self.descricao := descricao;
end;

procedure TProduto.setTipo(tipo: string);
begin
  self.tipo := tipo;
end;

procedure TProduto.setPrecoPadrao(precoPadrao: Double);
begin
  self.precoPadrao := precoPadrao;
end;

procedure TProduto.setUnidade(unidade: string);
begin
  self.unidade := unidade;
end;

procedure TProduto.setCodigoBarras(codigoBarras: string);
begin
  self.codigoBarras := codigoBarras;
end;

procedure TProduto.setAtivo(ativo: Boolean);
begin
  self.ativo := ativo;
end;

procedure TProduto.setDtCadastro(dtCadastro: TDateTime);
begin
  self.dtCadastro := dtCadastro;
end;

procedure TProduto.setDtAtualizacao(dtAtualizacao: TDateTime);
begin
  self.dtAtualizacao := dtAtualizacao;
end;

function TProduto.validar: Boolean;
begin
  Result := False;

  if Trim(getDescricao) = '' then
    raise Exception.Create('Campo Descrição é obrigatório!');

  if Length(Trim(getDescricao)) > 150 then
    raise Exception.Create('Campo Descrição não pode exceder 150 caracteres!');

  if not (getTipo = 'P') and not (getTipo = 'S') then
    raise Exception.Create('Campo Tipo deve ser "P" (Produto) ou "S" (Serviço)!');

  if getPrecoPadrao < 0 then
    raise Exception.Create('Campo Preço Padrão não pode ser negativo!');

  if Trim(getUnidade) = '' then
    raise Exception.Create('Campo Unidade é obrigatório!');

  if Length(Trim(getUnidade)) > 10 then
    raise Exception.Create('Campo Unidade não pode exceder 10 caracteres!');

  if (Trim(getCodigoBarras) <> '') and (Length(Trim(getCodigoBarras)) > 50) then
    raise Exception.Create('Campo Código de Barras não pode exceder 50 caracteres!');

  if getDtCadastro = 0 then
    raise Exception.Create('Campo Data de Cadastro é obrigatório!');

  if getDtAtualizacao = 0 then
    raise Exception.Create('Campo Data de Atualização é obrigatório!');

  Result := True;
end;

procedure TProduto.ocopy(AObject: TORObject);
begin
  inherited ocopy(AObject);
  with AObject as TProduto do
  begin
    self.id := getId;
    self.descricao := getDescricao;
    self.tipo := getTipo;
    self.precoPadrao := getPrecoPadrao;
    self.unidade := getUnidade;
    self.codigoBarras := getCodigoBarras;
    self.ativo := getAtivo;
    self.dtCadastro := getDtCadastro;
    self.dtAtualizacao := getDtAtualizacao;
  end;
end;

end.
