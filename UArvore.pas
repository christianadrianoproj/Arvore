unit UArvore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, EstruturaArvore, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    btAdd: TBitBtn;
    btResultado: TBitBtn;
    btSair: TBitBtn;
    btRemove: TBitBtn;
    mmValor: TMemo;
    Label5: TLabel;
    edCargo: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    edFormacao: TEdit;
    edNome: TEdit;
    Label1: TLabel;
    mmArvore: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btResultadoClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    ControleArvore: TEstruturaArvore;
  public
    procedure LimpaCampos;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btAddClick(Sender: TObject);
begin
  ControleArvore.InsereArvore(edNome.Text, edFormacao.Text, edCargo.Text, StrToFloatDef(mmValor.Text,0));
end;

procedure TForm1.btRemoveClick(Sender: TObject);
begin
  ControleArvore.RemoveArvore(edNome.Text);
end;

procedure TForm1.btResultadoClick(Sender: TObject);
begin
 mmArvore.Lines.Clear;
 mmArvore.Lines.AddStrings(ControleArvore.MostrarArvore());
end;

procedure TForm1.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ControleArvore := TEstruturaArvore.Create;
  LimpaCampos;
end;

procedure TForm1.LimpaCampos;
begin
  edCargo.Clear;
  edNome.Clear;
  edFormacao.Clear;
  mmValor.Lines.Clear;
end;

end.
