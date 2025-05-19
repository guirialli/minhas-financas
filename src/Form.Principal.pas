unit Form.Principal;

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  ActnList, StdCtrls;

type

  { TFmlPrincipal }

  TFmlPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    MainContas: TMenuItem;
    MainCadFaturas: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MainCadBoletos: TMenuItem;
    procedure MainContasClick(Sender: TObject);
    procedure MainCadBoletosClick(Sender: TObject);
    procedure MainCadFaturasClick(Sender: TObject);
  private

  public

  end;

var
  FmlPrincipal: TFmlPrincipal;

implementation

uses Form.Cadastro_Boletos;

{$R *.lfm}

{ TFmlPrincipal }

procedure TFmlPrincipal.MainContasClick(Sender: TObject);
begin

end;

procedure TFmlPrincipal.MainCadBoletosClick(Sender: TObject);
var
   Fml: TFmlCadBoletos;
begin
  Fml := TFmlCadBoletos.Create(Self);
  try
     Fml.ShowModal;
  finally
    Fml.Free;
  end;
end;

procedure TFmlPrincipal.MainCadFaturasClick(Sender: TObject);
begin

end;

end.

