unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    StringGrid1: TStringGrid;
  private

  public

  end;

var
  Form1: TForm1;
  VAR
y: array of extended;
x,a,b,h:extended;
n,i : integer;
begin
  try
   a := StrToFloat(Edit1.Text);
   b := StrToFloat(Edit2.Text);
   h := StrToFloat(Edit3.Text);
  except
    on E : Exception do ShowMessage(E.Message);
  end;

  if b < a then Begin
     ShowMessage('b < a!');
     exit;
  End;
  x := a;
  i := 0;
  n := trunc((b-a) / h) + 1;
  SetLength(y, n);
  StringGrid1.ColCount := n;
  StringGrid1.RowCount := 2;
  while x <= b do begin
        y[i] := x*x;
        StringGrid1.Cells[i,0] := FloatToStr(x);
        StringGrid1.Cells[i,1] := FloatToStr(y[i]);
        x := x + h;
        i := i + 1;
  end;
end;

implementation

{$R *.lfm}

end.

