var
  inputFile, outputFile: text;
  numbers: array of Integer;
  num, i: Integer;

begin
  Assign(inputFile, 'input.txt');
  Reset(inputFile);
  
  i := 0;
  while not Eof(inputFile) do
  begin
    Read(inputFile, num);
    SetLength(numbers, Length(numbers) + 1);
    numbers[i] := num;
    Inc(i);
  end;
  
  Close(inputFile);
  
  Assign(outputFile, 'output.txt');
  Rewrite(outputFile);
  
  for i := Length(numbers) - 1 downto 0 do
  begin
    Write(outputFile, numbers[i], ' ');
  end;
  
  Close(outputFile);
end.