unit Classes.Contas;

interface

uses
  Classes.Clientes, Classes.Emprestimos, Classes.transacoes,
  system.Generics.Collections, DateUtils, System.SysUtils, System.Classes,
  System.TypInfo;

type
  TConta = class
  private
    FNumero: string;
    FSaldo: Currency;
    FCliente: TCliente;
    FAtivado: boolean;
    FTransacoes: Tobjectlist<TTransacao>;
    FEmprestimos: Tobjectlist<TEmprestimo>;

    procedure setCliente(const aValue: TCliente);
    procedure SetAtivado(aBool: boolean);
    procedure SetNumero(aNumero: string);

    procedure adicionarTransacao(aTipo: TTransacaoTipos; aValor: Currency; aDescrisao: string);
  protected
    { protected declarations }
  public
    constructor create;
    destructor destroy;
    procedure Depositar(aValor: Currency); overload;
    procedure Depositar(aValor: Currency; aDescrisao: string); overload;
    procedure Sacar(aValor: Currency); overload;
    procedure Sacar(aValor: Currency;aTipo:TTransacaoTipos; aDescrisao: string); overload;
    procedure Transferir(aValor: Currency; aDestino: TConta);
    procedure SolicitarEmprestimo(aValor: Currency; aTaxaJuros: Currency;
      aDataInicio: TDateTime; aMeses: integer);
    function GerarExtrato: string;

    property Emprestimos: Tobjectlist<TEmprestimo> read FEmprestimos;
    property Numero:  string read FNumero write SetNumero;
    property CLiente: TCliente read FCliente write setCliente;
    property Ativado: boolean read FAtivado write SetAtivado;
    property Saldo: currency read FSaldo;
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

  FTransacoes:= TObjectlist<TTransacao>.create;
  FEmprestimos:= TObjectlist<TEmprestimo>.create;
end;

//destruidor
destructor TConta.destroy;
begin
  FTransacoes.free;
  FEmprestimos.free;
  inherited;
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

//transa��es
procedure TConta.adicionarTransacao(aTipo: TTransacaoTipos; aValor: Currency;
   aDescrisao: string);
var
  LTransacao: TTransacao;
begin
  LTransacao := TTransacao.create;
  LTransacao.Tipo := aTipo;
  LTransacao.Valor := aValor;
  LTransacao.Descrisao := aDescrisao;

  FTransacoes.add(LTransacao);
end;

//depositos
procedure TConta.Depositar(aValor: Currency);
var
  LDescrisao: string;
begin
  LDescrisao:=format('R$ %d depositados com sucesso',[aValor]);
  FSaldo := FSaldo + aValor;
  adicionarTransacao(tpDeposito,aValor, LDescrisao);
end;

procedure TConta.Depositar(aValor: Currency; aDescrisao: string);
begin
  FSaldo := FSaldo + aValor;
  adicionarTransacao(tpDeposito, aValor, aDescrisao);
end;

//Saques
procedure TConta.Sacar(aValor: Currency);
var
  LDescrisao: string;
begin
  if aValor >FSaldo then
    raise Exception.Create('Saldo insuficiente');

  LDescrisao:=format('R$ %d sacados com sucesso',[aValor]);
  FSaldo := FSaldo - aValor;
  adicionarTransacao(tpSaque, aValor, LDescrisao);
end;

procedure TConta.Sacar(aValor: Currency;aTipo: TTransacaoTipos; aDescrisao: string);
begin
  if aValor >FSaldo then
    raise Exception.Create('Saldo insuficiente');
  FSaldo := FSaldo - aValor;
  adicionarTransacao(aTipo, aValor, aDescrisao);
end;


//solicitar emprestimo
procedure TConta.SolicitarEmprestimo(aValor: Currency; aTaxaJuros: Currency;
  aDataInicio: TDateTime; aMeses: integer);
var
  Lemprestimo: TEmprestimo;
  LDescrisao: string;
begin
  Lemprestimo := TEmprestimo.create;
  Lemprestimo.Valor := aValor;
  Lemprestimo.TaxaJuros := aTaxaJuros;
  Lemprestimo.DataInicio := aDataInicio;
  Lemprestimo.DataFim := IncMonth(aDataInicio, AMeses);
  Emprestimos.add(Lemprestimo);
  LDescrisao:= format('Voc� recebeu R$ %d de emprestimo',[aValor]);
  depositar(aValor,Ldescrisao);
end;

//transferencia
procedure TConta.Transferir(aValor: Currency; aDestino: TConta);
var
  LDescrisao: string;
begin
  LDescrisao:= format('R$ %d transferidos para a conta: %s',[aValor, aDestino.FNumero]);
  self.sacar(aValor,tpTransferencia, LDescrisao);
  aDestino.Depositar(aValor);
end;

//extrato
function TConta.GerarExtrato: string;
var
  LExtratos: TStringList;
  Ltransacao: TTransacao;
  LTipoTransacao: string;

begin
  LExtratos:= Tstringlist.Create;
  try
    LExtratos.Add('extrato da conta '+ self.FNumero);
    LExtratos.Add('-------------------------------------------------------');
    for Ltransacao in FTransacoes do
    begin
      LTipoTransacao:= getenumname(Typeinfo(TTransacaoTipos), integer(Ltransacao.Tipo));
      LExtratos.Add(format('%s - %s - R$ %s',
                          [Ltransacao.DataHora.ToString,
                           LTipoTransacao,
                           LTransacao.Descrisao
                          ]));
    end;
    LExtratos.add('Saldo atual: R$ '+ FSaldo.ToString);
    result:= Lextratos.Text;
  finally
    LExtratos.Free;
  end;
end;
end.
