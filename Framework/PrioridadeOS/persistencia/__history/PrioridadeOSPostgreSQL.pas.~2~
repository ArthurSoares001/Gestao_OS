unit PrioridadeOSPostgreSQL;

interface

uses
  PrioridadeOS, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Filtro, PrioridadeOSDB;

type
  TPrioridadeOSPostgreSQL = class(TInterfacedObject, IPrioridadeOSDB)
  private
    function CreateFDQuery: TFDQuery;
  public
    procedure Inserir(PrioridadeOS: TPrioridadeOS);
    procedure Alterar(PrioridadeOS: TPrioridadeOS);
    function Procurar(PrioridadeOS: TPrioridadeOS): TPrioridadeOS;
    procedure Deletar(PrioridadeOS: TPrioridadeOS);
    function ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
  end;

implementation

uses
  DataModule;

{ TPrioridadeOSPostgreSQL }

function TPrioridadeOSPostgreSQL.CreateFDQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := DMConexao.Conexao;
end;

procedure TPrioridadeOSPostgreSQL.Inserir(PrioridadeOS: TPrioridadeOS);
var
  FDQuery: TFDQuery;
begin
  FDQuery := CreateFDQuery;
  try
    FDQuery.SQL.Text :=
      'INSERT INTO public."PrioridadeOS" ' +
      '("Codigo", "SLAHoras") ' +
      'VALUES ' +
      '(:Codigo, :SLAHoras) ' +
      'RETURNING "Id"';

    DMConexao.Conexao.StartTransaction;
    try
      FDQuery.ParamByName('Codigo').AsString := PrioridadeOS.getCodigo;
      FDQuery.ParamByName('SLAHoras').AsInteger := PrioridadeOS.getSlaHoras;
      FDQuery.Open;
      PrioridadeOS.setId(FDQuery.FieldByName('Id').AsInteger);
      DMConexao.Conexao.Commit;
      FDQuery.Close;
    except
      on E: Exception do
      begin
        DMConexao.Conexao.Rollback;
        raise Exception.CreateFmt('Erro ao inserir prioridade OS: %s', [E.Message]);
      end;
    end;
  finally
    FDQuery.Free;
  end;
end;

procedure TPrioridadeOSPostgreSQL.Alterar(PrioridadeOS: TPrioridadeOS);
var
  FDQuery: TFDQuery;
begin
  FDQuery := CreateFDQuery;
  try
    FDQuery.SQL.Text :=
      'UPDATE public."PrioridadeOS" SET ' +
      '"Codigo" = :Codigo, ' +
      '"SLAHoras" = :SLAHoras ' +
      'WHERE "Id" = :Id';

    DMConexao.Conexao.StartTransaction;
    try
      FDQuery.ParamByName('Codigo').AsString := PrioridadeOS.getCodigo;
      FDQuery.ParamByName('SLAHoras').AsInteger := PrioridadeOS.getSlaHoras;
      FDQuery.ParamByName('Id').AsInteger := PrioridadeOS.getId;
      FDQuery.ExecSQL;
      DMConexao.Conexao.Commit;
      FDQuery.Close;
    except
      on E: Exception do
      begin
        DMConexao.Conexao.Rollback;
        raise Exception.CreateFmt('Erro ao alterar prioridade OS: %s', [E.Message]);
      end;
    end;
  finally
    FDQuery.Free;
  end;
end;

function TPrioridadeOSPostgreSQL.Procurar(PrioridadeOS: TPrioridadeOS): TPrioridadeOS;
var
  FDQuery: TFDQuery;
begin
  Result := nil;
  FDQuery := CreateFDQuery;
  try
    FDQuery.SQL.Text := 'SELECT * FROM public."PrioridadeOS" WHERE "Id" = :Id';
    FDQuery.ParamByName('Id').AsInteger := PrioridadeOS.getId;
    FDQuery.Open;

    if not FDQuery.IsEmpty then
    begin
      Result := TPrioridadeOS.Create;
      Result.setId(FDQuery.FieldByName('Id').AsInteger);
      Result.setCodigo(FDQuery.FieldByName('Codigo').AsString);
      Result.setSlaHoras(FDQuery.FieldByName('SLAHoras').AsInteger);
    end;

    FDQuery.Close;
  finally
    FDQuery.Free;
  end;
end;

procedure TPrioridadeOSPostgreSQL.Deletar(PrioridadeOS: TPrioridadeOS);
var
  FDQuery: TFDQuery;
begin
  FDQuery := CreateFDQuery;
  try
    FDQuery.SQL.Text := 'DELETE FROM public."PrioridadeOS" WHERE "Id" = :Id';
    FDQuery.ParamByName('Id').AsInteger := PrioridadeOS.getId;

    DMConexao.Conexao.StartTransaction;
    try
      FDQuery.ExecSQL;
      DMConexao.Conexao.Commit;
    except
      on E: Exception do
      begin
        DMConexao.Conexao.Rollback;
        raise Exception.CreateFmt('Erro ao deletar prioridade OS: %s', [E.Message]);
      end;
    end;
  finally
    FDQuery.Free;
  end;
end;


function TPrioridadeOSPostgreSQL.ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
var
  FDQuery: TFDQuery;
  PrioridadeOS: TPrioridadeOS;
  SQL: string;
  Condicoes: TStringList;
  I: Integer;
begin
  Result := TList.Create;
  FDQuery := CreateFDQuery;
  try
    try
      Condicoes := TStringList.Create;
      try
        SQL := 'SELECT * FROM public."PrioridadeOS"';

        if Assigned(Filtro) then
        begin
          if Filtro.getDescricao <> '' then
            Condicoes.Add('"Codigo" ILIKE :Descricao');

          if Condicoes.Count > 0 then
            SQL := SQL + ' WHERE ' + Condicoes.DelimitedText;
        end;

        case OrdenarPor of
          0: SQL := SQL + ' ORDER BY "Codigo"';
          1: SQL := SQL + ' ORDER BY "SLAHoras"';
        end;

        FDQuery.SQL.Text := SQL;
        if Assigned(Filtro) then
        begin
          if Filtro.getDescricao <> '' then
            FDQuery.ParamByName('Descricao').AsString := '%' + Filtro.getDescricao + '%';
        end;

        FDQuery.Open;
        while not FDQuery.Eof do
        begin
          PrioridadeOS := TPrioridadeOS.Create;
          PrioridadeOS.setId(FDQuery.FieldByName('Id').AsInteger);
          PrioridadeOS.setCodigo(FDQuery.FieldByName('Codigo').AsString);
          PrioridadeOS.setSlaHoras(FDQuery.FieldByName('SLAHoras').AsInteger);
          Result.Add(PrioridadeOS);
          FDQuery.Next;
        end;

        FDQuery.Close;
      finally
        Condicoes.Free;
      end;
    finally
      FDQuery.Free;
    end;
  except
    on E: Exception do
    begin
      for I := 0 to Result.Count - 1 do
        TPrioridadeOS(Result[I]).Free;
      Result.Free;
      raise Exception.Create('Erro ao recuperar todas as prioridades OS: ' + E.Message);
    end;
  end;
end;

end.
