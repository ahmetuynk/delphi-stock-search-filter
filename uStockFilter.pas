unit uStockFilter;

interface

uses
  SysUtils, Classes, DB, DBTables, Grids, DBGrids, StdCtrls, ADODB;

type
  TStockManager = class
  private
    FADOQuery1: TADOQuery;
    FADOQuery2: TADOQuery;
    FDBGrid: TDBGrid;
    FEditFTS2: TEdit;
    FEditStokGrup: TEdit;
    FEditUrunAd: TEdit;
    FEditBarkod: TEdit;
    FEditMarkaAd: TEdit;
    FEditKalanStok: TEdit;
    FRdbAktifUrunler: TRadioButton;
    FRdbPasifUrunler: TRadioButton;
    FChcTumunuSec: TCheckBox;
    FPageSize: Integer;
    FPageNumber: Integer;
    FMaxPage: Integer;
    FTotalRecords: Integer;
    FLblSayfa: TLabel;
    FEditSayfaNumarasi: TEdit;
    FDataSource: TDataSource;
    // FieldsForFts dizisini buraya ekle
    FFieldsForFts: array of string;
    procedure AutoSizeDBGridColumns(DBGrid: TDBGrid);
  public
  constructor Create(AQuery1, AQuery2: TADOQuery; DBGrid: TDBGrid; 
                   EditFTS2, EditStokGrup, EditUrunAd, EditBarkod, EditMarkaAd, EditKalanStok: TEdit; 
                   RdbAktif, RdbPasif: TRadioButton; ChcTumunuSec: TCheckBox;
                   lblSayfa: TLabel; editSayfa: TEdit; DataSource: TDataSource);
    function BuildFilterText: string;
    procedure AdjustFilterOnTextChange(var SQLText: string; Offset: Integer);
    procedure LoadPage(Page: Integer);
    procedure CalculateTotalRecords;
    procedure NextPage;
    procedure PrevPage;
    
    property PageSize: Integer read FPageSize write FPageSize;
    property PageNumber: Integer read FPageNumber write FPageNumber;
    property MaxPage: Integer read FMaxPage write FMaxPage;
    property TotalRecords: Integer read FTotalRecords write FTotalRecords;
  end;

    
implementation

uses
  Math, Unit1;

{ TStockManager }

constructor TStockManager.Create(AQuery1, AQuery2: TADOQuery; DBGrid: TDBGrid; 
                   EditFTS2, EditStokGrup, EditUrunAd, EditBarkod, EditMarkaAd, EditKalanStok: TEdit;
                   RdbAktif, RdbPasif: TRadioButton; ChcTumunuSec: TCheckBox;
                   lblSayfa: TLabel; editSayfa: TEdit; DataSource: TDataSource);
begin
  // Bağlantılı bileşenleri atama
  FADOQuery1 := AQuery1;
  FADOQuery2 := AQuery2;
  FDBGrid := DBGrid;
  FEditFTS2 := EditFTS2;
  FEditStokGrup := EditStokGrup;
  FEditUrunAd := EditUrunAd;
  FEditBarkod := EditBarkod;
  FEditMarkaAd := EditMarkaAd;
  FEditKalanStok := EditKalanStok;
  FRdbAktifUrunler := RdbAktif;
  FRdbPasifUrunler := RdbPasif;
  FChcTumunuSec := ChcTumunuSec;
  FLblSayfa := lblSayfa;
  FEditSayfaNumarasi := editSayfa;
  FDataSource := DataSource;

  // Full Text Search için kullanılacak alanlar
  SetLength(FFieldsForFts, 7);
  FFieldsForFts[0] := 'STOKADI';
  FFieldsForFts[1] := 'STOKMODEL';
  FFieldsForFts[2] := 'STOKOZELLIK';
  FFieldsForFts[3] := 'STOKMARKA';
  FFieldsForFts[4] := 'STOKGRUP';
  FFieldsForFts[5] := 'BARKODNO';
  FFieldsForFts[6] := 'TISLETBIRIM';
