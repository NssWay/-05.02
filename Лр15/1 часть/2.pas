type
    dict = array of string;

function func(dictionary: dict): integer;
var
    uniqueWords: array of string;
    i, j, count: integer;
    isUnique: boolean;
begin
    count := 0;
    setlength(uniqueWords, 0);

    for i := 0 to High(dictionary) do
    begin
        isUnique := true;
        for j := 0 to High(uniqueWords) do
        begin
            if dictionary[i] = uniqueWords[j] then
            begin
                isUnique := false;
                break;
            end;
        end;

        if isUnique then
        begin
            count := count + 1;
            setlength(uniqueWords, length(uniqueWords) + 1);
            uniqueWords[high(uniqueWords)] := dictionary[i];
        end;
    end;

    func := count;
end;

var
    wordsInput: string;
    wordsList: dict;
    uniqueCount: integer;

begin
    writeln('Введите: ');
    readln(wordsInput);

    wordsList := wordsInput.Split(' ');
    uniqueCount := func(wordsList);

    writeln('Кол-во уникальных слов: ', uniqueCount);
end.
