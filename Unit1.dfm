object Form1: TForm1
  Left = 111
  Top = 46
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
  TextHeight = 13
  object lblSayfaBilgisi: TLabel
    Left = 32
    Top = 652
    Width = 75
    Height = 15
    Caption = 'lblSayfaBilgisi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 864
    Top = 654
    Width = 39
    Height = 20
    Caption = 'Sayfa:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 1021
    Top = 654
    Width = 76
    Height = 20
    Caption = 'Sayfa Limit:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 48
    Top = 8
    Width = 87
    Height = 13
    Caption = 'Connection String:'
  end
  object Label9: TLabel
    Left = 32
    Top = 680
    Width = 130
    Height = 13
    Caption = #199'al'#305#351'an Sorgu C'#252'mlesi:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label10: TLabel
    Left = 296
    Top = 48
    Width = 148
    Height = 13
    Caption = 'FULL TEXT SEARCH ARAMA:'
  end
  object Label3: TLabel
    Left = 568
    Top = 40
    Width = 87
    Height = 13
    Caption = 'Kalan Sto'#287'a G'#246're:'
  end
  object Label4: TLabel
    Left = 688
    Top = 40
    Width = 82
    Height = 13
    Caption = #220'r'#252'n Ad'#305'na G'#246're:'
  end
  object Label5: TLabel
    Left = 816
    Top = 40
    Width = 81
    Height = 13
    Caption = 'Barkoduna G'#246're:'
  end
  object Label6: TLabel
    Left = 568
    Top = 96
    Width = 70
    Height = 13
    Caption = 'Grubuna G'#246're:'
  end
  object Label7: TLabel
    Left = 688
    Top = 96
    Width = 89
    Height = 13
    Caption = 'Marka Ad'#305'na G'#246're:'
  end
  object rdbAktifUrunler: TRadioButton
    Left = 48
    Top = 48
    Width = 153
    Height = 17
    Caption = 'Durumu Aktif Olan '#220'r'#252'nler'
    TabOrder = 0
    OnClick = rdbAktifUrunlerClick
  end
  object rdbPasifUrunler: TRadioButton
    Left = 48
    Top = 79
    Width = 145
    Height = 17
    Caption = 'Durumu Pasif Olan '#220'r'#252'nler'
    TabOrder = 1
    OnClick = rdbPasifUrunlerClick
  end
  object rdbTumDurumlar: TRadioButton
    Left = 48
    Top = 110
    Width = 97
    Height = 17
    Caption = 'T'#252'm Durumlar'
    TabOrder = 2
    OnClick = rdbTumDurumlarClick
  end
  object chcTumunuSec: TCheckBox
    Left = 1094
    Top = 110
    Width = 133
    Height = 35
    Caption = 'T'#252'm'#252'n'#252' Se'#231
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = chcTumunuSecClick
  end
  object chcDuzenle: TCheckBox
    Left = 978
    Top = 112
    Width = 111
    Height = 33
    Caption = 'D'#252'zenle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 152
    Width = 1193
    Height = 497
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
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
    Left = 909
    Top = 649
    Width = 28
    Height = 24
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnSayfaAzaltClick
  end
  object btnSayfaArttir: TButton
    Left = 983
    Top = 649
    Width = 28
    Height = 24
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnSayfaArttirClick
  end
  object cmbSayfaLimit: TComboBox
    Left = 1105
    Top = 653
    Width = 122
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
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
    Left = 168
    Top = 680
    Width = 1057
    Height = 73
    Lines.Strings = (
      'Memo5')
    TabOrder = 9
    Visible = False
  end
  object editSayfaNumarasi: TEdit
    Left = 944
    Top = 648
    Width = 33
    Height = 21
    TabOrder = 10
    Text = '1'
    OnChange = editSayfaNumarasiChange
  end
  object editFTS2: TEdit
    Left = 296
    Top = 64
    Width = 201
    Height = 21
    TabOrder = 11
    OnChange = editFTS2Change
  end
  object editConnection: TEdit
    Left = 144
    Top = 8
    Width = 833
    Height = 21
    TabOrder = 12
    Text = 
      'Provider=SQLOLEDB;Data Source=DESKTOP-8AH65AO;Initial Catalog=si' +
      'parisTest;Integrated Security=SSPI;'
  end
  object editKalanStok: TEdit
    Left = 568
    Top = 56
    Width = 97
    Height = 21
    TabOrder = 13
    OnChange = editKalanStokChange
  end
  object editStokGrup: TEdit
    Left = 568
    Top = 112
    Width = 97
    Height = 21
    TabOrder = 14
    OnChange = editStokGrupChange
  end
  object EditUrunAd: TEdit
    Left = 688
    Top = 56
    Width = 97
    Height = 21
    TabOrder = 15
    OnChange = EditUrunAdChange
  end
  object EditBarkod: TEdit
    Left = 816
    Top = 56
    Width = 97
    Height = 21
    TabOrder = 16
    OnChange = EditBarkodChange
  end
  object EditMarkaAd: TEdit
    Left = 688
    Top = 112
    Width = 97
    Height = 21
    TabOrder = 17
    OnChange = EditMarkaAdChange
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
