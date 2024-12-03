unit CLasses.Emprestimos;

interface
type
  TEmprestimo = class
  private
    FValor:          currency;
    FTaxaJuros:      currency;
    FDataInicio:       string;
    FDataFim:          string;

    procedure setValor(aValor: currency);
    procedure setJuros(aValor: currency);
    procedure setDataInicio(aValor: string);
    procedure setDataFim (aValor: string);

    procedure CalcularJuros;

  protected
    { protected declarations }
  public
    property Valor: currency read FValor write setValor;
    property TaxaJuros: currency read FTaxaJuros write setJuros;
    property DataInicio: string read FDataInicio write setDataInicio;
    property DataFim: string read FDataFim write setDataFim;

  published
    { published declarations }
  end;

  implementation

{ TEmprestimo }
procedure TEmprestimo.setValor(aValor: currency);
begin
  FValor:= aValor;
end;

procedure TEmprestimo.setJuros(aValor: currency);
begin
  FTaxaJuros:= aValor;
end;

procedure TEmprestimo.setDataInicio(aValor: string);
begin
  FDataInicio:= aValor;
end;

procedure TEmprestimo.setDataFim(aValor: string);
begin
  FDataFim := aValor;
end;

procedure TEmprestimo.CalcularJuros;
begin

end;
end.
