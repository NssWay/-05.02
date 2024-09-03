program NodeListExample;

type
  PNode = ^TNode;
  TNode = record
    Data: Integer;
    Next: PNode;
  end;

var
  myList: PNode;
  currentNode, nextNode: PNode;
  i: Integer;

begin
  Randomize;

  // Создание списка из десяти элементов
  myList := nil;
  for i := 1 to 10 do
  begin
    New(nextNode);
    nextNode^.Data := Random(100);
    nextNode^.Next := nil;
    
    if myList = nil then
    begin
      myList := nextNode;
      currentNode := myList;
    end
    else
    begin
      currentNode^.Next := nextNode;
      currentNode := nextNode;
    end;
  end;

  // Вывод списка
  writeln('Список из десяти элементов:');
  currentNode := myList;
  while currentNode <> nil do
  begin
    write(currentNode^.Data, ' ');
    currentNode := currentNode^.Next;
  end;

  // Вывод четных элементов списка
  writeln;
  writeln('Четные элементы списка:');
  currentNode := myList;
  while currentNode <> nil do
  begin
    if currentNode^.Data mod 2 = 0 then
    begin
      write(currentNode^.Data, ' ');
    end;
    currentNode := currentNode^.Next;
  end;
end.
