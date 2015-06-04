object JusolinkForm: TJusolinkForm
  Left = 610
  Top = 224
  BorderStyle = bsDialog
  Caption = '주소링크 API SDK 예제'
  ClientHeight = 323
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = onActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 24
    Top = 30
    Width = 521
    Height = 107
    Caption = '주소검색 API'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Label1: TLabel
      Left = 10
      Top = 35
      Width = 57
      Height = 13
      AutoSize = False
      Caption = '우편번호 : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 66
      Width = 57
      Height = 19
      AutoSize = False
      Caption = '상세주소 : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 223
      Top = 35
      Width = 72
      Height = 13
      AutoSize = False
      Caption = '새우편번호 : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 25
    Top = 165
    Width = 300
    Height = 60
    Caption = '과금 API'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object btnGetUnitCost: TButton
    Left = 47
    Top = 184
    Width = 122
    Height = 25
    Caption = '검색단가 조회'
    TabOrder = 0
    OnClick = btnGetUnitCostClick
  end
  object btnGetBalance: TButton
    Left = 183
    Top = 183
    Width = 122
    Height = 25
    Caption = '잔여포인트 조회'
    TabOrder = 1
    OnClick = btnGetBalanceClick
  end
  object btnSearchForm: TButton
    Left = 456
    Top = 57
    Width = 70
    Height = 59
    Caption = '주소검색'
    TabOrder = 2
    OnClick = btnSearchFormClick
  end
  object txtZipcode: TEdit
    Left = 93
    Top = 60
    Width = 121
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 5
  end
  object txtAddress: TEdit
    Left = 93
    Top = 94
    Width = 351
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 6
  end
  object txtSectionNum: TEdit
    Left = 322
    Top = 60
    Width = 121
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 7
  end
end
