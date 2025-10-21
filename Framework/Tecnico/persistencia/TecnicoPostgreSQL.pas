unit TecnicoPostgreSQL;

interface

uses
  Tecnico, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Filtro, TecnicoDB;

type
  TTecnicoPostgreSQL = class(TInterfacedObject, ITecnicoDB)
  private
    function CreateFDQuery: TFDQuery;
  public
    procedure Inserir(Tecnico: TTecnico);
    procedure Alterar(Tecnico: TTecnico);
    function Procurar(Tecnico: TTecnico): TTecnico;
    procedure Deletar(Tecnico: TTecnico);
    function ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
  end;

implementation

uses
  DataModule;

{ TTecnicoPostgreSQL }

function TTecnicoPostgreSQL.CreateFDQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := DMConexao.Conexao;
end;

procedure TTecnicoPostgreSQL.Inserir(Tecnico: TTecnico);
var
  FDQuery: TFDQuery;
begin
  FDQuery := CreateFDQuery;
  try
    try
      FDQuery.SQL.Text :=
        'INSERT INTO public."Tecnico" ' +
        '("Nome", "Email", "Telefone", "Especialidade", "CustoHora", "Ativo", "DtCadastro", "DtAtualizacao") ' +
        'VALUES ' +
        '(:Nome, :Email, :Telefone, :Especialidade, :CustoHora, :Ativo, :DtCadastro, :DtAtualizacao) ' +
        'RETURNING "Id"';
      with FDQuery do
      begin
        DMConexao.Conexao.StartTransaction;
        try
          ParamByName('Nome').AsString := Tecnico.getNome;
          ParamByName('Email').AsString := Tecnico.getEmail;
          ParamByName('Telefone').AsString := Tecnico.getTelefone;
          ParamByName('Especialidade').AsString := Tecnico.getEspecialidade;
          ParamByName('CustoHora').AsFloat := Tecnico.getCustoHora;
          ParamByName('Ativo').AsBoolean := Tecnico.getAtivo;
          ParamByName('DtCadastro').AsDateTime := Tecnico.getDtCadastro;
          ParamByName('DtAtualizacao').AsDateTime := Tecnico.getDtAtualizacao;
          Open;
          Tecnico.setId(FieldByName('Id').AsInteger);
          DMConexao.Conexao.Commit;
          Close;
        except
          on E: Exception do
          begin
            DMConexao.Conexao.Rollback;
            raise Exception.CreateFmt('Erro ao inserir técnico: %s', [E.Message]);
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

procedure TTecnicoPostgreSQL.Alterar(Tecnico: TTecnico);
var
  FDQuery: TFDQuery;
begin
  FDQuery := CreateFDQuery;
  try
    try
      FDQuery.SQL.Text :=
        'UPDATE public."Tecnico" SET ' +
        '"Nome" = :Nome, "Email" = :Email, "Telefone" = :Telefone, "Especialidade" = :Especialidade, ' +
        '"CustoHora" = :CustoHora, "Ativo" = :Ativo, "DtAtualizacao" = :DtAtualizacao ' +
        'WHERE "Id" = :Id';
      with FDQuery do
      begin
        DMConexao.Conexao.StartTransaction;
        try
          ParamByName('Nome').AsString := Tecnico.getNome;
          ParamByName('Email').AsString := Tecnico.getEmail;
          ParamByName('Telefone').AsString := Tecnico.getTelefone;
          ParamByName('Especialidade').AsString := Tecnico.getEspecialidade;
          ParamByName('CustoHora').AsFloat := Tecnico.getCustoHora;
          ParamByName('Ativo').AsBoolean := Tecnico.getAtivo;
          ParamByName('DtAtualizacao').AsDateTime := Tecnico.getDtAtualizacao;
          ParamByName('Id').AsInteger := Tecnico.getId;
          ExecSQL;
          DMConexao.Conexao.Commit;
          Close;
        except
          on E: Exception do
          begin
            DMConexao.Conexao.Rollback;
            raise Exception.CreateFmt('Erro ao alterar técnico: %s', [E.Message]);
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

function TTecnicoPostgreSQL.Procurar(Tecnico: TTecnico): TTecnico;
var
  FDQuery: TFDQuery;
