unit Classes.Clientes;

interface
uses system.Generics.Collections, System.SysUtils, System.RegularExpressions;
type
TCliente = class
private
  FCPF:   string;
  FNome:  string;
  FSenha: string;
  FAtivado: boolean;

  procedure SetCPF(aCPF: string);
  procedure SetNome(aNome: string);

protected
  { protected declarations }
public
  constructor create;
  property CPF: string read FCPF write setCPF;
  property nome: string read FNome write SetNome;
  property senha: string read FSenha;
  property Ativado: boolean read FAtivado;

  function Autenticar(aSenha: string): boolean;
  procedure InserirSenha(aSenha: string);
 	procedure TrocarSenha(aSenhaAtual: string; aNovaSenha: string);

published
  { published declarations }
end;
implementation

//setters
procedure TCliente.setCPF(aCPF: string);
begin
  if not(length(aCPF) = 11) then
    raise Exception.Create('o CPF deve conter 11 números');

end;

procedure TCliente.SetNome(aNome: string);
begin
  FNome := aNome;
end;



//senha
function TCliente.Autenticar(aSenha: string): boolean;
var
  LBool: Boolean;
begin
  LBool:= False;
  if Length(aSenha) >=8 then
    LBool := True;
  result:= Lbool;

end;

constructor TCliente.create;
begin
  FAtivado:= True;
end;

procedure TCliente.InserirSenha(aSenha: string);
begin
  if not autenticar(aSenha) then
    raise Exception.Create('a senha precisa ter 8 ou mais caracteres');
  Fsenha:= aSenha;
end;

procedure TCliente.TrocarSenha(aSenhaAtual: string; aNovaSenha: string);
begin
  if  not(Fsenha = aSenhaAtual) then
    raise Exception.Create('senha incorreta');
  Fsenha:= aNovaSenha;
end;

end.
