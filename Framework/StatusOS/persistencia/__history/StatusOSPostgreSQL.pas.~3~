unit StatusOSPostgreSQL;

interface

uses
  StatusOS, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Filtro, StatusOSDB;

type
  TStatusOSPostgreSQL = class(TInterfacedObject, IStatusOSDB)
  private
    function CreateFDQuery: TFDQuery;
  public
    procedure Inserir(StatusOS: TStatusOS);
    procedure Alterar(StatusOS: TStatusOS);
    function Procurar(StatusOS: TStatusOS): TStatusOS;
    procedure Deletar(StatusOS: TStatusOS);
    function ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
  end;

implementation

uses
  DataModule;

{ TStatusOSPostgreSQL }

function TStatusOSPostgreSQL.CreateFDQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := DMConexao.Conexao;
end;

procedure TStatusOSPostgreSQL.Inserir(StatusOS: TStatusOS);
var
  FDQuery: TFDQuery;
begin
  FDQuery := CreateFDQuery;
  try
    FDQuery.SQL.Text :=
      'INSERT INTO public."StatusOS" ' +
      '("Codigo", "Ordem") ' +
      'VALUES ' +
      '(:Codigo, :Ordem) ' +
      'RETURNING "Id"';

    DMConexao.Conexao.StartTransaction;
    try
      FDQuery.ParamByName('Codigo').AsString := StatusOS.getCodigo;
      FDQuery.ParamByName('Ordem').AsInteger := StatusOS.getOrdem;
      FDQuery.Open;
      StatusOS.setId(FDQuery.FieldByName('Id').AsInteger);
      DMConexao.Conexao.Commit;
      FDQuery.Close;
    except
      on E: Exception do
      begin
        DMConexao.Conexao.Rollback;
        raise Exception.CreateFmt('Erro ao inserir status OS: %s', [E.Message]);
      end;
    end;
  finally
    FDQuery.Free;
  end;
end;

procedure TStatusOSPostgreSQL.Alterar(StatusOS: TStatusOS);
var
  FDQuery: TFDQuery;
begin
  FDQuery := CreateFDQuery;
  try
    FDQuery.SQL.Text :=
      'UPDATE public."StatusOS" SET ' +
      '"Codigo" = :Codigo, ' +
      '"Ordem" = :Ordem ' +
      'WHERE "Id" = :Id';

    DMConexao.Conexao.StartTransaction;
    try
      FDQuery.ParamByName('Codigo').AsString := StatusOS.getCodigo;
      FDQuery.ParamByName('Ordem').AsInteger := StatusOS.getOrdem;
      FDQuery.ParamByName('Id').AsInteger := StatusOS.getId;
      FDQuery.ExecSQL;
      DMConexao.Conexao.Commit;
      FDQuery.Close;
    except
      on E: Exception do
      begin
        DMConexao.Conexao.Rollback;
        raise Exception.CreateFmt('Erro ao alterar status OS: %s', [E.Message]);
      end;
    end;
  finally
    FDQuery.Free;
  end;
end;

function TStatusOSPostgreSQL.Procurar(StatusOS: TStatusOS): TStatusOS;
var
  FDQuery: TFDQuery;
begin
  Result := nil;
  FDQuery := CreateFDQuery;
  try
    FDQuery.SQL.Text := 'SELECT * FROM public."StatusOS" WHERE "Id" = :Id';
    FDQuery.ParamByName('Id').AsInteger := StatusOS.getId;
    FDQuery.Open;

    if not FDQuery.IsEmpty then
    begin
      Result := TStatusOS.Create;
      Result.setId(FDQuery.FieldByName('Id').AsInteger);
      Result.setCodigo(FDQuery.FieldByName('Codigo').AsString);
      Result.setOrdem(FDQuery.FieldByName('Ordem').AsInteger);
    end;

    FDQuery.Close;
  finally
    FDQuery.Free;
  end;
end;

procedure TStatusOSPostgreSQL.Deletar(StatusOS: TStatusOS);
var
  FDQuery: TFDQuery;
begin
  FDQuery := CreateFDQuery;
  try
    FDQuery.SQL.Text := 'DELETE FROM public."StatusOS" WHERE "Id" = :Id';
    FDQuery.ParamByName('Id').AsInteger := StatusOS.getId;

    DMConexao.Conexao.StartTransaction;
    try
      FDQuery.ExecSQL;
      DMConexao.Conexao.Commit;
    except
      on E: Exception do
      begin
        DMConexao.Conexao.Rollback;
        raise Exception.CreateFmt('Erro ao deletar status OS: %s', [E.Message]);
      end;
    end;
  finally
    FDQuery.Free;
  end;
end;

function TStatusOSPostgreSQL.ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
var
  FDQuery: TFDQuery;
  StatusOS: TStatusOS;
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
        SQL := 'SELECT * FROM public."StatusOS"';

        if Assigned(Filtro) then
        begin
          if Filtro.getDescricao <> '' then
            Condicoes.Add('"Codigo" ILIKE :Descricao');

          if Condicoes.Count > 0 then
            SQL := SQL + ' WHERE ' + Condicoes.DelimitedText;
        end;

        case OrdenarPor of
          0: SQL := SQL + ' ORDER BY "Codigo"';
          1: SQL := SQL + ' ORDER BY "Ordem"';
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
          StatusOS := TStatusOS.Create;
          StatusOS.setId(FDQuery.FieldByName('Id').AsInteger);
          StatusOS.setCodigo(FDQuery.FieldByName('Codigo').AsString);
          StatusOS.setOrdem(FDQuery.FieldByName('Ordem').AsInteger);
          Result.Add(StatusOS);
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
        TStatusOS(Result[I]).Free;
      Result.Free;
      raise Exception.Create('Erro ao recuperar todos os status OS: ' + E.Message);
    end;
  end;
end;

end.
