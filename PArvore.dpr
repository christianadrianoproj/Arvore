program PArvore;

uses
  Vcl.Forms,
  UArvore in 'UArvore.pas' {Form1},
  EstruturaArvore in 'EstruturaArvore.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
