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
    btnTestes: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnTestesClick(Sender: TObject);
  private
    FBanco: TBanco;
  public
    { Public declarations }
  end;

var
  Form1:  TForm1;

implementation
{$R *.fmx}
procedure TForm1.btnTestesClick(Sender: TObject);
var
  LCliente: TCLiente;
  LSenha: string;

begin
  LCliente:=TCLiente.Create;
  LCliente.CPF:=InputBox('CPF:','CPF:','CPF...');
  LCliente.Nome:=InputBox('Nome:','Nome:','Nome...');

  LSenha:= inputbox('senha:','senha:','senha...');
  LCLiente.InserirSenha(Lsenha);
  ShowMessage(LCLiente.nome + LCliente.CPF + LCliente.senha);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FBanco:= TBanco.create;
end;

end.
