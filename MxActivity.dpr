program MxActivity;

uses
  Vcl.Forms,
  main in 'main.pas' {MxActivityForm},
  mx in 'mx.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Emerald Light Slate');
  Application.CreateForm(TMxActivityForm, MxActivityForm);
  Application.Run;
end.
