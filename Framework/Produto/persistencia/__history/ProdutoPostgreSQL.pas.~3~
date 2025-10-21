unit ProdutoPostgreSQL;

interface

uses
  Produto, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Filtro, ProdutoDB;

type
  TProdutoPostgreSQL = class(TInterfacedObject, IProdutoDB)
  private
    function CreateFDQuery: TFDQuery;
  public
    procedure Inserir(Produto: TProduto);
    procedure Alterar(Produto: TProduto);
    function Procurar(Produto: TProduto): TProduto;
    procedure Deletar(Produto: TProduto);
    function ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
  end;

implementation

uses
  DataModule;

{ TProdutoPostgreSQL }

function TProdutoPostgreSQL.CreateFDQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := DMConexao.Conexao;
end;

procedure TProdutoPostgreSQL.Inserir(Produto: TProduto);
var
  FDQuery: TFDQuery;
begin
  FDQuery := CreateFDQuery;
  try
    try
      FDQuery.SQL.Text :=
        'INSERT INTO public."Produto" ' +
        '("Descricao", "Tipo", "PrecoPadrao", "Unidade", "CodigoBarras", "Ativo", "DtCadastro", "DtAtualizacao") ' +
        'VALUES ' +
        '(:Descricao, :Tipo, :PrecoPadrao, :Unidade, :CodigoBarras, :Ativo, :DtCadastro, :DtAtualizacao) ' +
        'RETURNING "Id"';
      with FDQuery do
      begin
        DMConexao.Conexao.StartTransaction;
        try
          ParamByName('Descricao').AsString := Produto.getDescricao;
          ParamByName('Tipo').AsString := Produto.getTipo;
          ParamByName('PrecoPadrao').AsFloat := Produto.getPrecoPadrao;
          ParamByName('Unidade').AsString := Produto.getUnidade;
          ParamByName('CodigoBarras').AsString := Produto.getCodigoBarras;
          ParamByName('Ativo').AsBoolean := Produto.getAtivo;
          ParamByName('DtCadastro').AsDateTime := Produto.getDtCadastro;
          ParamByName('DtAtualizacao').AsDateTime := Produto.getDtAtualizacao;
          Open;
          Produto.setId(FieldByName('Id').AsInteger);
          DMConexao.Conexao.Commit;
          Close;
        except
          on E: Exception do
          begin
            DMConexao.Conexao.Rollback;
            raise Exception.CreateFmt('Erro ao inserir produto: %s', [E.Message]);
          end;
        end;
      end;
    finally
      FDQuery.Free;
    end;
  except
    on E: Exception do
      raise;
  end;
end;

procedure TProdutoPostgreSQL.Alterar(Produto: TProduto);
var
  FDQuery: TFDQuery;
begin
  FDQuery := CreateFDQuery;
  try
    try
      FDQuery.SQL.Text :=
        'UPDATE public."Produto" SET ' +
        '"Descricao" = :Descricao, "Tipo" = :Tipo, "PrecoPadrao" = :PrecoPadrao, ' +
        '"Unidade" = :Unidade, "CodigoBarras" = :CodigoBarras, "Ativo" = :Ativo, ' +
        '"DtAtualizacao" = :DtAtualizacao ' +
        'WHERE "Id" = :Id';
      with FDQuery do
      begin
        DMConexao.Conexao.StartTransaction;
        try
          ParamByName('Descricao').AsString := Produto.getDescricao;
          ParamByName('Tipo').AsString := Produto.getTipo;
          ParamByName('PrecoPadrao').AsFloat := Produto.getPrecoPadrao;
          ParamByName('Unidade').AsString := Produto.getUnidade;
          ParamByName('CodigoBarras').AsString := Produto.getCodigoBarras;
          ParamByName('Ativo').AsBoolean := Produto.getAtivo;
          ParamByName('DtAtualizacao').AsDateTime := Produto.getDtAtualizacao;
          ParamByName('Id').AsInteger := Produto.getId;
          ExecSQL;
          DMConexao.Conexao.Commit;
          Close;
        except
          on E: Exception do
          begin
            DMConexao.Conexao.Rollback;
            raise Exception.CreateFmt('Erro ao alterar produto: %s', [E.Message]);
          end;
        end;
      end;
    finally
      FDQuery.Free;
    end;
  except
    on E: Exception do
      raise;
  end;
end;

function TProdutoPostgreSQL.Procurar(Produto: TProduto): TProduto;
var
  FDQuery: TFDQuery;
