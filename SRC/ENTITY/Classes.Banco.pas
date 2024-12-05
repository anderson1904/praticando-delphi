unit Classes.Banco;

interface
uses   System.Generics.Collections, System.SysUtils,
Classes.Clientes, Classes.Contas;

type
  TBanco = class

  private
    FClientes:  Tobjectlist<TCliente>;
    FContas:      Tobjectlist<TConta>;



    function GerarRelatorioTransacoes:   string;

  protected
    { protected declarations }
  public
    constructor create;
    destructor destroy; override;

    procedure AdicionarConta(aConta: TConta);
    procedure AdicionarCliente(aCliente: TCliente);

    function BuscarConta(aNumero:string): TConta;
    function BuscarCliente(aCPF: string): TCliente;

    procedure DesativarConta(aConta: TConta);
    procedure DesativarCliente(aCliente: TCLiente);
    property Clientes: TObjectlist<TCliente> read FClientes;
    property Contas: TObjectlist<TConta> read FContas;
end;
implementation
//construtor
  constructor TBanco.create;
  begin
    FClientes:= Tobjectlist<TCliente>.Create;
    FContas:= Tobjectlist<TConta>.Create;
  end;

//destrutor
  destructor TBanco.destroy;
  begin
    FClientes.free;
    FContas.free;
    inherited;
  end;


//procedimentos de adi��o
  procedure TBanco.AdicionarCliente(aCliente: TCliente);
  var
    I: integer;
  begin
    for I := 0 to pred(FClientes.Count) do
    begin
      if Fclientes[i].CPF = aCLiente.CPF then
        raise Exception.Create('Cliente j� cadastrado');
    end;

    FClientes.Add(aCliente);
  end;

  procedure TBanco.AdicionarConta(aConta: TConta);
  var
    I: integer;
  begin
    for I := 0 to pred(FContas.Count) do
    begin
      if FContas[i].Numero = aConta.Numero then
        raise Exception.Create('Conta j� cadastrado');
    end;
    FContas.Add(aConta);
  end;

//fun��es de busca
  function TBanco.BuscarCliente(aCPF: string): TCliente;
 var
  i: integer;
  begin
    result:= nil;
    for i := 0 to pred(FClientes.Count) do
    begin
      if FClientes[i].CPF = aCPF then
      begin
        result := FClientes[i];
        break;
      end;
    end;
  end;

  function TBanco.BuscarConta(aNumero: string): TConta;
  var
    i: integer;
  begin
    result:= nil;
    for i := 0 to pred(FContas.Count) do
    begin
      if FContas[i].Numero = aNumero then
      begin
        result := FContas[i];
        break;
      end;
    end;
  end;

//procedimentos de desativar
  procedure TBanco.DesativarCliente(aCliente: TCliente);
  begin
    aCliente.Ativado := False;
  end;

  procedure TBanco.DesativarConta(aConta: TConta);
  begin
    aConta.Ativado:= False;
  end;

//fun��o para gerar relat�rio
  function TBanco.GerarRelatorioTransacoes: string;
  begin
    //percorrer por todos as contas e pegar o extrato de todas as transa��es
    //retornar todas elas uma por uma
  end;
end.
