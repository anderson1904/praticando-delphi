unit Classes.Clientes;

interface

uses system.SysUtils;

type
  TCliente = class
  private
    FCPF: string;
    FNome: string;
    FSenha: string;
    FAtivado: boolean;

    procedure SetCPF(aCPF: string);
    procedure SetNome(aNome: string);
    procedure SetAtivado(aBool: boolean);
  protected
    { protected declarations }
  public
    constructor create;
    destructor destroy; override;
    property CPF: string read FCPF write SetCPF;
    property nome: string read FNome write SetNome;
    property senha: string read FSenha;
    property Ativado: boolean read FAtivado write SetAtivado;

    function Autenticar(aCPF, aSenha: string): boolean;
    procedure InserirSenha(aSenha: string);
    procedure TrocarSenha(aSenhaAtual: string; aNovaSenha: string);

  published
    { published declarations }
  end;

implementation

//construtor
constructor TCliente.create;
begin
  FAtivado := True;
end;

//destruidor
destructor TCliente.destroy;
begin

  inherited;
end;

// setters
procedure TCliente.SetCPF(aCPF: string);
begin
  if aCPF.Length <> 11 then
    raise Exception.create('o CPF deve conter 11 n�meros');
  FCPF := aCPF;
end;

procedure TCliente.SetNome(aNome: string);
begin
  FNome := aNome;
end;

procedure TCliente.SetAtivado(aBool: boolean);
begin
  FAtivado := aBool;
end;

// login
function TCliente.Autenticar(aCPF,aSenha: string): boolean;
begin
  result := False;
  if (aCPF = FCPF) and (aSenha = FSenha) then
    result:=True;
end;

//senha
procedure TCliente.InserirSenha(aSenha: string);
begin
  if aSenha.Length < 8 then
    raise Exception.create('a senha precisa ter 8 ou mais caracteres');
  FSenha := aSenha;
end;

procedure TCliente.TrocarSenha(aSenhaAtual: string; aNovaSenha: string);
begin
  if FSenha <> aSenhaAtual then
    raise Exception.create('senha atual incorreta');
  FSenha := aNovaSenha;
end;

end.
