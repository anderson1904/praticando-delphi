unit CLasses.Emprestimos;

interface

type
  TEmprestimo = class
  private
    FValor: currency;
    FTaxaJuros: currency;
    FDataInicio: string;
    FDataFim: string;

    procedure setValor(aValor: currency);
    procedure setJuros(aValor: currency);
    procedure setDataInicio(aValor: string);
    procedure setDataFim(aValor: string);

    procedure CalcularJuros;

  protected
    { protected declarations }
  public
    constructor create;
    destructor destroy;

    property Valor: currency read FValor write setValor;
    property TaxaJuros: currency read FTaxaJuros write setJuros;
    property DataInicio: string read FDataInicio write setDataInicio;
    property DataFim: string read FDataFim write setDataFim;

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

procedure TEmprestimo.setDataInicio(aValor: string);
begin
  FDataInicio := aValor;
end;

procedure TEmprestimo.setDataFim(aValor: string);
begin
  FDataFim := aValor;
end;

// calculo de Juros
procedure TEmprestimo.CalcularJuros;
begin

  // terei que pegar a quantidade de meses a partir do data inicio e data fim
  // depois s� fazer o calculo dos juros
end;

end.
