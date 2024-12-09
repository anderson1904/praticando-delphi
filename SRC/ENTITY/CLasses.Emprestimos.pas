unit CLasses.Emprestimos;

interface
uses DateUtils;
type
  TEmprestimo = class
  private
    FValor: currency;
    FTaxaJuros: currency;
    FDataInicio: TDateTime;
    FDataFim: TDateTime;

    procedure setValor(aValor: currency);
    procedure setJuros(aValor: currency);
    procedure setDataInicio(aValor: TDateTime);
    procedure setDataFim(aValor: TDateTime);

    Function CalcularJuros: currency;

  protected
    { protected declarations }
  public
    constructor create;
    destructor destroy;

    property Valor: currency read FValor write setValor;
    property TaxaJuros: currency read FTaxaJuros write setJuros;
    property DataInicio: TDateTime read FDataInicio write setDataInicio;
    property DataFim: TDateTime read FDataFim write setDataFim;

  published
    { published declarations }
  end;

implementation
{ TEmprestimo }

//construtor
constructor TEmprestimo.create;
begin

end;

//destruidor
destructor TEmprestimo.destroy;
begin

  inherited;
end;

//setters
procedure TEmprestimo.setValor(aValor: currency);
begin
  FValor := aValor;
end;

procedure TEmprestimo.setJuros(aValor: currency);
begin
  FTaxaJuros := aValor;
end;

procedure TEmprestimo.setDataInicio(aValor: TDateTime);
begin
  FDataInicio := aValor;
end;

procedure TEmprestimo.setDataFim(aValor: TDateTime);
begin
  FDataFim := aValor;
end;

// calculo de Juros
function TEmprestimo.CalcularJuros: Currency;
var
  LMeses: integer;
begin
  // terei que pegar a quantidade de meses a partir do data inicio e data fim
  LMeses:= DataFim.GetMonth + (DataFim.GetYear-Datainicio.GetYear)*12 - DataInicio.Month;
  // depois s� fazer o calculo dos juros
  Result := (Valor * TaxaJuros * LMeses);

end;

end.
