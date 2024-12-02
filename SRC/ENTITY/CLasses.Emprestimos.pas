unit CLasses.Emprestimos;

interface
type
  TEmprestimo = class
  private
    FValor:      currency;
    FJuros:      currency;
    FDataInicio:   string;
    FDataFim:      string;

    procedure setValor(aValor: currency);
    procedure setJuros(aValor: currency);
    procedure setDataInicio(aValor: string);
    procedure setDataFim (aValor: string);

    procedure CalcularJuros;
    function getter: string;

  protected
    { protected declarations }
  public
    property Valor: currency read FValor write setValor;
    property Juros: currency read FJuros write setJuros;
    property DataInicio: string read FDataInicio write setDataInicio;
    property DataFim: string read FDataFim write setDataFim;

  published
    { published declarations }
  end;

  implementation

{ TEmprestimo }
procedure TEmprestimo.setValor(aValor: currency);
begin
  
end;

procedure TEmprestimo.setJuros(aValor: currency);
begin

end;

procedure TEmprestimo.setDataInicio(aValor: string);
begin

end;

function TEmprestimo.getter: string;
begin

end;

procedure TEmprestimo.setDataFim(aValor: string);
begin

end;

procedure TEmprestimo.CalcularJuros;
begin

end;
end.
