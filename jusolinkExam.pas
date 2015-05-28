unit jusolinkExam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Jusolink;

const
        // 링크아이디.
        LinkID = 'TESTER_JUSO';
        // 파트너 통신용 비밀키. 유출 주의.
        SecretKey = 'FjaRgAfVUPvSDHTrdd/uw/dt/Cdo3GgSFKyE1+NQ+bc=';
type
  TJusolinkForm = class(TForm)
    btnGetUnitCost: TButton;
    btnGetBalance: TButton;
    btnSearchForm: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    txtZipcode: TEdit;
    txtAddress: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtSectionNum: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnSearchFormClick(Sender: TObject);
    procedure onActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JusolinkForm: TJusolinkForm;
  jusolinkService: TJusolinkService;

implementation
        uses searchExam, searchDetailAddr;
{$R *.DFM}

procedure TJusolinkForm.FormCreate(Sender: TObject);
begin
        // 주소 API 모듈 초기화
        jusolinkService := TJusolinkService.Create(LinkID,SecretKey);


        resultZipcode := '';
        resultAddr := '';
        resultSectionNum := '';
end;

// 검색단가 조회
procedure TJusolinkForm.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        try
                unitcost := jusolinkService.GetUnitCost();
        except
                on le : EJusolinkException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('검색단가 : '+ FloatToStr(unitcost));
end;

// 잔여포인트 조회
procedure TJusolinkForm.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        try
                balance := jusolinkService.GetBalance();
        except
                on le : EJusolinkException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : '+ FloatToStr(balance));
end;

// 주소검색 폼 생성
procedure TJusolinkForm.btnSearchFormClick(Sender: TObject);
var
        searchForm : Tsearch;
begin
        Application.CreateForm(Tsearch, SearchForm);
        SearchForm.Show;
end;

procedure TJusolinkForm.onActivate(Sender: TObject);
begin
        txtZipcode.text := resultZipcode; // 구우편번호
        txtAddress.text := resultAddr;    // 주소
        txtSectionNum.text := resultSectionNum;   //새우편번호
        txtAddress.SetFocus;
end;


end.
