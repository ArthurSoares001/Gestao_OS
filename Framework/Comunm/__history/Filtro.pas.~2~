unit Filtro;

interface

uses
  Classes;

type
  TFiltro = class
  private
    dataDe: TDateTime;
    dataAte: TDateTime;
    descricao: string;
    agruparPor: Integer;
    ordernarPor: Integer;
    ativo: Boolean;
    isPendente: Boolean;
    tipo: string;
  public
    constructor Create;
    procedure novaInstancia;
    procedure setDataDe(dataDe: TDateTime);
    procedure setDataAte(dataAte: TDateTime);
    procedure setDescricao(descricao: string);
    procedure setAgruparPor(agruparPor: Integer);
    procedure setOrdernarPor(ordernarPor: Integer);
    procedure setAtivo(ativo: Boolean);
    procedure setTipo(tipo: string);
    function getDataDe: TDateTime;
    function getDataAte: TDateTime;
    function getDescricao: string;
    function getAgruparPor: Integer;
    function getOrdernarPor: Integer;
    function getAtivo: Boolean;
    function getTipo: string;
  end;

implementation

uses
  Constantes, System.SysUtils;

{ TFiltro }

constructor TFiltro.Create;
begin
  novaInstancia;
end;

procedure TFiltro.novaInstancia;
begin
  setDataDe(NULL_DATETIME);
  setDataAte(NULL_DATETIME);
  setDescricao(NULL_STRING);
  setAtivo(True);
  setAgruparPor(0);
  setOrdernarPor(0);
  setTipo(NULL_STRING);
end;

function TFiltro.getAgruparPor: Integer;
begin
  Result := agruparPor;
end;

function TFiltro.getOrdernarPor: Integer;
begin
  Result := ordernarPor;
end;

function TFiltro.getAtivo: Boolean;
begin
  Result := ativo;
end;

function TFiltro.getDataAte: TDateTime;
begin
  Result := dataAte;
end;

function TFiltro.getDataDe: TDateTime;
begin
  Result := dataDe;
end;

function TFiltro.getDescricao: string;
begin
  Result := descricao;
end;

function TFiltro.getTipo: string;
begin
  Result := tipo;
end;

procedure TFiltro.setAtivo(ativo: Boolean);
begin
  self.ativo := ativo;
end;

procedure TFiltro.setDataAte(dataAte: TDateTime);
begin
  self.dataAte := dataAte;
end;

procedure TFiltro.setDataDe(dataDe: TDateTime);
begin
  self.dataDe := dataDe;
end;

procedure TFiltro.setDescricao(descricao: string);
begin
  self.descricao := descricao;
end;

procedure TFiltro.setAgruparPor(agruparPor: Integer);
begin
  self.agruparPor := agruparPor;
end;

procedure TFiltro.setOrdernarPor(ordernarPor: Integer);
begin
  self.ordernarPor := ordernarPor;
end;

procedure TFiltro.setTipo(tipo: string);
begin
  self.tipo := tipo;
end;

end.
