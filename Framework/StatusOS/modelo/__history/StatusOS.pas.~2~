unit StatusOS;

interface

uses OrObject, SysUtils, Classes;

type
   TStatusOS = class(TOrObject)
      constructor Create;
      destructor Destroy; override;
      private
         id: Integer;
         codigo: string;
         ordem: Integer;
      public
         procedure setId(id: Integer); override;
         procedure setCodigo(codigo: string);
         procedure setOrdem(ordem: Integer);

         function getId: Integer; override;
         function getCodigo: string;
         function getOrdem: Integer;

         function validar: Boolean; override;
      end;

implementation

uses Constantes;

constructor TStatusOS.Create;
begin
  setId(NULL_INTEGER);
  setCodigo('');
  setOrdem(0);
end;

destructor TStatusOS.Destroy;
begin
  inherited;
end;

//---------------- gets
function TStatusOS.getId: Integer;
begin
  Result := id;
end;

function TStatusOS.getCodigo: string;
begin
  Result := codigo;
end;

function TStatusOS.getOrdem: Integer;
begin
  Result := ordem;
end;

//---------------- sets
procedure TStatusOS.setId(id: Integer);
begin
  inherited;
  self.id := id;
end;

procedure TStatusOS.setCodigo(codigo: string);
begin
  self.codigo := codigo;
end;

procedure TStatusOS.setOrdem(ordem: Integer);
begin
  self.ordem := ordem;
end;

function TStatusOS.validar: Boolean;
begin
  Result := False;

  if Trim(getCodigo) = '' then
    raise Exception.Create('Campo Código é obrigatório!');

  if Length(Trim(getCodigo)) > 30 then
    raise Exception.Create('Campo Código não pode exceder 30 caracteres!');

  if getOrdem < 0 then
    raise Exception.Create('Campo Ordem não pode ser negativo!');

  Result := True;
end;

end.
