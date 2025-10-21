unit OSItem;

interface

uses OrObject, SysUtils, Classes;

type
   TOSItem = class(TOrObject)
      constructor Create;
      destructor Destroy; override;
      private
         id: Integer;
         descricao: string;
         tipo: string;
         qtde: Double;
         precoUnit: Double;
         descontoValor: Double;
         acrescimoValor: Double;
         totalItem: Double;
         observacao: string;
         osId: Integer;
         produto: TOrObject;
      public
         procedure setId(id: Integer); override;
         procedure setOsId(osId: Integer);
         procedure setProduto(produto: TOrObject);
         procedure setDescricao(descricao: string);
         procedure setTipo(tipo: string);
         procedure setQtde(qtde: Double);
         procedure setPrecoUnit(precoUnit: Double);
         procedure setDescontoValor(descontoValor: Double);
         procedure setAcrescimoValor(acrescimoValor: Double);
         procedure setTotalItem(totalItem: Double);
         procedure setObservacao(observacao: string);

         function getId: Integer; override;
         function getOsId: Integer;
         function getProduto: TOrObject;
         function getDescricao: string;
         function getTipo: string;
         function getQtde: Double;
         function getPrecoUnit: Double;
         function getDescontoValor: Double;
         function getAcrescimoValor: Double;
         function getTotalItem: Double;
         function getObservacao: string;

         function validar: Boolean; override;
         procedure ocopy(AObject: TOrObject); override;
      end;

implementation

uses Constantes, OS, Produto;

constructor TOSItem.Create;
begin
  inherited Create;
  setId(NULL_INTEGER);
  setOsId(NULL_INTEGER);
  setDescricao('');
  setTipo('');
  setQtde(0);
  setPrecoUnit(0);
  setDescontoValor(0);
  setAcrescimoValor(0);
  setTotalItem(0);
  setObservacao('');
  setProduto(TProduto.Create);
end;

destructor TOSItem.Destroy;
begin
  if Assigned(produto) then
    produto.Free;
  inherited;
end;

//---------------- gets
function TOSItem.getId: Integer;
begin
  Result := id;
end;

function TOSItem.getOsId: Integer;
begin
  Result := osId;
end;

function TOSItem.getProduto: TOrObject;
begin
  Result := produto;
end;

function TOSItem.getDescricao: string;
begin
  Result := descricao;
end;

function TOSItem.getTipo: string;
begin
  Result := tipo;
end;

function TOSItem.getQtde: Double;
begin
  Result := qtde;
end;

function TOSItem.getPrecoUnit: Double;
begin
  Result := precoUnit;
end;

function TOSItem.getDescontoValor: Double;
begin
  Result := descontoValor;
end;

function TOSItem.getAcrescimoValor: Double;
begin
  Result := acrescimoValor;
end;

function TOSItem.getTotalItem: Double;
begin
  Result := totalItem;
end;

function TOSItem.getObservacao: string;
begin
  Result := observacao;
end;

//---------------- sets
procedure TOSItem.setId(id: Integer);
begin
  inherited;
  self.id := id;
end;

procedure TOSItem.setOsId(osId: Integer);
begin
  self.osId := osId;
end;

procedure TOSItem.setProduto(produto: TOrObject);
begin
  if self.produto <> produto then
  begin
    if Assigned(self.produto) then
      self.produto.Free;
    self.produto := produto;
  end;
end;

procedure TOSItem.setDescricao(descricao: string);
begin
  self.descricao := descricao;
end;

procedure TOSItem.setTipo(tipo: string);
begin
  self.tipo := tipo;
end;

procedure TOSItem.setQtde(qtde: Double);
begin
  self.qtde := qtde;
end;

procedure TOSItem.setPrecoUnit(precoUnit: Double);
begin
  self.precoUnit := precoUnit;
end;

procedure TOSItem.setDescontoValor(descontoValor: Double);
begin
  self.descontoValor := descontoValor;
end;

procedure TOSItem.setAcrescimoValor(acrescimoValor: Double);
begin
  self.acrescimoValor := acrescimoValor;
end;

procedure TOSItem.setTotalItem(totalItem: Double);
begin
  self.totalItem := totalItem;
end;

procedure TOSItem.setObservacao(observacao: string);
begin
  self.observacao := observacao;
end;

procedure TOSItem.ocopy(AObject: TOrObject);
begin
  inherited;
  with AObject as TOSItem do
  begin
    self.id := getId;
    self.osId := getOsId;
    self.descricao := getDescricao;
    self.tipo := getTipo;
    self.qtde := getQtde;
    self.precoUnit := getPrecoUnit;
    self.descontoValor := getDescontoValor;
    self.acrescimoValor := getAcrescimoValor;
    self.totalItem := getTotalItem;
    self.observacao := getObservacao;
    self.produto.ocopy(getProduto);
  end;
end;

function TOSItem.validar: Boolean;
begin
  Result := False;

  if Trim(getDescricao) = '' then
    raise Exception.Create('Campo Descrição é obrigatório!');

  if getQtde <= 0 then
    raise Exception.Create('Campo Quantidade deve ser maior que zero!');

  if getPrecoUnit < 0 then
    raise Exception.Create('Campo Preço Unitário não pode ser negativo!');

  if getDescontoValor < 0 then
    raise Exception.Create('Campo Desconto não pode ser negativo!');

  if getAcrescimoValor < 0 then
    raise Exception.Create('Campo Acréscimo não pode ser negativo!');

  if getTotalItem < 0 then
    raise Exception.Create('Campo Total do Item não pode ser negativo!');

  Result := True;
end;

end.
