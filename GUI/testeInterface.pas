unit testeInterface;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls,

  Classes.Banco, Classes.Clientes, Classes.Contas, Classes.Emprestimos, Classes.Transacoes
  ;

type
  TForm1 = class(TForm)
    btnAddCliente: TButton;
    btnListarClientes: TButton;
    btnAddConta: TButton;
    btnListarContas: TButton;
    btnSacar: TButton;
    btnDepositar: TButton;
    btnTransferir: TButton;
    btnPedirEmprestimo: TButton;
    btnGerarExtrato: TButton;
    btnGerarRelatorio: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClienteClick(Sender: TObject);
    procedure btnListarClientesClick(Sender: TObject);
    procedure btnAddContaClick(Sender: TObject);
    procedure btnListarContasClick(Sender: TObject);
    procedure btnGerarExtratoClick(Sender: TObject);
    procedure btnDepositarClick(Sender: TObject);
    procedure btnSacarClick(Sender: TObject);
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure btnTransferirClick(Sender: TObject);
    procedure btnPedirEmprestimoClick(Sender: TObject);
  private
    FBanco: TBanco;
  public
    { Public declarations }
    function GetConta: TConta;
  end;

var
  Form1:  TForm1;

implementation
{$R *.fmx}
procedure TForm1.btnAddContaClick(Sender: TObject);
var
  LConta: TConta;
  LCPF: string;
  LSenha: string;
  LCliente: TCLiente;
begin
  LCPF:= inputbox('digite o CPF','CPF:','CPF...');
  Lsenha:= inputbox('digite a senha','senha:','senha...');
  LCliente:= FBanco.BuscarCliente(LCPF);
  if LCLiente = nil then
    raise Exception.Create('CLiente não encontrado');

  LConta := TConta.Create;
  LConta.Numero := InputBox('Numero:','Numero','Numero...');
  LConta.CLiente:= LCliente;
  Lconta.Depositar(800);
  FBanco.AdicionarConta(LConta);
end;

procedure TForm1.btnDepositarClick(Sender: TObject);
var
  LConta: TConta;
  Lvalor: currency;
begin
  LConta:= GetConta;
  LValor:= inputbox('valor','valor','valor').ToDouble;
  LConta.Depositar(LValor);
end;

procedure TForm1.btnGerarExtratoClick(Sender: TObject);
var
  LNumero: string;
  LConta: TConta;
begin
  LConta:= GetConta;
  ShowMessage(LConta.GerarExtrato);
end;

procedure TForm1.btnGerarRelatorioClick(Sender: TObject);
begin
  ShowMessage(FBanco.GerarRelatorioTransacoes);
end;

procedure TForm1.btnListarClientesClick(Sender: TObject);
var
  I: integer;
begin
  for I := 0 to pred(FBanco.Clientes.count) do
    ShowMessage(FBanco.Clientes[i].CPF + ' '+FBanco.Clientes[i].senha);
end;

procedure TForm1.btnListarContasClick(Sender: TObject);
var
  I: integer;
begin
  for I := 0 to pred(FBanco.Contas.count) do
    ShowMessage(FBanco.Contas[i].Numero+ ': '+ FBanco.Contas[i].Saldo.ToString);
end;

procedure TForm1.btnPedirEmprestimoClick(Sender: TObject);
var
  LConta: TConta;
  LValor: currency;
begin
  LConta:= GetConta;
  LValor:= inputbox('valor','valor','valor...').ToDouble;
  LConta.SolicitarEmprestimo(LValor,0.01,now,6);
end;

procedure TForm1.btnSacarClick(Sender: TObject);
var
  LConta: TConta;
  Lvalor: currency;
begin
  LConta:= GetConta;
  LValor:= inputbox('valor','valor','valor...').ToDouble;
  LConta.Sacar(LValor);
end;

procedure TForm1.btnTransferirClick(Sender: TObject);
var
  LContaInit: TConta;
  LContaDest: TConta;
  LValor: Currency;
begin
  ShowMessage('dados da conta atual');
  LContaInit := GetConta;
  ShowMessage('dados da conta que quer tranferir');
  LContaDest := GetConta;
  LValor := inputbox('valor','valor:','valor...').ToDouble;
  LContaInit.Transferir(LValor,LContaDest);

end;

procedure TForm1.btnAddClienteClick(Sender: TObject);
var
  LCliente: TCLiente;
  LSenha: string;
begin
  LCliente:=TCLiente.Create;
  LCliente.CPF:= InputBox('CPF:','CPF:','CPF...');
  LCliente.Nome:= InputBox('Nome:','Nome:','Nome...');

  LSenha:= inputbox('senha:','senha:','senha...');
  LCLiente.InserirSenha(Lsenha);
  FBanco.AdicionarCliente(LCliente);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FBanco:= TBanco.create;
end;

function TForm1.GetConta: TConta;
var
  LNumero: string;
begin
  LNumero:= inputbox('numero','numero:','numero...');
  Result := FBanco.BuscarConta(Lnumero);
end;

end.
