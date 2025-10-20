unit TecnicoDB;

interface

uses
  Constantes, Filtro, Tecnico, System.Classes;  // Adicione System.Classes aqui

type
  ITecnicoDB = interface
    procedure Inserir(Tecnico: TTecnico);
    procedure Alterar(Tecnico: TTecnico);
    function Procurar(Tecnico: TTecnico): TTecnico;
    procedure Deletar(Tecnico: TTecnico);
    function ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
  end;

implementation

end.
