unit Classes.transacoes;

interface

uses System.SysUtils;

type
  TTipos = (tpDeposito, tpSaque, tpTransferencia, tpAgendamento);
  TTransação = class
  private
    FTipo: string;
    FValor: currency;
    FDataHora: TDateTime;
    FDescrisao: string;

    procedure setTipo(aTipo: TTipos);
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

{ TTransação }

constructor TTransação.create;
begin

end;

destructor TTransação.destroy;
begin

  inherited;
end;
//setters
procedure TTransação.setDataHora(aDataHora: TDateTime);
begin
  FDataHora := aDataHora;
end;

procedure TTransação.setDescrisao(aDescrisao: string);
begin
  FDescrisao := aDescrisao;
end;

procedure TTransação.setTipo(aTipo: TTipos);
var
  LTipos : TTipos;
  I : integer;
begin
  LTipos:= atipo;
  for I := 0 to 3 do
    if TTipos(i).ToString = aTipo then
    // raise Exception.Create('esse campo só possui Deposito, Saque, Transferencia e Agendamento');
    FTipo := aTipo;
end;

procedure TTransação.setValor(aValor: currency);
begin
  FValor := aValor;
end;

end.
