object search: Tsearch
  Left = 300
  Top = 174
  BorderStyle = bsDialog
  Caption = '주소검색 Example'
  ClientHeight = 709
  ClientWidth = 1010
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object txtCurrentPage: TLabel
    Left = 461
    Top = 654
    Width = 21
    Height = 20
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 495
    Top = 654
    Width = 6
    Height = 20
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txtTotalPage: TLabel
    Left = 517
    Top = 654
    Width = 21
    Height = 20
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txtSuggest: TLabel
    Left = 373
    Top = 48
    Width = 428
    Height = 25
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
    OnClick = txtSuggestClick
  end
  object Label1: TLabel
    Left = 376
    Top = 26
    Width = 345
    Height = 20
    AutoSize = False
    Caption = '> 검색어를 검색하고 원하는 주소정보 셀을 선택합니다.'
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 353
    Height = 65
    Caption = '주소검색'
    TabOrder = 1
    object btnSearch: TButton
      Left = 271
      Top = 21
      Width = 65
      Height = 28
      Caption = '검색'
      TabOrder = 0
      OnClick = btnSearchClick
    end
  end
  object txtIndex: TEdit
    Left = 32
    Top = 41
    Width = 237
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 0
    Text = '영동대로 517'
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 96
    Width = 969
    Height = 529
    ColCount = 6
    FixedCols = 0
    TabOrder = 4
    OnSelectCell = selectCell
  end
  object btnPrevPage: TButton
    Left = 349
    Top = 650
    Width = 81
    Height = 25
    Caption = '이전 페이지'
    TabOrder = 2
    OnClick = btnPrevPageClick
  end
  object btnNextPage: TButton
    Left = 561
    Top = 650
    Width = 81
    Height = 25
    Caption = '다음 페이지'
    TabOrder = 3
    OnClick = btnNextPageClick
  end
end