begin
  Result := nil;
  FDQuery := CreateFDQuery;
  try
    try
      FDQuery.SQL.Text := 'SELECT * FROM public."Produto" WHERE "Id" = :Id';
      FDQuery.ParamByName('Id').AsInteger := Produto.getId;
      FDQuery.Open;
      if not FDQuery.IsEmpty then
      begin
        Result := TProduto.Create;
        Result.setId(FDQuery.FieldByName('Id').AsInteger);
        Result.setDescricao(FDQuery.FieldByName('Descricao').AsString);
        Result.setTipo(FDQuery.FieldByName('Tipo').AsString);
        Result.setPrecoPadrao(FDQuery.FieldByName('PrecoPadrao').AsFloat);
        Result.setUnidade(FDQuery.FieldByName('Unidade').AsString);
        Result.setCodigoBarras(FDQuery.FieldByName('CodigoBarras').AsString);
        Result.setAtivo(FDQuery.FieldByName('Ativo').AsBoolean);
        Result.setDtCadastro(FDQuery.FieldByName('DtCadastro').AsDateTime);
        Result.setDtAtualizacao(FDQuery.FieldByName('DtAtualizacao').AsDateTime);
      end;
      FDQuery.Close;
    finally
      FDQuery.Free;
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('Erro ao procurar produto: ' + E.Message);
    end;
  end;
end;

procedure TProdutoPostgreSQL.Deletar(Produto: TProduto);
var
  FDQuery: TFDQuery;
begin
  FDQuery := CreateFDQuery;
  try
    try
      FDQuery.SQL.Text := 'DELETE FROM public."Produto" WHERE "Id" = :Id';
      FDQuery.ParamByName('Id').AsInteger := Produto.getId;
      DMConexao.Conexao.StartTransaction;
      try
        FDQuery.ExecSQL;
        DMConexao.Conexao.Commit;
      except
        on E: Exception do
        begin
          DMConexao.Conexao.Rollback;
          raise Exception.CreateFmt('Erro ao deletar produto: %s', [E.Message]);
        end;
      end;
    finally
      FDQuery.Free;
    end;
  except
    on E: Exception do
      raise;
  end;
end;

function TProdutoPostgreSQL.ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
var
  FDQuery: TFDQuery;
  Produto: TProduto;
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
        SQL := 'SELECT * FROM public."Produto"';
        if Assigned(Filtro) then
        begin
          // Filtro por descrição (Descricao ou CodigoBarras)
          if Filtro.getDescricao <> '' then
            Condicoes.Add('("Descricao" ILIKE :Descricao OR "CodigoBarras" ILIKE :Descricao)');
          // Filtro por ativo
          if not Filtro.getAtivo then
            Condicoes.Add('"Ativo" = :Ativo');
          // Filtro por tipo (P ou S)
          if Filtro.getTipo <> '' then
            Condicoes.Add('"Tipo" = :Tipo');
          // Montar cláusula WHERE com AND
          if Condicoes.Count > 0 then
          begin
            SQL := SQL + ' WHERE ';
            for I := 0 to Condicoes.Count - 1 do
            begin
              SQL := SQL + Condicoes[I];
              if I < Condicoes.Count - 1 then
                SQL := SQL + ' AND ';
            end;
          end;
        end;

        // Ordenação
        case OrdenarPor of
          0: SQL := SQL + ' ORDER BY "Descricao"';
          1: SQL := SQL + ' ORDER BY "CodigoBarras"';
        end;

        FDQuery.SQL.Text := SQL;
        if Assigned(Filtro) then
        begin
          if Filtro.getDescricao <> '' then
            FDQuery.ParamByName('Descricao').AsString := '%' + Filtro.getDescricao + '%';
          if not Filtro.getAtivo then
            FDQuery.ParamByName('Ativo').AsBoolean := Filtro.getAtivo;
          if Filtro.getTipo <> '' then
            FDQuery.ParamByName('Tipo').AsString := Filtro.getTipo;
        end;
        FDQuery.Open;

        while not FDQuery.Eof do
        begin
          Produto := TProduto.Create;
          Produto.setId(FDQuery.FieldByName('Id').AsInteger);
          Produto.setDescricao(FDQuery.FieldByName('Descricao').AsString);
          Produto.setTipo(FDQuery.FieldByName('Tipo').AsString);
          Produto.setPrecoPadrao(FDQuery.FieldByName('PrecoPadrao').AsFloat);
          Produto.setUnidade(FDQuery.FieldByName('Unidade').AsString);
          Produto.setCodigoBarras(FDQuery.FieldByName('CodigoBarras').AsString);
          Produto.setAtivo(FDQuery.FieldByName('Ativo').AsBoolean);
          Produto.setDtCadastro(FDQuery.FieldByName('DtCadastro').AsDateTime);
          Produto.setDtAtualizacao(FDQuery.FieldByName('DtAtualizacao').AsDateTime);
          Result.Add(Produto);
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
        TProduto(Result[I]).Free;
      Result.Free;
      raise Exception.Create('Erro ao recuperar todos os produtos: ' + E.Message);
    end;
  end;
end;

end.
