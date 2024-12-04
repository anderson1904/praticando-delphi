unit Classes.transacoes;

interface

uses System.SysUtils;

type
  TTransa��o = class
  private
    FTipo: string;
    FValor: currency;
    FDataHora: string;
    FDescrisao: string;

    procedure setTipo(aTipo: string);
    procedure setValor(aValor: currency);
    procedure setDataHora(aDataHora: string);
    procedure setDescrisao(aDescrisao: string);

  protected
    { protected declarations }

  public
    property Tipo: string read FTipo write setTipo;
    property Valor: currency read FValor write setValor;
    property DataHora: string read FDataHora write setDataHora;
    property Descrisao: string read FDescrisao write setDescrisao;
  published
    { published declarations }
  end;

implementation

{ TTransa��o }

procedure TTransa��o.setDataHora(aDataHora: string);
begin
  FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
end;

procedure TTransa��o.setDescrisao(aDescrisao: string);
begin
  FDescrisao := aDescrisao;
end;

procedure TTransa��o.setTipo(aTipo: string);
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