begin
  Result := nil;
  FDQuery := CreateFDQuery;
  try
    try
      FDQuery.SQL.Text := 'SELECT * FROM public."Tecnico" WHERE "Id" = :Id';
      FDQuery.ParamByName('Id').AsInteger := Tecnico.getId;
      FDQuery.Open;
      if not FDQuery.IsEmpty then
      begin
        Result := TTecnico.Create;
        Result.setId(FDQuery.FieldByName('Id').AsInteger);
        Result.setNome(FDQuery.FieldByName('Nome').AsString);
        Result.setEmail(FDQuery.FieldByName('Email').AsString);
        Result.setTelefone(FDQuery.FieldByName('Telefone').AsString);
        Result.setEspecialidade(FDQuery.FieldByName('Especialidade').AsString);
        Result.setCustoHora(FDQuery.FieldByName('CustoHora').AsFloat);
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
      raise Exception.Create('Erro ao procurar técnico: ' + E.Message);
    end;
  end;
end;

procedure TTecnicoPostgreSQL.Deletar(Tecnico: TTecnico);
var
  FDQuery: TFDQuery;
begin
  FDQuery := CreateFDQuery;
  try
    try
      FDQuery.SQL.Text := 'DELETE FROM public."Tecnico" WHERE "Id" = :Id';
      FDQuery.ParamByName('Id').AsInteger := Tecnico.getId;
      DMConexao.Conexao.StartTransaction;
      try
        FDQuery.ExecSQL;
        DMConexao.Conexao.Commit;
      except
        on E: Exception do
        begin
          DMConexao.Conexao.Rollback;
          raise Exception.CreateFmt('Erro ao deletar técnico: %s', [E.Message]);
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

function TTecnicoPostgreSQL.ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
var
  FDQuery: TFDQuery;
  Tecnico: TTecnico;
  SQL: TStringList;
  I: Integer;
begin
  Result := TList.Create;
  FDQuery := CreateFDQuery;
  SQL := TStringList.Create;
  try
    try
      SQL.Add('SELECT *');
      SQL.Add('FROM public."Tecnico" t');
      SQL.Add('WHERE 1=1'); // garante que WHERE sempre existe

      // ====== FILTROS ======
      if Assigned(Filtro) then
      begin
        if Filtro.getDescricao <> '' then
          SQL.Add('  AND (t."Nome" ILIKE :Descricao OR t."Especialidade" ILIKE :Descricao)');

        if not Filtro.getAtivo then
          SQL.Add('  AND t."Ativo" = :Ativo');
      end;

      // ====== ORDENAÇÃO ======
      case OrdenarPor of
        0: SQL.Add('ORDER BY t."Nome"');
        1: SQL.Add('ORDER BY t."Especialidade"');
      else
        SQL.Add('ORDER BY t."Id" DESC');
      end;

      FDQuery.SQL.Text := SQL.Text;

      // ====== PARÂMETROS ======
      if Assigned(Filtro) then
      begin
        if Filtro.getDescricao <> '' then
          FDQuery.ParamByName('Descricao').AsString := '%' + Filtro.getDescricao + '%';
        if not Filtro.getAtivo then
          FDQuery.ParamByName('Ativo').AsBoolean := Filtro.getAtivo;
      end;

      // ====== EXECUÇÃO ======
      FDQuery.Open;

      while not FDQuery.Eof do
      begin
        Tecnico := TTecnico.Create;
        Tecnico.setId(FDQuery.FieldByName('Id').AsInteger);
        Tecnico.setNome(FDQuery.FieldByName('Nome').AsString);
        Tecnico.setEmail(FDQuery.FieldByName('Email').AsString);
        Tecnico.setTelefone(FDQuery.FieldByName('Telefone').AsString);
        Tecnico.setEspecialidade(FDQuery.FieldByName('Especialidade').AsString);
        Tecnico.setCustoHora(FDQuery.FieldByName('CustoHora').AsFloat);
        Tecnico.setAtivo(FDQuery.FieldByName('Ativo').AsBoolean);
        Tecnico.setDtCadastro(FDQuery.FieldByName('DtCadastro').AsDateTime);
        Tecnico.setDtAtualizacao(FDQuery.FieldByName('DtAtualizacao').AsDateTime);
        Result.Add(Tecnico);
        FDQuery.Next;
      end;

    finally
      SQL.Free;
      FDQuery.Free;
    end;
  except
    on E: Exception do
    begin
      for I := 0 to Result.Count - 1 do
        TTecnico(Result[I]).Free;
      Result.Free;
      raise Exception.Create('Erro ao recuperar todos os técnicos: ' + E.Message);
    end;
  end;
end;


end.
