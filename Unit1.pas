unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, Grids, DBGrids, XPMan, ExtCtrls, DB, ADODB, uStockFilter;

type
  TForm1 = class(TForm)
    rdbAktifUrunler: TRadioButton;
    rdbPasifUrunler: TRadioButton;
    rdbTumDurumlar: TRadioButton;
    chcTumunuSec: TCheckBox;
    chcDuzenle: TCheckBox;
    DBGrid1: TDBGrid;
    lblSayfaBilgisi: TLabel;
    Label1: TLabel;
    btnSayfaAzalt: TButton;
    Label2: TLabel;
    btnSayfaArttir: TButton;
    cmbSayfaLimit: TComboBox;
    Memo5: TMemo;
    editSayfaNumarasi: TEdit;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery2: TADOQuery;
    Timer1: TTimer;
    editFTS2: TEdit;
    editConnection: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    editKalanStok: TEdit;
    editStokGrup: TEdit;
    EditUrunAd: TEdit;
    EditBarkod: TEdit;
    EditMarkaAd: TEdit;
    XPManifest1: TXPManifest;
    procedure editKalanStokChange(Sender: TObject);
    procedure editStokGrupChange(Sender: TObject);
    procedure EditUrunAdChange(Sender: TObject);
    procedure EditMarkaAdChange(Sender: TObject);
    procedure EditBarkodChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbSayfaLimitChange(Sender: TObject);
    procedure btnSayfaArttirClick(Sender: TObject);
    procedure btnSayfaAzaltClick(Sender: TObject);
    procedure editSayfaNumarasiChange(Sender: TObject);
    procedure rdbAktifUrunlerClick(Sender: TObject);
    procedure rdbPasifUrunlerClick(Sender: TObject);
    procedure rdbTumDurumlarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure chcTumunuSecClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure editFTSChange(Sender: TObject);
    procedure editFTS2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ConnectionString: string;
  end;

var
  Form1: TForm1;
  StockManager: TStockManager;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ConnectionString:= Trim(editConnection.Text);
  ADOQuery1.ConnectionString:= ConnectionString;
  ADOQuery2.ConnectionString:= ConnectionString;

  StockManager := TStockManager.Create(
    ADOQuery1, ADOQuery2, DBGrid1,
    editFTS2, editStokGrup, EditUrunAd, EditBarkod, EditMarkaAd, EditKalanStok,
    rdbAktifUrunler, rdbPasifUrunler, chcTumunuSec, lblSayfaBilgisi, editSayfaNumarasi, DataSource1
  );

  StockManager.PageSize := 100; // varsayılan pageSize
  StockManager.PageNumber := 1;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  cmbSayfaLimit.ItemIndex := 0; // Varsayılan olarak ilk öğeyi seç

  if cmbSayfaLimit.Text = 'Max' then
    StockManager.PageSize := 1000000
  else
    StockManager.PageSize := StrToIntDef(cmbSayfaLimit.Text, 100);
    
  StockManager.PageNumber := 1; // Başlangıç sayfası

  StockManager.CalculateTotalRecords;  // Toplam kayıt sayısını hesapla
  StockManager.LoadPage(StockManager.PageNumber);  // İlk sayfayı yükle
end;

procedure TForm1.cmbSayfaLimitChange(Sender: TObject);
var
  NewPageSize: Integer;
begin
  // Yeni sayfa boyutunu hesapla
  if cmbSayfaLimit.Text = 'Max' then
    NewPageSize := 1000000
  else
    NewPageSize := StrToIntDef(cmbSayfaLimit.Text, 100);

  // StockManager'ı güncelle
  StockManager.PageSize := NewPageSize;
  StockManager.PageNumber := 1;
  
  // Toplam kayıt sayısını yeniden hesapla ve ilk sayfayı yükle
  StockManager.CalculateTotalRecords;
  StockManager.LoadPage(1);
end;

procedure TForm1.btnSayfaArttirClick(Sender: TObject);
begin
  StockManager.NextPage;
end;

procedure TForm1.btnSayfaAzaltClick(Sender: TObject);
begin
  StockManager.PrevPage;
end;

procedure TForm1.chcTumunuSecClick(Sender: TObject);
begin
  if (DBGrid1.DataSource = nil) or
     (DBGrid1.DataSource.DataSet = nil) or
     (DBGrid1.DataSource.DataSet.IsEmpty) then
  begin
    chcTumunuSec.Checked := False;
    Exit;
  end;

  if chcTumunuSec.Checked then
  begin
    DBGrid1.DataSource.DataSet.First;
    while not DBGrid1.DataSource.DataSet.Eof do
    begin
      DBGrid1.SelectedRows.CurrentRowSelected := True;
      DBGrid1.DataSource.DataSet.Next;
    end;
  end
  else
  begin
    DBGrid1.SelectedRows.Clear;
  end;
end;

procedure TForm1.editSayfaNumarasiChange(Sender: TObject);
var
  NewPageNumber: Integer;
begin
  // Yeni sayfa numarasını al
  NewPageNumber := StrToIntDef(editSayfaNumarasi.Text, 1);
  
  // Geçerli aralıkta mı kontrol et
  if (NewPageNumber >= 1) and (NewPageNumber <= StockManager.MaxPage) then
  begin
    StockManager.LoadPage(NewPageNumber);
  end;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  if chcDuzenle.Checked then
  begin
    DBGrid1.Options := TDBGridOptions(DBGrid1.Options + [dgEditing]);
  end
  else
  begin
    DBGrid1.Options := TDBGridOptions(DBGrid1.Options - [dgEditing]);
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  StockManager.PageNumber := 1;
  StockManager.CalculateTotalRecords;
  StockManager.LoadPage(1);
end;

// Tüm filter değişiklik olayları Timer'ı tetikler
procedure TForm1.editKalanStokChange(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer1.Enabled := True;
end;

procedure TForm1.EditMarkaAdChange(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer1.Enabled := True;
end;

procedure TForm1.editStokGrupChange(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer1.Enabled := True;
end;

procedure TForm1.EditUrunAdChange(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer1.Enabled := True;
end;

procedure TForm1.EditBarkodChange(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer1.Enabled := True;
end;

procedure TForm1.editFTSChange(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer1.Enabled := True;
end;

procedure TForm1.editFTS2Change(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer1.Enabled := True;
end;

// RadioButton değişiklikleri
procedure TForm1.rdbAktifUrunlerClick(Sender: TObject);
begin
  StockManager.PageNumber := 1;
  StockManager.CalculateTotalRecords;
  StockManager.LoadPage(1);
end;

procedure TForm1.rdbPasifUrunlerClick(Sender: TObject);
begin
  StockManager.PageNumber := 1;
  StockManager.CalculateTotalRecords;
  StockManager.LoadPage(1);
end;

procedure TForm1.rdbTumDurumlarClick(Sender: TObject);
begin
  StockManager.PageNumber := 1;
  StockManager.CalculateTotalRecords;
  StockManager.LoadPage(1);
end;

end.
