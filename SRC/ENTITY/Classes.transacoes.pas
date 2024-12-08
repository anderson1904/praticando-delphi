unit Classes.transacoes;

interface

uses System.SysUtils;

type
  TTipos = (tpDeposito, tpSaque, tpTransferencia, tpAgendamento);
  TTransa��o = class
  private
    FTipo: string;
    FValor: currency;
    FDataHora: TDateTime;
    FDescrisao: string;

    procedure setTipo(aTipo: string);
    procedure setValor(aValor: currency);
    procedure setDataHora(aDataHora: TDateTime);
    procedure setDescrisao(aDescrisao: string);

  protected
    { protected declarations }

  public
    constructor create;
    destructor destroy;

    property Tipo: string read FTipo write setTipo;
    property Valor: currency read FValor write setValor;
    property DataHora: TDateTime read FDataHora write setDataHora;
    property Descrisao: string read FDescrisao write setDescrisao;
  published
    { published declarations }
  end;

implementation

{ TTransa��o }

constructor TTransa��o.create;
begin

end;

destructor TTransa��o.destroy;
begin

  inherited;
end;
//setters
procedure TTransa��o.setDataHora(aDataHora: TDateTime);
begin
  FDataHora := aDataHora;
end;

procedure TTransa��o.setDescrisao(aDescrisao: string);

begin
  FDescrisao := aDescrisao;
end;

procedure TTransa��o.setTipo(aTipo: string);
var
  LTipos : TTipos;
  I : integer;
begin
    if True then
    // raise Exception.Create('esse campo s� possui Deposito, Saque, Transferencia e Agendamento');
    FTipo := aTipo;
end;

procedure TTransa��o.setValor(aValor: currency);
begin
  FValor := aValor;
end;

end.
