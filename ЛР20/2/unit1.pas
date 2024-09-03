unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  v1, v2, v3: variant;
begin
  v1:= '5';  //назначили значение
  v2:= '10';  //к значению добавили число
  v3:= 20;  //сложили к итоговму числу
  v1:= v1 + v2 + v3;

  ShowMessage(IntToStr(v1));
end;

end.

