Uses GraphABC,FractalModule;

var
    ScaleFactor : Real = 1; // коэффициент масштабирования
    XPos, YPos : Integer; // текущие координаты фигуры



Procedure UpdateFractal(iterations, depth: Integer); //отрисовка фрактал
Begin
    ClearWindow;
    DrawPeano(100 + XPos + 1, 355 + YPos + 1, 400 * ScaleFactor, 0, iterations, depth);
End;

Begin
    SetWindowCaption('Фракталы: Кривая Пеано');
    SetWindowSize(650,500);
    ClearWindow;
    
    var iterations, depth: Integer;
    repeat
        Write('Введите количество итераций (0-7): ');
        Readln(iterations);
    until (iterations >= 0) and (iterations <= 7);
    
    repeat
        Write('Введите глубину прорисовки (0-7): ');
        Readln(depth);
    until (depth >= 0) and (depth <= 7);
    
    XPos := 0; 
    YPos := 0;
    
    UpdateFractal(iterations, depth); // отрисовка фрактала с заданными параметрами
    
    OnKeyDown := (key: integer) -> // обработчик нажатий клавиш
    begin
        case key of
            VK_A: XPos := XPos - 10; // движение влево
            VK_D: XPos := XPos + 10; // движение вправо
            VK_W: YPos := YPos - 10; // движение вверх
            VK_S: YPos := YPos + 10; // движение вниз
        end;
        
        UpdateFractal(iterations, depth); // обновление фрактала после перемещения
    end;
    
    Readln; // чтобы окно не закрывалось сразу
End.
