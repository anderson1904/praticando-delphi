unit Classes.Contas;

interface

uses
  Classes.Clientes, Classes.Emprestimos, Classes.transacoes,
  system.Generics.Collections;

type
  TConta = class
  private
    FNumero: string;
    FSaldo: Currency;
    FCliente: TCliente;
    FAtivado: boolean;
    FTransacoes: Tobjectlist<TTransação>;
    FEmprestimos: Tobjectlist<TEmprestimo>;

    procedure setCliente(const aValue: TCliente);
    procedure SetAtivado(aBool: boolean);
    procedure SetNumero(aNumero: string);

    procedure adicionarTransação(aTipo: string; aValor: Currency;
      aDataHora: string; aDescrisao: string);
  protected
    { protected declarations }
  public
    constructor create;

    procedure Depositar(aValor: Currency);
    procedure Sacar(aValor: Currency);
    procedure Transferir(aValor: Currency; aDestino: TConta);
    procedure SolicitarEmprestimo(aValor: Currency; aTaxaJuros: Currency;
      aMeses: string);
    function GerarExtrato: string;

    property Numero:  string read FNumero write SetNumero;
    property CLiente: TCliente read FCliente write setCliente;
    property Ativado: boolean read FAtivado write SetAtivado;
  published
    { published declarations }
  end;

implementation

{ TConta }
//construtor
constructor TConta.create;
begin
  FSaldo := 0;
  FAtivado := True;
end;

//setters
procedure TConta.setCliente(const aValue: TCliente);
begin
  FCliente := aValue;
end;

procedure TConta.SetNumero(aNumero: string);
begin
  FNumero := aNumero;
end;

procedure TConta.SetAtivado(aBool: boolean);
begin
  FAtivado := aBool;
end;

//transações
procedure TConta.adicionarTransação(aTipo: string; aValor: Currency;
  aDataHora: string; aDescrisao: string);
var
  LTransação: TTransação;
begin
  LTransação := TTransação.create;
  LTransação.Tipo := aTipo;
  LTransação.Valor := aValor;
  LTransação.DataHora := aDataHora;
  LTransação.Descrisao := aDescrisao;
  FTransacoes.add(LTransação);
end;

//depositos
procedure TConta.Depositar(aValor: Currency);
var
  LDescrisao: string;
begin

  FSaldo := FSaldo - aValor;
  adicionarTransação('deposito', aValor, 'data', '');
end;

//Saques
procedure TConta.Sacar(aValor: Currency);
var
  LDescrisao: string;
begin
  FSaldo := FSaldo + aValor;
  adicionarTransação('Saque', aValor, 'data', '');
end;

procedure TConta.SolicitarEmprestimo(aValor: Currency; aTaxaJuros: Currency;
  aMeses: string);
var
  Lemprestimo: TEmprestimo;
begin
  Lemprestimo := TEmprestimo.create;
  Lemprestimo.Valor := aValor;
  Lemprestimo.TaxaJuros := aTaxaJuros;
  Lemprestimo.DataInicio := 'data exata da solicitação';
  Lemprestimo.DataFim := 'data de solicitação + aMeses';
  FEmprestimos.add(Lemprestimo)
end;

procedure TConta.Transferir(aValor: Currency; aDestino: TConta);
var
  LDescrisao: string;
begin
  self.FSaldo := self.FSaldo - aValor;
  aDestino.FSaldo := aDestino.FSaldo + aValor;
  adicionarTransação('transferencia', aValor, 'data', '');
end;
//extrato
function TConta.GerarExtrato: string;
begin
  // percorrer pela lista de transações

  // colocar cada transação dentro de um frame
end;
end.
