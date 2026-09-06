object Form1: TForm1
  Left = 329
  Top = 82
  Width = 1299
  Height = 716
  Caption = 'Full Text Search Filtreleme'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object lblSayfaBilgisi: TLabel
    Left = 34
    Top = 702
    Width = 87
    Height = 17
    Caption = 'lblSayfaBilgisi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 930
    Top = 704
    Width = 41
    Height = 21
    Caption = 'Sayfa:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 1100
    Top = 704
    Width = 80
    Height = 21
    Caption = 'Sayfa Limit:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 34
    Top = 9
    Width = 120
    Height = 17
    Caption = 'Connection String:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 34
    Top = 732
    Width = 131
    Height = 15
    Caption = #199'al'#305#351'an Sorgu C'#252'mlesi:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label10: TLabel
    Left = 319
    Top = 52
    Width = 142
    Height = 14
    Caption = 'FULL TEXT SEARCH ARAMA:'
  end
  object Label3: TLabel
    Left = 612
    Top = 43
    Width = 88
    Height = 14
    Caption = 'Kalan Sto'#287'a G'#246're:'
  end
  object Label4: TLabel
    Left = 741
    Top = 43
    Width = 83
    Height = 14
    Caption = #220'r'#252'n Ad'#305'na G'#246're:'
  end
  object Label5: TLabel
    Left = 879
    Top = 43
    Width = 82
    Height = 14
    Caption = 'Barkoduna G'#246're:'
  end
  object Label6: TLabel
    Left = 612
    Top = 103
    Width = 72
    Height = 14
    Caption = 'Grubuna G'#246're:'
  end
  object Label7: TLabel
    Left = 741
    Top = 103
    Width = 89
    Height = 14
    Caption = 'Marka Ad'#305'na G'#246're:'
  end
  object rdbAktifUrunler: TRadioButton
    Left = 52
    Top = 52
    Width = 164
    Height = 18
    Caption = 'Durumu Aktif Olan '#220'r'#252'nler'
    TabOrder = 0
    OnClick = rdbAktifUrunlerClick
  end
  object rdbPasifUrunler: TRadioButton
    Left = 52
    Top = 85
    Width = 156
    Height = 18
    Caption = 'Durumu Pasif Olan '#220'r'#252'nler'
    TabOrder = 1
    OnClick = rdbPasifUrunlerClick
  end
  object rdbTumDurumlar: TRadioButton
    Left = 52
    Top = 118
    Width = 104
    Height = 19
    Caption = 'T'#252'm Durumlar'
    TabOrder = 2
    OnClick = rdbTumDurumlarClick
  end
  object chcTumunuSec: TCheckBox
    Left = 1178
    Top = 118
    Width = 143
    Height = 38
    Caption = 'T'#252'm'#252'n'#252' Se'#231
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = chcTumunuSecClick
  end
  object chcDuzenle: TCheckBox
    Left = 1053
    Top = 121
    Width = 120
    Height = 35
    Caption = 'D'#252'zenle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 34
    Top = 164
    Width = 1285
    Height = 535
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object btnSayfaAzalt: TButton
    Left = 979
    Top = 699
    Width = 30
    Height = 26
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnSayfaAzaltClick
  end
  object btnSayfaArttir: TButton
    Left = 1059
    Top = 699
    Width = 30
    Height = 26
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnSayfaArttirClick
  end
  object cmbSayfaLimit: TComboBox
    Left = 1190
    Top = 703
    Width = 131
    Height = 22
    Style = csDropDownList
    ItemHeight = 14
    TabOrder = 8
    OnChange = cmbSayfaLimitChange
    Items.Strings = (
      '25'
      '50'
      '100'
      '150'
      '200'
      '250'
      'Max')
  end
  object Memo5: TMemo
    Left = 181
    Top = 732
    Width = 1138
    Height = 79
    Lines.Strings = (
      'Memo5')
    TabOrder = 9
    Visible = False
  end
  object editSayfaNumarasi: TEdit
    Left = 1017
    Top = 698
    Width = 35
    Height = 22
    TabOrder = 10
    Text = '1'
    OnChange = editSayfaNumarasiChange
  end
  object editFTS2: TEdit
    Left = 319
    Top = 69
    Width = 216
    Height = 22
    TabOrder = 11
    OnChange = editFTS2Change
  end
  object editConnection: TEdit
    Left = 155
    Top = 9
    Width = 897
    Height = 22
    TabOrder = 12
    Text = 
      'Provider=SQLOLEDB;Data Source=DESKTOP-GA2OVEL\SQLEXPRESS;Initial' +
      ' Catalog=siparisTest;Integrated Security=SSPI;'
  end
  object editKalanStok: TEdit
    Left = 612
    Top = 60
    Width = 104
    Height = 22
    TabOrder = 13
    OnChange = editKalanStokChange
  end
  object editStokGrup: TEdit
    Left = 612
    Top = 121
    Width = 104
    Height = 22
    TabOrder = 14
    OnChange = editStokGrupChange
  end
  object EditUrunAd: TEdit
    Left = 741
    Top = 60
    Width = 104
    Height = 22
    TabOrder = 15
    OnChange = EditUrunAdChange
  end
  object EditBarkod: TEdit
    Left = 879
    Top = 60
    Width = 104
    Height = 22
    TabOrder = 16
    OnChange = EditBarkodChange
  end
  object EditMarkaAd: TEdit
    Left = 741
    Top = 121
    Width = 104
    Height = 22
    TabOrder = 17
    OnChange = EditMarkaAdChange
  end
  object Button1: TButton
    Left = 1241
    Top = 0
    Width = 113
    Height = 27
    Caption = 'Test Butonu'
    Enabled = False
    TabOrder = 18
    Visible = False
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 1152
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 1192
    Top = 32
  end
  object ADOConnection1: TADOConnection
    Left = 1192
    Top = 64
  end
  object ADOQuery2: TADOQuery
    Parameters = <>
    Left = 1152
    Top = 31
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 400
    OnTimer = Timer1Timer
    Left = 1232
    Top = 32
  end
  object XPManifest1: TXPManifest
    Left = 1232
    Top = 64
  end
end
