program Project_FullTextSearch;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uStockFilter in 'uStockFilter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
