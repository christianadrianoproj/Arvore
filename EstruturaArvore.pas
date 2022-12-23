unit EstruturaArvore;

interface

uses System.Classes, System.SysUtils;

type
  Arvore = ^TNo;
  TNo = record
    Nome: String[100];
    Formacao: String[200];
    Cargo: String[100];
    ValorSalario: Real;
    Esquerda: Arvore;
    Direita: Arvore;
  end;

  TEstruturaArvore = class
  private
    raiz: Arvore;
    procedure InsereArvore(var raiz: Arvore; Nome, Formacao,Cargo: String; ValorSalario: Real); overload;
    procedure RemoveArvore(var Arv:Arvore; nome:string); overload;
    procedure MostrarArvore(Arv: Arvore; var aux: TStrings); overload;
  public
    constructor Create();
    destructor Destroy();

    procedure InsereArvore(Nome, Formacao,Cargo: String; ValorSalario: Real); overload;
    procedure RemoveArvore(nome:string); overload;
    function MostrarArvore(): TStrings; overload;
  end;

implementation

{ TEstruturaArvore }

constructor TEstruturaArvore.Create;
begin
  raiz := nil;
end;

destructor TEstruturaArvore.Destroy;
begin

end;

procedure TEstruturaArvore.InsereArvore(Nome, Formacao, Cargo: String; ValorSalario: Real);
begin
  InsereArvore(raiz, Nome, Formacao,Cargo,ValorSalario);
end;

procedure TEstruturaArvore.InsereArvore(var raiz: Arvore; Nome, Formacao, Cargo: String; ValorSalario: Real);
begin
  if raiz = nil then
  begin
    new(raiz);
    raiz^.Nome := Nome;
    raiz^.Formacao := Formacao;
    raiz^.Cargo := Cargo;
    raiz^.ValorSalario := ValorSalario;
    raiz^.Esquerda := nil;
    raiz^.Direita := nil;
  end
  else
  begin
    if Nome < raiz^.Nome then
      InsereArvore(raiz^.Esquerda,Nome,Formacao,Cargo,ValorSalario);
    if Nome > raiz^.Nome then
      InsereArvore(raiz^.Direita,Nome,Formacao,Cargo,ValorSalario);
  end;
end;

procedure TEstruturaArvore.MostrarArvore(Arv: Arvore; var aux: TStrings);
begin
  if Arv <> nil then
  begin
    MostrarArvore(Arv^.Esquerda, aux);
    aux.Add('Nome: ' + Arv^.nome);
    MostrarArvore(Arv^.Direita, aux);
  end;
end;

procedure TEstruturaArvore.RemoveArvore(var Arv: Arvore; nome: string);
var
  rem,no: Arvore;
begin
  if arv <> nil then
  begin
    if arv^.nome > nome then
      RemoveArvore(arv^.Esquerda, nome)
    else
      if arv^.nome < nome then
        RemoveArvore(arv^.Direita, nome)
      else
        if (arv^.Esquerda = nil) and (arv^.Direita = nil) then
        begin
          dispose(arv);
          arv := nil;
        end
        else
          if arv^.Esquerda = nil then
          begin
            rem:=arv;
            arv:=arv^.Direita;
            dispose (rem);
          end
          else
            if arv^.Direita = nil then
            begin
              rem:=arv;
              arv:=arv^.Esquerda;
              dispose(rem);
            end
            else
            begin
              no:=arv^.Esquerda;
              while (no^.Direita <> nil) do
                no := no^.Direita;
              arv^.nome := no^.nome;
              no^.nome := nome;
              RemoveArvore(arv^.Esquerda,nome);
            end;
  end;
end;

function TEstruturaArvore.MostrarArvore: TStrings;
begin
  Result := TStringList.Create;
  MostrarArvore(raiz, Result);
end;

procedure TEstruturaArvore.RemoveArvore(nome: string);
begin
  RemoveArvore(raiz, nome);
end;

end.
