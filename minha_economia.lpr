program minha_economia;

{$mode Delphi}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Form.Principal, Form.Cadastro_Boletos, Dm.Global, Dao.Db,
model.categoria
  { you can add units after this };

{$R *.res}

begin
  TDmGlobal.Initialize;
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFmlPrincipal, FmlPrincipal);
  Application.Run;
end.

