unit model.categoria;

{$mode Delphi}

interface

uses
  Classes, SysUtils, ZDataset, Generics.Collections;

type


  { TCategoria }

  TCategoria = class
  private
    FId: integer;
    FNome: string;
  public
    property Id: integer read FId write FId;
    property Nome: string read FNome write FNome;

    class function CreateLista(Qry: TZQuery): TList<TCategoria>;

    constructor Create(Id: integer; Nome: string); overload;
    constructor Create(Qry: TZQuery); overload;
  end;

implementation

{ TCategoria }

class function TCategoria.CreateLista(Qry: TZQuery): TList<TCategoria>;
var
  E: TCategoria;
  I: integer;
begin
  Result := TList<TCategoria>.Create;
  try
    Qry.First;
    for I := 1 to Qry.RecordCount do
    begin

      E := TCategoria.Create(Qry);
      Result.Add(E);

      Qry.Next;
    end;
  except
    for E in Result do
      E.Free;

    Result.Free;
    raise;
  end;
end;


constructor TCategoria.Create(Id: integer; Nome: string);
begin
  Self.FId := Id;
  Self.FNome := Nome;
end;

constructor TCategoria.Create(Qry: TZQuery);
begin
  Self.FId := Qry.FieldByName('idcategoria').AsInteger;
  Self.FNome := Qry.FieldByName('nomecategoria').AsString;
end;

end.
