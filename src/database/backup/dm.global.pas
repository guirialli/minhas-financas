unit Dm.Global;

{$mode Delphi}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset, Dao.DB;

type

  { TDmGlobal }

  TDmGlobal = class
  private
    FConn: TZConnection;
    FQry: TZQuery;
  protected
    function GetConn: TZConnection;
  public
    property Conn: TZConnection read FConn;
    property Qry: TZQuery read FQry;

    class procedure Initialize; static;

    constructor Create(); overload;
    constructor Create(Conn: TZConnection); overload;
    destructor Destroy; override;
  end;

implementation

{ TDmGlobal }

function TDmGlobal.GetConn: TZConnection;
begin
  try
    Result := TZConnection.Create(nil);
    Result.Protocol := 'sqlite';
    Result.Database := GetCurrentDir + PathDelim + 'data.sqlite';
    ;
    Result.Connect;
  except
    Result.Free;
    FConn := nil;
    raise;
  end;
end;

class procedure TDmGlobal.Initialize;
var
  Dm: TDmGlobal;
begin
  Dm := TDmGlobal.Create();
  try
    Dm.Conn.StartTransaction;
    try
      TDaoDb.Initialize().Initialize(Dm.Qry);
      Dm.Conn.commit;
    except
      Dm.Conn.Rollback;
    end;
  finally
    Dm.Free;
  end;
end;

constructor TDmGlobal.Create();
begin
  Self.FConn := GetConn();
  Self.FQry := TZQuery.Create(nil);
  FQry.Connection := FConn;
end;

constructor TDmGlobal.Create(Conn: TZConnection);
begin
  if Conn = nil then
    Self.FConn := GetConn
  else
    Self.FConn := Conn;

  Self.FQry := TZQuery.Create(nil);
  FQry.Connection := FConn;
end;

destructor TDmGlobal.Destroy;
begin
  inherited Destroy;
  if FConn <> nil then
  begin
    FConn.Disconnect;
    FConn.Free;
  end;

  if FQry <> nil then
    FQry.Free;
end;

end.
