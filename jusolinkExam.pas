unit jusolinkExam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Jusolink;

const
        // ��ũ���̵�.
        LinkID = 'TESTER_JUSO';
        // ��Ʈ�� ��ſ� ���Ű. ���� ����.
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
        // �ּ� API ��� �ʱ�ȭ
        jusolinkService := TJusolinkService.Create(LinkID,SecretKey);


        resultZipcode := '';
        resultAddr := '';
        resultSectionNum := '';
end;

// �˻��ܰ� ��ȸ
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

        ShowMessage('�˻��ܰ� : '+ FloatToStr(unitcost));
end;

// �ܿ�����Ʈ ��ȸ
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

        ShowMessage('�ܿ�����Ʈ : '+ FloatToStr(balance));
end;

// �ּҰ˻� �� ����
procedure TJusolinkForm.btnSearchFormClick(Sender: TObject);
var
        searchForm : Tsearch;
begin
        Application.CreateForm(Tsearch, SearchForm);
        SearchForm.Show;
end;

procedure TJusolinkForm.onActivate(Sender: TObject);
begin
        txtZipcode.text := resultZipcode; // �������ȣ
        txtAddress.text := resultAddr;    // �ּ�
        txtSectionNum.text := resultSectionNum;   //�������ȣ
        txtAddress.SetFocus;
end;


end.
