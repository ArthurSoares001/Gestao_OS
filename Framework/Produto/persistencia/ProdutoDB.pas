unit ProdutoDB;

interface

uses
  Constantes, Filtro, Produto, System.Classes;  // Adicione System.Classes aqui

type
  IProdutoDB = interface
    procedure Inserir(Produto: TProduto);
    procedure Alterar(Produto: TProduto);
    function Procurar(Produto: TProduto): TProduto;
    procedure Deletar(Produto: TProduto);
    function ProcurarTodos(Filtro: TFiltro; OrdenarPor: Integer): TList;
  end;

implementation

end.
