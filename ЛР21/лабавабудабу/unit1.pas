unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons, Unit3,
  Grids;

type

  { TfMain }

  TfMain = class(TForm)
    Panel1: TPanel;
    bAdd: TSpeedButton;
    bEdit: TSpeedButton;
    bDel: TSpeedButton;
    bSort: TSpeedButton;
    SG: TStringGrid;
    procedure bAddClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bSortClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SGAfterSelection(Sender: TObject; aCol, aRow: Integer);
    procedure SGDblClick(Sender: TObject);
  private

  public

  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.bAddClick(Sender: TObject);
begin
  //очищаем поля, если там что-то есть:
  fEdit1.eName.Text:= '';
  fEdit1.eTelephone.Text:= '';
  //устанавливаем ModalResult редактора в mrNone:
  fEdit1.ModalResult:= mrNone;
  //теперь выводим форму:
  fEdit1.ShowModal;
  //если пользователь ничего не ввел - выходим:
  if (fEdit1.eName.Text= '') or (fEdit1.eTelephone.Text= '') then exit;
  //если пользователь не нажал "Сохранить" - выходим:
  if fEdit1.ModalResult <> mrOk then exit;
  //иначе добавляем в сетку строку, и заполняем её:
  SG.RowCount:= SG.RowCount + 1;
  SG.Cells[0, SG.RowCount-1]:= fEdit1.eName.Text;
  SG.Cells[1, SG.RowCount-1]:= fEdit1.eTelephone.Text;
  SG.Cells[2, SG.RowCount-1]:= fEdit1.CBNote.Text;
end;

procedure TfMain.bDelClick(Sender: TObject);
begin
  //если данных нет - выходим:
  if SG.RowCount = 1 then exit;
  //иначе выводим запрос на подтверждение:
  if MessageDlg('Требуется подтверждение',
                'Вы действительно хотите удалить контакт "' +
                SG.Cells[0, SG.Row] + '"?',
      mtConfirmation, [mbYes, mbNo, mbIgnore], 0) = mrYes then
         SG.DeleteRow(SG.Row);
end;

procedure TfMain.bEditClick(Sender: TObject);
begin
  //если данных в сетке нет - просто выходим:
  if SG.RowCount = 1 then exit;
  //иначе записываем данные в форму редактора:
  fEdit1.eName.Text:= SG.Cells[0, SG.Row];
  fEdit1.eTelephone.Text:= SG.Cells[1, SG.Row];
  fEdit1.CBNote.Text:= SG.Cells[2, SG.Row];
  //устанавливаем ModalResult редактора в mrNone:
  fEdit1.ModalResult:= mrNone;
  //теперь выводим форму:
  fEdit1.ShowModal;
  //сохраняем в сетку возможные изменения,
  //если пользователь нажал "Сохранить":
  if fEdit1.ModalResult = mrOk then begin
    SG.Cells[0, SG.Row]:= fEdit1.eName.Text;
    SG.Cells[1, SG.Row]:= fEdit1.eTelephone.Text;
    SG.Cells[2, SG.Row]:= fEdit1.CBNote.Text;
  end;
end;

procedure TfMain.bSortClick(Sender: TObject);
begin
  if SG.RowCount = 1 then exit;
  SG.SortColRow(true, 0);
end;

procedure TfMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  MyCont: Contacts;
  f: file of Contacts;
  i: integer;
begin
  if SG.RowCount = 1 then exit;

  try
    AssignFile(f, adres + 'telephones.dat');
    Rewrite(f);
    for i:= 1 to SG.RowCount-1 do begin
      MyCont.Name:= SG.Cells[0, i];
      MyCont.Telephon:= SG.Cells[1, i];
      MyCont.Note:= SG.Cells[2, i];
      Write(f, MyCont);
    end;
  finally
    CloseFile(f);
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
var
  MyCont: Contacts;
  f: file of Contacts;
  i: integer;
begin
  adres:= ExtractFilePath(ParamStr(0));
  SG.Cells[0, 0]:= 'Имя';
  SG.Cells[1, 0]:= 'Телефон';
  SG.Cells[2, 0]:= 'Примечание';
  SG.ColWidths[0]:= 365;
  SG.ColWidths[1]:= 150;
  SG.ColWidths[2]:= 150;
  if not FileExists(adres + 'telephones.dat') then exit;
  try
    AssignFile(f, adres + 'telephones.dat');
    Reset(f);
    while not Eof(f) do begin
      Read(f, MyCont);
        SG.RowCount:= SG.RowCount + 1;
        SG.Cells[0, SG.RowCount-1]:= MyCont.Name;
        SG.Cells[1, SG.RowCount-1]:= MyCont.Telephon;
        SG.Cells[2, SG.RowCount-1]:= MyCont.Note;
    end;
  finally
    CloseFile(f);
  end;
end;

procedure TfMain.SGAfterSelection(Sender: TObject; aCol, aRow: Integer);
begin

end;


procedure TfMain.SGDblClick(Sender: TObject);
begin
  if SG.RowCount = 1 then exit;
  fEdit1.eName.Text:= SG.Cells[0, SG.Row];
  fEdit1.eTelephone.Text:= SG.Cells[1, SG.Row];
  fEdit1.CBNote.Text:= SG.Cells[2, SG.Row];
  fEdit1.ModalResult:= mrNone;
  fEdit1.ShowModal;
  if fEdit1.ModalResult = mrOk then begin
    SG.Cells[0, SG.Row]:= fEdit1.eName.Text;
    SG.Cells[1, SG.Row]:= fEdit1.eTelephone.Text;
    SG.Cells[2, SG.Row]:= fEdit1.CBNote.Text;
  end;
end;


end.

