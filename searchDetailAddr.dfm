object searchDetail: TsearchDetail
  Left = 438
  Top = 228
  BorderStyle = bsDialog
  Caption = '상세주소 입력'
  ClientHeight = 357
  ClientWidth = 1003
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = onShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 28
    Top = 38
    Width = 401
    Height = 13
    AutoSize = False
    Caption = '> 아래의 주소를 확인하시고 선택하신 후 확인버튼을 누르세요.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 28
    Top = 62
    Width = 400
    Height = 13
    AutoSize = False
    Caption = 
      '> 정확한 우편물 발송을 위해 표준화 도로명 주소 사용을 권장합니다' +
      '.'
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 121
    Width = 473
    Height = 98
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 16
      Width = 79
      Height = 13
      AutoSize = False
      Caption = '구우편번호 : '
    end
    object Label4: TLabel
      Left = 16
      Top = 41
      Width = 68
      Height = 13
      AutoSize = False
      Caption = '기본주소 : '
    end
    object Label5: TLabel
      Left = 16
      Top = 64
      Width = 60
      Height = 13
      AutoSize = False
      Caption = '상세주소 :'
    end
    object Label9: TLabel
      Left = 80
      Top = 16
      Width = 3
      Height = 13
    end
    object txtRoadZipcode: TLabel
      Left = 91
      Top = 16
      Width = 68
      Height = 13
      AutoSize = False
    end
    object Label10: TLabel
      Left = 167
      Top = 16
      Width = 81
      Height = 13
      AutoSize = False
      Caption = '새우편번호 :'
    end
    object txtRoadSectionNum: TLabel
      Left = 250
      Top = 16
      Width = 106
      Height = 13
      AutoSize = False
    end
    object txtRoadAddr: TLabel
      Left = 80
      Top = 40
      Width = 321
      Height = 13
      AutoSize = False
    end
    object txtDetailRoad: TEdit
      Left = 79
      Top = 61
      Width = 380
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 0
      OnClick = clickRoadRadioBtn
    end
  end
  object rbRoad: TRadioButton
    Left = 24
    Top = 98
    Width = 136
    Height = 17
    Caption = '표준화 도로명주소'
    TabOrder = 1
    OnClick = rbRoadSelect
  end
  object rbJIbun: TRadioButton
    Left = 512
    Top = 102
    Width = 113
    Height = 17
    Caption = '표준화 지번주소'
    TabOrder = 3
    OnClick = rbJibunSelect
  end
  object GroupBox2: TGroupBox
    Left = 512
    Top = 121
    Width = 475
    Height = 97
    TabOrder = 2
    object Label6: TLabel
      Left = 15
      Top = 18
      Width = 77
      Height = 13
      AutoSize = False
      Caption = '구우편번호 :'
    end
    object Label7: TLabel
      Left = 16
      Top = 42
      Width = 57
      Height = 13
      AutoSize = False
      Caption = '기본주소 : '
    end
    object Label8: TLabel
      Left = 15
      Top = 65
      Width = 57
      Height = 13
      AutoSize = False
      Caption = '상세주소 : '
    end
    object Label11: TLabel
      Left = 167
      Top = 18
      Width = 77
      Height = 13
      AutoSize = False
      Caption = '새우편번호 :'
    end
    object txtJibunZipcode: TLabel
      Left = 91
      Top = 18
      Width = 72
      Height = 13
      AutoSize = False
    end
    object txtJibunSectionNum: TLabel
      Left = 242
      Top = 18
      Width = 72
      Height = 13
      AutoSize = False
    end
    object txtJibunAddr: TLabel
      Left = 80
      Top = 44
      Width = 317
      Height = 13
      AutoSize = False
    end
    object txtDetailJibun: TEdit
      Left = 80
      Top = 62
      Width = 380
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 0
      OnClick = clickJibunRadioBtn
    end
  end
  object btnOk: TButton
    Left = 417
    Top = 244
    Width = 76
    Height = 25
    Caption = '확인'
    TabOrder = 4
    OnClick = btnOkClick
  end
  object btnReset: TButton
    Left = 507
    Top = 244
    Width = 75
    Height = 25
    Caption = '다시검색'
    TabOrder = 5
    OnClick = btnResetClick
  end
end
