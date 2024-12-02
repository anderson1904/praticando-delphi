unit CLasses.Emprestimos;

interface
type
  TEmprestimo = class
  private
    FValor:      currency;
    FJuros:      currency;
    FDataInicio:   string;
    FDataFim:      string;

    procedure CalcularJuros;

  protected
    { protected declarations }
  public
    { public declarations }

  published
    { published declarations }
  end;

  implementation

{ TEmprestimo }

procedure TEmprestimo.CalcularJuros;
begin

end;

end.
