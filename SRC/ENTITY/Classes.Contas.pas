unit Classes.Contas;


interface
  uses
  Classes.Clientes,Classes.Emprestimos,Classes.transacoes,
  system.Generics.Collections;
type
TConta = class
private
  FNumero:              string;
  FSaldo:             Currency;
  FCliente:           TCliente;
  FAtivado:            boolean;
  FTransacoes:        Tobjectlist<TTransação>;
  FEmprestimos:       Tobjectlist<TEmprestimo>;

  procedure adicionarTransação;
  procedure SetNumero(aNumero: string);

  procedure Depositar(aValor: currency);
 	procedure Sacar(aValor: currency);
 	procedure Transferir(
    aValor:        currency;
    aDestino:   TConta
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

procedure TConta.adicionarTransação;
begin

end;

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
  FNumero := aNumero;
end;

procedure TConta.SolicitarEmprestimo(
  aValor:       currency;
  aTaxaJuros:   currency;
  aMeses:         string
  );
var
  Lemprestimo: Temprestimo;
begin
  Lemprestimo := Temprestimo.Create;
  Lemprestimo.Valor := aValor;
  Lemprestimo.Juros := aTaxaJuros;
  Lemprestimo.DataInicio:= 'data exata da solicitação';
  Lemprestimo.DataFim:= 'data de solicitação + aMeses';
end;

procedure TConta.Transferir(aValor: currency; aDestino: TConta);
begin
  self.FSaldo := self.FSaldo - aValor;
  aDestino.FSaldo := aDestino.FSaldo + aValor;
end;

end.
