﻿program z26;

var
  A, B, C, max: integer;

begin
  write('Введите длину первой стороны треугольника ');
  read(A);
  write('Введите длину второй стороны треугольника ');
  read(B);
  write('Введите длину третьей стороны треугольника ');
  read(C);
    if (A+B>C) or (A+C>B) or (B+C<A) then write('Треугольник может существовать')
    else write('Треугольник не может существовать');
    end.
    
