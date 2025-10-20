unit OSDB;

interface

uses
  Constantes, Filtro, OS, System.Classes;  // Adicione System.Classes aqui

type
  IOSDB = interface
    procedure Inserir(OS: TOS);
    procedure Alterar(OS: TOS);
    function Procurar(OS: TOS): TOS;
    procedure Deletar(OS: TOS);
    function ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
  end;

implementation

end.
