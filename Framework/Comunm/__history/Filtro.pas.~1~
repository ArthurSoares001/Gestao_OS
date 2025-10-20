unit Filtro;

interface

uses Classes;

type
   TFiltro = class
      constructor Create();
      private
         dataDe                   : TDateTime;
         dataAte                  : TDateTime;
         descricao                : String;
         agruparPor               : integer;
         ordernarPor              : integer;
         ativo                    : boolean;
        
         isPendente               : boolean;
      public
         procedure novaInstancia;
         procedure setDataDe(dataDe: TDateTime);
         procedure setDataAte(dataAte: TDateTime);
         procedure setDescricao(descricao: string);

         procedure setAgruparPor(agruparPor: integer);
         procedure setOrdernarPor(ordernarPor: integer);

         procedure setAtivo(ativo: boolean);

         function getDataDe: TDateTime;
         function getDataAte: TDateTime;
         function getDescricao: string;

         function getAgruparPor: integer;
         function getOrdernarPor: integer;

         function getAtivo: boolean;
      end;

implementation

Uses Constantes, System.SysUtils;

{ TFiltro }

procedure TFiltro.novaInstancia;
begin
  setDataDe(NULL_DATETIME);
  setDataAte(NULL_DATETIME);
  setDescricao(NULL_STRING);
  setAtivo(true);
  setAgruparPor(0);
  setOrdernarPor(0);
end;

constructor TFiltro.Create;
begin
  novaInstancia;
end;

function TFiltro.getAgruparPor: integer;
begin
  result := agruparPor;
end;

function TFiltro.getOrdernarPor: integer;
begin
  result := ordernarPor;
end;

function TFiltro.getAtivo: boolean;
begin
  result := ativo;
end;

function TFiltro.getDataAte: TDateTime;
begin
  result := dataAte;
end;

function TFiltro.getDataDe: TDateTime;
begin
  result := dataDe;
end;

function TFiltro.getDescricao: String;
begin
  result := descricao;
end;

procedure TFiltro.setAtivo(ativo: boolean);
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

procedure TFiltro.setDescricao(descricao: String);
begin
  self.descricao := descricao;
end;

procedure TFiltro.setAgruparPor(agruparPor: integer);
begin
  self.agruparPor := agruparPor;
end;

procedure TFiltro.setOrdernarPor(ordernarPor: integer);
begin
  self.ordernarPor := ordernarPor;
end;


end.
