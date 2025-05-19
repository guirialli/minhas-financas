unit Form.Cadastro_Boletos;

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFmlCadBoletos }

  TFmlCadBoletos = class(TForm)
    CbCategoria: TComboBox;
    Edtbeneficiario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  FmlCadBoletos: TFmlCadBoletos;

implementation

{$R *.lfm}

{ TFmlCadBoletos }


end.

