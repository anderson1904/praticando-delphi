program ProjectBank;

uses
  System.StartUpCopy,
  FMX.Forms,
  testeInterface in 'GUI\testeInterface.pas' {Form1},
  Classes.Clientes in 'SRC\ENTITY\Classes.Clientes.pas',
  Classes.Contas in 'SRC\ENTITY\Classes.Contas.pas',
  CLasses.Emprestimos in 'SRC\ENTITY\CLasses.Emprestimos.pas',
  Classes.Banco in 'SRC\ENTITY\Classes.Banco.pas',
  Classes.transacoes in 'SRC\ENTITY\Classes.transacoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
