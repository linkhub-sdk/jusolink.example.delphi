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
  g_zipcode : string;       // �������ȣ
  g_sectionNum : string;    // �������ȣ
  g_roadAddr1 : string;     // ���θ��ּ�
  g_roadAddr2 : string;     // ���θ��ּ� �ΰ����� (������, �������ø�)
  g_jibunAddr : string;     // �����ּ�
  g_type : string;          // �ּ�Ÿ��
  suggestIndex : string;    // �������þ�
  
implementation
        uses jusolinkExam, searchDetailAddr;

{$R *.DFM}

procedure Tsearch.FormCreate(Sender: TObject);
begin
        // �ּ� API ��� �ʱ�ȭ
        jusolinkService := TJusolinkService.Create(jusolinkExam.LinkID, jusolinkExam.SecretKey);
        StringGrid1.Cells[0,0] := '�����ȣ';
        StringGrid1.Cells[1,0] := '�������ȣ';
        StringGrid1.Cells[2,0] := '�����ּ�';
        StringGrid1.Cells[3,0] := '���θ��ּ�';
        StringGrid1.Cells[4,0] := '�ΰ�����';
        StringGrid1.Cells[5,0] := '�������� ���';
        StringGrid1.ColWidths[2] := 280;
        StringGrid1.ColWidths[3] := 280;
        StringGrid1.ColWidths[4] := 150;
        StringGrid1.ColWidths[5] := 100;
        StringGrid1.RowCount := 20;
end;

// �ּҰ˻�
procedure Tsearch.btnSearchClick(Sender: TObject);
var
        searchResult : TSearchResult;
        i,j,pageNum, perPage: integer;
        relatedJibun : string;

begin
        // �׸��� �ʱ�ȭ
        for i := 1 to StringGrid1.RowCount - 1 do
        StringGrid1.Rows[i].Clear;

        if txtIndex.text = '' then
        begin
                raise EJusolinkException.Create(-99999999, '�˻�� �Էµ��� �ʾҽ��ϴ�.');
        end;
                
        pageNum := StrToInt(txtCurrentPage.Caption);

        try
                //search(�˻���, ��������ȣ, ��ϰ���, �������þ� ����, ����˻� ����)
                //������ ��ϰ����� �ִ� 100������ ����
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
                StringGrid1.Cells[0,i+1] := searchResult.juso[i].zipcode; // �����ȣ
                StringGrid1.Cells[1,i+1] := searchResult.juso[i].sectionNum; //�������ȣ
                StringGrid1.Cells[2,i+1] := searchResult.juso[i].jibunAddr;  //�����ּ�
                StringGrid1.Cells[3,i+1] := searchResult.juso[i].roadAddr1;  //���θ��ּ�
                StringGrid1.Cells[4,i+1] := searchResult.juso[i].roadAddr2;  //���θ��ּ� �ΰ�����(������, �������ø�)

                if Length(searchResult.juso[i].relatedJibun) > 0 then
                        begin
                        relatedJibun := '';

                        for j:= 0 to Length(searchResult.juso[i].relatedJibun)-1 do
                        begin
                                //��������
                                relatedJibun := relatedJibun + searchResult.juso[i].relatedJibun[j];
                        end;
                        StringGrid1.Cells[5,i+1] := relatedJibun;
                end;
        end;

        txtCurrentPage.Caption := IntToStr(searchResult.page);     // ���� ������ ��ȣ
        txtTotalPage.Caption := IntToStr(searchResult.totalPage);  //��ü ������ ��ȣ

        if searchResult.suggest <> '' then
        begin
                txtSuggest.Caption := '�������þ� : ' +searchResult.suggest + ' �˻���� ����';           // �������þ�
                suggestIndex := searchResult.suggest;

        end
        else
        begin
                txtSuggest.Caption := '';
                suggestIndex := ''
        end;

end;

// ����������
procedure Tsearch.btnNextPageClick(Sender: TObject);
begin
        if StrToInt(txtCurrentPage.Caption) < StrToInt(txtTotalPage.Caption) then
        begin
                txtCurrentPage.Caption := IntToStr(StrToInt(txtCurrentPage.Caption) + 1);
                btnSearch.Click();
        end;
end;

// ����������
procedure Tsearch.btnPrevPageClick(Sender: TObject);
begin
        if StrToInt(txtCurrentPage.Caption) > 0 then
        begin
                txtCurrentPage.Caption := IntToStr(StrToInt(txtCurrentPage.Caption) - 1);
                btnSearch.Click();
        end;
end;


// �ּ����� ����
procedure Tsearch.selectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
        detailForm : TsearchDetail;
begin

        if Stringgrid1.Cells[0,ARow] <> '' then
        begin
                g_zipcode := Stringgrid1.Cells[0,ARow];    // �������ȣ
                g_sectionNum := Stringgrid1.Cells[1,ARow]; // �������ȣ
                g_jibunAddr := Stringgrid1.Cells[2,ARow];  // �����ּ�
                g_roadAddr1 := Stringgrid1.Cells[3,ARow];  // ���θ��ּ�
                g_roadAddr2 := Stringgrid1.Cells[4,ARow];  // ���θ��ּ� �ΰ�����

                // ���θ�, �����ּ� Ÿ�Ա���
                if ACol = 2 then g_type := 'Jibun'
                else g_type := 'Road';

                // ���ּ� �Է��� ����
                Application.CreateForm(TsearchDetail, detailForm);
                detailForm.Show;
                Close;
        end
        else
end;

// �������þ� �������
procedure Tsearch.txtSuggestClick(Sender: TObject);
begin
        if suggestIndex <> '' then
        begin
                txtIndex.text := suggestIndex;
                btnSearch.Click()
        end
end;

end.


