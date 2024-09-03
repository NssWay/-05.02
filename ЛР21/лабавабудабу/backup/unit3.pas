unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type
  Contacts = record
    Name: string[100];
    Telephon: string[20];
    Note: string[20];
  end; //record

  { TfEdit1 }

  TfEdit1 = class(TForm)
    bSave: TBitBtn;
    bCancel: TBitBtn;
    CBNote: TComboBox;
    eTelephone: TEdit;
    eName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fEdit1: TfEdit1;
  adres: string; //адрес, откуда запущена программа

implementation

{$R *.lfm}

{ TfEdit1 }

procedure TfEdit1.FormShow(Sender: TObject);
begin
  eName.SetFocus;
end;

procedure TfEdit1.FormCreate(Sender: TObject);
begin

end;

end.

