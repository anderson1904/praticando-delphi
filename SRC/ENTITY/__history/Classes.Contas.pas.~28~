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

  procedure adicionarTransação(
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

procedure TConta.adicionarTransação(
    aTipo:        string;
    aValor:     currency;
    aDataHora:    string;
    aDescrisao:   string
    );
var
  LTransação: TTransação;
begin
  LTransação:= TTransação.Create;
  Ltransação.Tipo:= aTipo;
  Ltransação.Valor:= aValor;
  Ltransação.DataHora:= aDataHora;
  Ltransação.Descrisao:= aDescrisao;
  Ftransacoes.add(LTransação);
end;

procedure TConta.Depositar(aValor: currency);
begin
  FSaldo := FSaldo - aValor;
  adicionarTransação('deposito',aValor,'data','');
end;

function TConta.GerarExtrato: string;
begin

end;

procedure TConta.Sacar(aValor: currency);
begin
  FSaldo := Fsaldo + aValor;
  adicionarTransação('Saque',aValor,'data','');
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
  Lemprestimo.DataInicio:= 'data exata da solicitação';
  Lemprestimo.DataFim:= 'data de solicitação + aMeses';
  Femprestimos.add(Lemprestimo)
end;

procedure TConta.Transferir(aValor: currency; aDestino: TConta);
begin
  self.FSaldo := self.FSaldo - aValor;
  aDestino.FSaldo := aDestino.FSaldo + aValor;
  adicionarTransação('transferencia',aValor,'data','');
end;
end.