end;

//KULLANICIDAN ALINAN FİLTRE KRİTERLERİNİ İŞLEYİP SQL WHERE CÜMLESİ OLUŞTURUR
function TStockManager.BuildFilterText: string;
var
  FilterText, SQLFilter, Term, FieldFilter: string;
  Terms: TStringList;
  I, J: Integer;
begin

 //Filtreleme metnini başlat
 FilterText:='';

  // Full Text Search kontrolü (editFTS2 boş değilse)
  if Trim(FEditFTS2.Text) <> '' then
begin
  Terms := TStringList.Create;
  try
    // Kullanıcının girdiği metni boşluklara göre ayır
    Terms.Delimiter := ' ';
    Terms.DelimitedText := Trim(FEditFTS2.Text);

    SQLFilter := '';
    for I := 0 to Terms.Count - 1 do
    begin
      Term := Trim(Terms[I]);
      if Term <> '' then
      begin
        FieldFilter := '';

        // Her alan için CONTAINS ile arama yap
        for J := 0 to High(FFieldsForFts) do
        begin
          if FieldFilter <> '' then
            FieldFilter := FieldFilter + ' OR '; // "OR" kullanarak her alanda arama yap
          FieldFilter := FieldFilter + Format('CONTAINS(%s, ''"%s*" '')', [FFieldsForFts[J], Term]);
        end;

        // Birden fazla kelime varsa bunları AND ile bağla
        if FieldFilter <> '' then
        begin
          if SQLFilter <> '' then
            SQLFilter := SQLFilter + ' AND ';
          SQLFilter := SQLFilter + '(' + FieldFilter + ')';
        end;
      end;
    end;

    // Sonuç filtreyi ekle
    if SQLFilter <> '' then
      FilterText := FilterText + ' AND (' + SQLFilter + ')';
  finally
    Terms.Free;
  end;
end;

  // Diğer alan bazlı filtreler
  if Trim(FEditStokGrup.Text) <> '' then
    FilterText := FilterText + ' AND STOKGRUP LIKE ''%' + Trim(FEditStokGrup.Text) + '%''';

  if Trim(FEditUrunAd.Text) <> '' then
    FilterText := FilterText + ' AND STOKADI LIKE ''%' + Trim(FEditUrunAd.Text) + '%''';

  if Trim(FEditBarkod.Text) <> '' then
    FilterText := FilterText + ' AND BARKODNO LIKE ''%' + Trim(FEditBarkod.Text) + '%''';

  if Trim(FEditKalanStok.Text) <> '' then
    FilterText := FilterText + ' AND KALANMIK <= ' + Trim(FEditKalanStok.Text);

  if Trim(FEditMarkaAd.Text) <> '' then
    FilterText := FilterText + ' AND STOKMARKA LIKE ''%' + Trim(FEditMarkaAd.Text) + '%''';

  // Aktif/Pasif ürün seçimi
  if FRdbAktifUrunler.Checked then
    FilterText := FilterText + ' AND AKTIFPASIF = ''A''';

  if FRdbPasifUrunler.Checked then
    FilterText := FilterText + ' AND AKTIFPASIF = ''P''';

  // Eğer filtre varsa başına WHERE ekle
  if FilterText <> '' then
    FilterText := ' WHERE ' + Copy(FilterText, 5, Length(FilterText) - 4);

  Result:=FilterText;
end;

//VERİLEN SAYFA NUMARASINA GÖRE İLGİLİ KAYITLARI VERİTABANINDAN ÇEKER VE GRID'E YÜKLER
procedure TStockManager.LoadPage(Page: Integer);
var
  Offset: Integer;
  SQLText: string;
