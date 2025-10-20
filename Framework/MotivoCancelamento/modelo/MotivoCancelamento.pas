unit MotivoCancelamento;

interface

uses OrObject, SysUtils, Classes, JSON;

type
   TMotivoCancelamento = class(TOrObject)
      constructor Create;
      destructor Destroy; override;
      private
         id: Integer;
         descricao: string;
      public
         procedure setId(id: Integer); override;
         procedure setDescricao(descricao: string);

         function getId: Integer; override;
         function getDescricao: string;

         function validar: Boolean; override;
         procedure ocopy(AObject: TOrObject); override;
      end;

implementation

uses Constantes;

constructor TMotivoCancelamento.Create;
begin
  setId(NULL_INTEGER);
  setDescricao('');
end;

destructor TMotivoCancelamento.Destroy;
begin
  inherited;
end;

//---------------- gets
function TMotivoCancelamento.getId: Integer;
begin
  Result := id;
end;

function TMotivoCancelamento.getDescricao: string;
begin
  Result := descricao;
end;

//---------------- sets
procedure TMotivoCancelamento.setId(id: Integer);
begin
  inherited;
  self.id := id;
end;

procedure TMotivoCancelamento.setDescricao(descricao: string);
begin
  self.descricao := descricao;
end;

function TMotivoCancelamento.validar: Boolean;
begin
  Result := False;

  if Trim(getDescricao) = '' then
    raise Exception.Create('Campo Descrição é obrigatório!');

  if Length(Trim(getDescricao)) > 120 then
    raise Exception.Create('Campo Descrição não pode exceder 120 caracteres!');

  Result := True;
end;

procedure TMotivoCancelamento.ocopy(AObject: TOrObject);
begin
  inherited ocopy(AObject);
  with AObject as TMotivoCancelamento do
  begin
    self.id := getId;
    self.descricao := getDescricao;
  end;
end;

end.
