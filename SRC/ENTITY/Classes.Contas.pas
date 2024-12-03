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
  FTransacoes:        Tobjectlist<TTransa��o>;
  FEmprestimos:       Tobjectlist<TEmprestimo>;

  procedure adicionarTransa��o(
    aTipo:        string;
    aValor:     currency;
    aDataHora:    string;
    aDescrisao:   string
    );
    procedure setCliente(const aValue: TCLiente);

protected
  { protected declarations }
public
  constructor create;
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

  property Numero: string read FNumero write SetNumero;
  property CLiente: TCLiente read FCLiente write setCliente;
published
  { published declarations }
end;
implementation

{ TConta }
constructor TConta.create;
begin
  FSaldo := 0;
  Fativado:= True;
end;

procedure TConta.adicionarTransa��o(
    aTipo:        string;
    aValor:     currency;
    aDataHora:    string;
    aDescrisao:   string
    );
var
  LTransa��o: TTransa��o;
begin
  LTransa��o:= TTransa��o.Create;
  Ltransa��o.Tipo:= aTipo;
  Ltransa��o.Valor:= aValor;
  Ltransa��o.DataHora:= aDataHora;
  Ltransa��o.Descrisao:= aDescrisao;
  Ftransacoes.add(LTransa��o);
end;

procedure TConta.Depositar(aValor: currency);
begin
  FSaldo := FSaldo - aValor;
  adicionarTransa��o('deposito',aValor,'data','');
end;

function TConta.GerarExtrato: string;
begin

end;

procedure TConta.Sacar(aValor: currency);
begin
  FSaldo := Fsaldo + aValor;
  adicionarTransa��o('Saque',aValor,'data','');
end;

procedure TConta.setCliente(const aValue: TCLiente);
begin
  FCLiente := aValue;
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
  Lemprestimo.TaxaJuros := aTaxaJuros;
  Lemprestimo.DataInicio:= 'data exata da solicita��o';
  Lemprestimo.DataFim:= 'data de solicita��o + aMeses';
  Femprestimos.add(Lemprestimo)
end;

procedure TConta.Transferir(aValor: currency; aDestino: TConta);
begin
  self.FSaldo := self.FSaldo - aValor;
  aDestino.FSaldo := aDestino.FSaldo + aValor;
  adicionarTransa��o('transferencia',aValor,'data','');
end;
end.
