unit Classes.Contas;


interface
  uses
  Classes.Clientes,Classes.Emprestimos,Classes.transacoes,
  system.Generics.Collections;
type
TConta = class(TCliente)
private
  FNumero:              string;
  FSaldo:             Currency;
  FCliente:           TCliente;
  FTransacoes:          string;
  FEmprestimos:       Tobjectlist<TEmprestimo>;

  procedure SetNumero(aNumero: string);

  procedure Depositar(aValor: currency);
 	procedure Sacar(aValor: currency);
 	procedure Transferir(
    aValor:        currency;
    aContaDestino:   string
  );
 	procedure SolicitarEmprestimo(
    aValor:      currency;
    aTaxaJuros:  currency;
    aMeses:        string
  );
 	function GerarExtrato: string;
protected
  { protected declarations }
public
  property Numero: string read FNumero write SetNumero;

published
  { published declarations }
end;
implementation

{ TConta }

procedure TConta.Depositar(aValor: currency);
begin
  FSaldo := FSaldo - aValor;
end;

function TConta.GerarExtrato: string;
begin

end;

procedure TConta.Sacar(aValor: currency);
begin
  FSaldo := Fsaldo + aValor
end;

procedure TConta.SetNumero(aNumero: string);
begin

end;

procedure TConta.SolicitarEmprestimo(aValor, aTaxaJuros: currency;
  aMeses: string);
begin

end;

procedure TConta.Transferir(aValor: currency; aContaDestino: string);
begin

end;

end.
