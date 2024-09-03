unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  s:integer;
  a,d,s1:real;
begin
  s:=strtoint(edit1.text);
  a:=sqrt(s);
  d:=a*sqrt(2);
  s1:=sqr(a/2)*Pi;
  Edit2.text:=floattostr(a);
  Edit3.text:=floattostr(d);
  Edit4.text:=floattostr(s1);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.

