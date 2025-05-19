unit Dao.DB;

{$mode Delphi}

interface

uses
  Classes, SysUtils, ZDataset, ZConnection;

type

  { TDaoDb }

  TDaoDb = class
  private
    procedure InicializarTabelas(Qry: TZQuery);
  public
    class procedure Initialize(Qry: TZQuery); static;
  end;



implementation

{ TDaoDb }

procedure TDaoDb.InicializarTabelas(Qry: TZQuery);
begin
  Qry.SQL.Add('CREATE TABLE IF NOT EXISTS versao(' +
    'iddbversion INTEGER PRIMARY KEY AUTOINCREMENT, ' +
    'versao INTEGER NOT NULL' + ' ); ');
  Qry.ExecSQL;
  Qry.SQL.Clear;

  Qry.SQL.Add('CREATE TABLE IF NOT EXISTS categorias ( ' +
    ' idcategoria INTEGER PRIMARY KEY AUTOINCREMENT, ' +
    ' nomecategoria VARCHAR(100) NOT NULL UNIQUE);');
  Qry.ExecSQL;
  Qry.SQL.Clear;

  Qry.SQL.Add(
    'CREATE TABLE IF NOT EXISTS boletos (' +
    'idboleto INTEGER PRIMARY KEY AUTOINCREMENT, ' +
    'beneficiario VARCHAR(255) NOT NULL, ' + 'vencimento DATE NOT NULL, ' +
    'emissao DATE NOT NULL, ' + 'valor REAL NOT NULL, ' +
    'parcelas INTEGER NOT NULL , ' + 'juros REAL DEFAULT 0, ' +
    'multa REAL DEFAULT 0, ' + 'desconto REAL DEFAULT 0, ' +
    'linha_digitavel VARCHAR(255), ' + 'codigo_barras VARCHAR(255), ' +
    'status VARCHAR(20) DEFAULT ''aberto'', ' + 'data_pagamento DATE, ' +
    'observacoes TEXT, ' + 'categoria_id INTEGER, ' +
    'FOREIGN KEY(categoria_id) REFERENCES categorias(idcategoria) ' + ');');
  Qry.ExecSQL;
  Qry.SQL.Clear;
end;

class procedure TDaoDb.Initialize(Qry: TZQuery);
var
  dao: TDaoDb;
begin
  dao := TDaoDb.Create;

  try
    dao.InicializarTabelas(Qry);
  finally
    dao.Free;
  end;

end;

end.
