unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  a,b:integer;
  f,e:real;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
     a:=strtoint(edit1.text);
     b:=strtoint(edit2.text);
     f:=Sqrt(Pi/8) * Sqrt(Power((a + b), 1/4) / (Power(a, 2) + Power(b, 2))) - a * Power(b, 3);
     edit4.text:=floattostr(f);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edit1.clear;
  edit2.clear;
  edit4.clear;
  edit1.setfocus;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin

end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;

end.

