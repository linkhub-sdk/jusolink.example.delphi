unit searchDetailAddr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls;

type
  TsearchDetail = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtDetailRoad: TEdit;
    rbRoad: TRadioButton;
    rbJIbun: TRadioButton;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txtDetailJibun: TEdit;
    btnOk: TButton;
    btnReset: TButton;
    Label9: TLabel;
    txtRoadZipcode: TLabel;
    Label10: TLabel;
    txtRoadSectionNum: TLabel;
    txtRoadAddr: TLabel;
    Label11: TLabel;
    txtJibunZipcode: TLabel;
    txtJibunSectionNum: TLabel;
    txtJibunAddr: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure clickRoadRadioBtn(Sender:TObject);
    procedure clickJibunRadioBtn(Sender:TObject);
    procedure onShow(Sender:TObject);
    procedure btnResetClick(Sender: TObject);
    procedure rbRoadSelect(Sender:TObject);
    procedure rbJibunSelect(Sender:TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  searchDetail: TsearchDetail;
  resultZipcode, resultAddr, resultSectionNum : string;

implementation
        uses searchExam, jusolinkExam;
{$R *.DFM}


procedure TsearchDetail.FormCreate(Sender: TObject);
begin
        txtRoadZipcode.Caption := g_zipcode;
        txtRoadSectionNum.Caption := g_sectionNum;
        txtRoadAddr.Caption := g_roadAddr1 + ' '+ g_roadAddr2;

        txtJibunZipcode.Caption := g_zipcode;
        txtJibunSectionNum.Caption := g_sectionNum;
        txtJibunAddr.Caption := g_jibunAddr;
end;

// 주소재검색
procedure TsearchDetail.btnResetClick(Sender: TObject);
var
        searchForm : Tsearch;
begin
        Application.CreateForm(Tsearch, searchForm);
        searchForm.Show;
        Close;

end;


procedure TsearchDetail.onShow(Sender:TObject);
begin
       if g_type = 'Road' then rbRoad.Checked := true
       else rbJibun.Checked := true;
       if g_type = 'Road' then txtDetailRoad.SetFocus
       else txtDetailJibun.SetFocus;
end;

procedure TsearchDetail.rbJibunSelect(Sender:TObject);
begin
        txtDetailJibun.SetFocus;
end;

procedure TsearchDetail.rbRoadSelect(Sender:TObject);
begin
        txtDetailRoad.SetFocus;
end;

//표준화도로명 라디오버튼 클릭
procedure TsearchDetail.clickRoadRadioBtn(Sender:TObject);
begin
       rbRoad.Checked := true;
end;

//표준화 지번 라디오버튼 클릭
procedure TsearchDetail.clickJibunRadioBtn(Sender:TObject);
begin
       rbJibun.Checked := true;
end;

// 확인버튼
procedure TsearchDetail.btnOkClick(Sender: TObject);
begin
        resultZipcode := g_zipcode;  // 우편번호
        resultSectionNum := g_sectionNum;
        
        if rbRoad.Checked then
        begin
                // 표준화 도로명주소
                resultAddr := g_roadAddr1 + ', '+ txtDetailRoad.text +' '+g_roadAddr2;
        end
        else
        begin
                // 표준화 지번주소
                resultAddr := g_jibunAddr + ', '+ txtDetailJibun.text;
        end;
        Close;
end;



end.
