unit searchExam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, TypInfo, Jusolink, ExtCtrls, Grids;

type
  Tsearch = class(TForm)
    txtIndex: TEdit;
    GroupBox1: TGroupBox;
    btnSearch: TButton;
    StringGrid1: TStringGrid;
    txtCurrentPage: TLabel;
    Label9: TLabel;
    txtTotalPage: TLabel;
    btnPrevPage: TButton;
    btnNextPage: TButton;
    txtSuggest: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnNextPageClick(Sender: TObject);
    procedure btnPrevPageClick(Sender: TObject);
    procedure selectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
    procedure txtSuggestClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  searchGrid : Tsearch;
  jusolinkService: TJusolinkService;
  g_zipcode : string;       // 구우편번호
  g_sectionNum : string;    // 새우편번호
  g_roadAddr1 : string;     // 도로명주소
  g_roadAddr2 : string;     // 도로명주소 부가정보 (법정동, 공동주택명)
  g_jibunAddr : string;     // 지번주소
  g_type : string;          // 주소타입
  suggestIndex : string;    // 수정제시어
  
implementation
        uses jusolinkExam, searchDetailAddr;

{$R *.DFM}

procedure Tsearch.FormCreate(Sender: TObject);
begin
        // 주소 API 모듈 초기화
        jusolinkService := TJusolinkService.Create(jusolinkExam.LinkID, jusolinkExam.SecretKey);
        StringGrid1.Cells[0,0] := '우편번호';
        StringGrid1.Cells[1,0] := '새우편번호';
        StringGrid1.Cells[2,0] := '지번주소';
        StringGrid1.Cells[3,0] := '도로명주소';
        StringGrid1.Cells[4,0] := '부가정보';
        StringGrid1.Cells[5,0] := '관련지번 목록';
        StringGrid1.ColWidths[2] := 280;
        StringGrid1.ColWidths[3] := 280;
        StringGrid1.ColWidths[4] := 150;
        StringGrid1.ColWidths[5] := 100;
        StringGrid1.RowCount := 20;
end;

// 주소검색
procedure Tsearch.btnSearchClick(Sender: TObject);
var
        searchResult : TSearchResult;
        i,j,pageNum, perPage: integer;
        relatedJibun : string;

begin
        // 그리드 초기화
        for i := 1 to StringGrid1.RowCount - 1 do
        StringGrid1.Rows[i].Clear;

        if txtIndex.text = '' then
        begin
                raise EJusolinkException.Create(-99999999, '검색어가 입력되지 않았습니다.');
        end;
                
        pageNum := StrToInt(txtCurrentPage.Caption);

        try
                //search(검색어, 페이지번호, 목록갯수, 수정제시어 끄기, 차등검색 끄기)
                //페이지 목록갯수는 최대 100개까지 가능
                perPage := 20;
                searchResult := jusolinkService.search(txtIndex.text, pageNum, perPage, false, false);
        except
                on le : EJusolinkException do begin
                        Exit;
                end;
        end;
        

        txtCurrentPage.Caption := IntToStr(searchResult.page);

        for i:= 0 to Length(searchResult.juso)-1 do
        begin
                StringGrid1.Cells[0,i+1] := searchResult.juso[i].zipcode; // 우편번호
                StringGrid1.Cells[1,i+1] := searchResult.juso[i].sectionNum; //새우편번호
                StringGrid1.Cells[2,i+1] := searchResult.juso[i].jibunAddr;  //지번주소
                StringGrid1.Cells[3,i+1] := searchResult.juso[i].roadAddr1;  //도로명주소
                StringGrid1.Cells[4,i+1] := searchResult.juso[i].roadAddr2;  //도로명주소 부가정보(법정동, 공동주택명)

                if Length(searchResult.juso[i].relatedJibun) > 0 then
                        begin
                        relatedJibun := '';

                        for j:= 0 to Length(searchResult.juso[i].relatedJibun)-1 do
                        begin
                                //관련지번
                                relatedJibun := relatedJibun + searchResult.juso[i].relatedJibun[j];
                        end;
                        StringGrid1.Cells[5,i+1] := relatedJibun;
                end;
        end;

        txtCurrentPage.Caption := IntToStr(searchResult.page);     // 현재 페이지 번호
        txtTotalPage.Caption := IntToStr(searchResult.totalPage);  //전체 페이지 번호

        if searchResult.suggest <> '' then
        begin
                txtSuggest.Caption := '수정제시어 : ' +searchResult.suggest + ' 검색결과 보기';           // 수정제시어
                suggestIndex := searchResult.suggest;

        end
        else
        begin
                txtSuggest.Caption := '';
                suggestIndex := ''
        end;

end;

// 다음페이지
procedure Tsearch.btnNextPageClick(Sender: TObject);
begin
        if StrToInt(txtCurrentPage.Caption) < StrToInt(txtTotalPage.Caption) then
        begin
                txtCurrentPage.Caption := IntToStr(StrToInt(txtCurrentPage.Caption) + 1);
                btnSearch.Click();
        end;
end;

// 이전페이지
procedure Tsearch.btnPrevPageClick(Sender: TObject);
begin
        if StrToInt(txtCurrentPage.Caption) > 0 then
        begin
                txtCurrentPage.Caption := IntToStr(StrToInt(txtCurrentPage.Caption) - 1);
                btnSearch.Click();
        end;
end;


// 주소정보 선택
procedure Tsearch.selectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
        detailForm : TsearchDetail;
begin

        if Stringgrid1.Cells[0,ARow] <> '' then
        begin
                g_zipcode := Stringgrid1.Cells[0,ARow];    // 구우편번호
                g_sectionNum := Stringgrid1.Cells[1,ARow]; // 새우편번호
                g_jibunAddr := Stringgrid1.Cells[2,ARow];  // 지번주소
                g_roadAddr1 := Stringgrid1.Cells[3,ARow];  // 도로명주소
                g_roadAddr2 := Stringgrid1.Cells[4,ARow];  // 도로명주소 부가정보

                // 도로명, 지번주소 타입구분
                if ACol = 2 then g_type := 'Jibun'
                else g_type := 'Road';

                // 상세주소 입력폼 생성
                Application.CreateForm(TsearchDetail, detailForm);
                detailForm.Show;
                Close;
        end
        else
end;

// 수정제시어 결과보기
procedure Tsearch.txtSuggestClick(Sender: TObject);
begin
        if suggestIndex <> '' then
        begin
                txtIndex.text := suggestIndex;
                btnSearch.Click()
        end
end;

end.