begin
  FPageNumber := Page;
  FChcTumunuSec.Checked:=False;

  if (Page < 1) or (Page > FMaxPage) then  //sorgunun sonucu boş döndüyse
  begin
   FLblSayfa.Caption := Format('Toplam Sayfa: %d, Mevcut Sayfa: %d, Toplam Kayıt: %d', [FMaxPage, Page, TotalRecords]);
    FADOQuery1.Close;
    FDBGrid.DataSource := nil;
    Exit;
  end;

  // Sayfalama için Offset hesaplama
  Offset := (Page - 1) * PageSize;

  SQLText := 'SELECT STOKID, STOKKODU, STOKADI, AKTIFPASIF, BIRIMI, KDVORAN, ' +
             'KALANMIK AS "STOK", OZELFIYAT AS "LİSTE FİYATI", PERSATFIYAT AS "SATIŞ FİYATI", ' +
             'TISLETBIRIM AS "ANA ÜRÜN KODU", BARKODNO, KURTIPI, ACIKLAMA, TKAPASITE1 AS "KARGO DESİ MİKTARI", ' +
             'STOKMARKA, STOKGRUP, STOKMODEL AS "BOYUT/BEDEN", STOKOZELLIK AS "RENK" ' +
             'FROM STOKKART';

  //Filtreyi Uygula
  AdjustFilterOnTextChange(SQLText, Offset);

  // Sayfa numarasını güncelle
  FLblSayfa.Caption := Format('Toplam Sayfa: %d, Mevcut Sayfa: %d, Toplam Kayıt: %d', [FMaxPage, Page, TotalRecords]);
  FEditSayfaNumarasi.Text:=IntToStr(Page);
end;

//KULLANIICNIN ARAMA KUTUSUNA YAZDIĞI METNE GÖRE SQL SORGUSUNU DİNAMİK OLARAK GÜNCELLER
procedure TStockManager.AdjustFilterOnTextChange(var SQLText: string; Offset: Integer);
var
  FilterText: string;
begin

  FilterText:= BuildFilterText; 

  // Filtrelenmiş SQL sorgusunu oluştur
  SQLText := SQLText + FilterText + ' ORDER BY STOKID ' +
             Format('OFFSET %d ROWS FETCH NEXT %d ROWS ONLY', [Offset, PageSize]);

  // Sorguyu çalıştır
  FADOQuery1.Close;
  FADOQuery1.SQL.Text := SQLText;
  FADOQuery1.Open;

  // Grid'i güncelle
  FDBGrid.DataSource := FDataSource;
  AutoSizeDBGridColumns(FDBGrid);
end;

//SORGULAMA SONUCU TOPLAM KAYIT SAYISINI HESAPLAR
procedure TStockManager.CalculateTotalRecords;
 var
 FilterText: string;
 RecordCountQuery: string;
begin
  FilterText:= BuildFilterText;

  RecordCountQuery := 'SELECT COUNT(*) AS ''Total'' FROM STOKKART' + FilterText;

  FADOQuery2.Close;
  FADOQuery2.SQL.Text := RecordCountQuery;
  FADOQuery2.Open;

  // Toplam kayıt ve maksimum sayfa sayısını hesapla
  TotalRecords := FADOQuery2.FieldByName('Total').AsInteger;
  FMaxPage := Ceil(TotalRecords / PageSize);
end;

//DBGRID UZERINDE SONRAKİ SAYFAYI YÜKLEMEK İÇİN
procedure TStockManager.NextPage;
begin
  if PageNumber < MaxPage then
    LoadPage(PageNumber + 1);
end;

//DBGRID UZERINDE ÖNCEKİ SAYFAYA DÖNMEK İÇİN
procedure TStockManager.PrevPage;
begin
  if PageNumber > 1 then
    LoadPage(PageNumber - 1);
end;

procedure TStockManager.AutoSizeDBGridColumns(DBGrid: TDBGrid); 
var
  I: Integer;
begin
  DBGrid.Columns.BeginUpdate;
  try
    for I := 0 to DBGrid.Columns.Count - 1 do
    begin
      DBGrid.Columns[I].Width := DBGrid.Canvas.TextWidth(DBGrid.Columns[I].Field.DisplayName) + 20;
    end;
  finally
    DBGrid.Columns.EndUpdate;
  end;
end;

end.
