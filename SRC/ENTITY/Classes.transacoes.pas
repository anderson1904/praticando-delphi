unit Classes.transacoes;

interface

uses System.SysUtils;

type
  TTransacaoTipos = (tpDeposito, tpSaque, tpTransferencia, tpAgendamento);
  TTransacao = class
  private
    FTipo: TTransacaoTipos;
    FValor: currency;
    FDataHora: TDateTime;
    FDescrisao: string;

    procedure setTipo(aTipo: TTransacaoTipos);
    procedure setValor(aValor: currency);
    procedure setDataHora(aDataHora: TDateTime);
    procedure setDescrisao(aDescrisao: string);

  protected
    { protected declarations }

  public
    constructor create;
    destructor destroy;

    property Tipo: TTransacaoTipos read FTipo write setTipo;
    property Valor: currency read FValor write setValor;
    property DataHora: TDateTime read FDataHora write setDataHora;
    property Descrisao: string read FDescrisao write setDescrisao;
  published
    { published declarations }
  end;

implementation

{ TTransação }

constructor TTransacao.create;
begin
  FDataHora:= now;
end;

destructor TTransacao.destroy;
begin

  inherited;
end;
//setters
procedure TTransacao.setDataHora(aDataHora: TDateTime);
begin
  FDataHora := aDataHora;
end;

procedure TTransacao.setDescrisao(aDescrisao: string);
begin
  FDescrisao := aDescrisao;
end;

procedure TTransacao.setTipo(aTipo: TTransacaoTipos);
begin
    FTipo := aTipo;
end;

procedure TTransacao.setValor(aValor: currency);
begin
  FValor := aValor;
end;

end.
