program jusolinkExample;

uses
  Forms,
  jusolinkExam in 'jusolinkExam.pas' {JusolinkForm},
  Jusolink in 'jusolink\Jusolink.pas',
  Linkhub in 'jusolink\Linkhub\Linkhub.pas',
  searchExam in 'searchExam.pas' {search},
  searchDetailAddr in 'searchDetailAddr.pas' {searchDetail}
  ;
{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TJusolinkForm, JusolinkForm);
  Application.Run;
end.
