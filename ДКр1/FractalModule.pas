  unit FractalModule;


uses GraphABC;
Procedure DrawPeano(x, y, l, u : Real; t, depth : Integer); //проверка параметров

Procedure Draw2Peano(Var x, y: Real; l, u : Real; t, depth : Integer); //построения фрактала 
    DrawPeano(x, y, l, u, t, depth);
    x := x + l*cos(u);
    y := y - l*sin(u);
End;

Begin
    If (t > 0) and (depth > 0) Then //база
    Begin
        l := l/3;
        Draw2Peano(x, y, l, u, t-1, depth-1); //декомпозиция
        u := u - pi/2;
        Draw2Peano(x, y, l, u, t-1, depth-1);//декомпозиция
        u := u + pi/2;
        Draw2Peano(x, y, l, u, t-1, depth-1);//декомпозиция
        u := u + pi/2;
        Draw2Peano(x, y, l, u, t-1, depth-1);//декомпозиция
        u := u + pi/2;
        Draw2Peano(x, y, l, u, t-1, depth-1);//декомпозиция
        u := u - pi/2;
        Draw2Peano(x, y, l, u, t-1, depth-1);//декомпозиция
        Draw2Peano(x, y, l*3, u + pi/2, t-1, depth-1); //декомпозиция
    End
    Else //база
        Line(Round(x), Round(y), Round(x + cos(u)*l), Round(y -sin(u)*l));

End;
begin
end.
