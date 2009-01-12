/* два натуральных числа называются взаимно простыми, если они имеют в точности один общий делитель. Пара натуральных чисел (х,у) задается списком (х.у.nil). Две пары чисел, отличающиеся лишь порядком следования чисел, считаются одинаковыми. Составить логическую программу, которая для заданного натурального числа N вычисляет список Х всех неодинаковых пар взаимно простых чисел, не превосходящих N. Запрос G(N,X) */

gcd( A, B, A ) :- A =:= B, !.
gcd( A, B, X ) :- A > B, !, gcd( A - B, B, X ).
gcd( A, B, X ) :- gcd( B - A, A, X ).

vp( A, B ) :- gcd( A, B, X ), X =:= 1.

build_vp( A, _, [] ) :- A =:= 0, !.
build_vp( A, B, Remain ) :- B =:= 0, !, build_vp( A-1, A-1, Remain ).
build_vp( A, B, [ [ A, B ] | Remain ] ) :- vp( A, B ), !, build_vp( A, B-1, Remain ).
build_vp( A, B, Remain ) :- build_vp( A, B-1, Remain ).

g( N, X ) :- build_vp( N, N, X ).
