type
  Node = record 
    value: integer; 
    next: ^Node; 
  end;
  list = ^Node;

var
  head: list; 
  min, max: integer;

procedure List1(var head: list);
var
  inputValue: integer; 
  lastNode, newNode: list;
begin
  head := nil; 
  lastNode := nil; 
  write('Введите значения (0 для остановки): '); 
  read(inputValue); 
  while (inputValue <> 0) do
  begin
    new(newNode); 
    newNode^.value := inputValue; 
    newNode^.next := nil; 
    if (head = nil) then begin
      head := newNode; 
    end else begin
      lastNode^.next := newNode; 
    end; 
    lastNode := newNode; 
    read(inputValue); 
  end; 
end;

procedure maxMin(head: List; var min: integer; var max: integer);
var
  current: list;
begin
  current := head; 
  min := current^.value; 
  max := current^.value; 
  current := current^.next; 
  while (current <> nil) do
  begin
    if (current^.value < min) then begin
      min := current^.value; 
    end; 
    if (current^.value > max) then begin
      max := current^.value; 
    end; 
    current := current^.next; 
  end; 
end;

begin
  List1(head); 
  maxMin(head, min, max); 
  writeln('Min: ', min); 
  writeln('Max: ', max); 
end.