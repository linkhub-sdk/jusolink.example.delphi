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

// �ּ���˻�
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

//ǥ��ȭ���θ� ������ư Ŭ��
procedure TsearchDetail.clickRoadRadioBtn(Sender:TObject);
begin
       rbRoad.Checked := true;
end;

//ǥ��ȭ ���� ������ư Ŭ��
procedure TsearchDetail.clickJibunRadioBtn(Sender:TObject);
begin
       rbJibun.Checked := true;
end;

// Ȯ�ι�ư
procedure TsearchDetail.btnOkClick(Sender: TObject);
begin
        resultZipcode := g_zipcode;  // �����ȣ
        resultSectionNum := g_sectionNum;
        
        if rbRoad.Checked then
        begin
                // ǥ��ȭ ���θ��ּ�
                resultAddr := g_roadAddr1 + ', '+ txtDetailRoad.text +' '+g_roadAddr2;
        end
        else
        begin
                // ǥ��ȭ �����ּ�
                resultAddr := g_jibunAddr + ', '+ txtDetailJibun.text;
        end;
        Close;
end;



end.
