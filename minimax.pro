/* найти минимальный элемент списка L1, больший всех элементов списка L2 */

more_than_any( X, [Y|L] ) :- X > Y, !, more_than_any( X, L ).
more_than_any( _, [] ).

f_allmorethanany( [X | L], T, [X | Result] ) :- more_than_any( X, T ), !, f_allmorethanany( L, T, Result ).
f_allmorethanany( [_ | L], T, Result ) :- f_allmorethanany( L, T, Result ).
f_allmorethanany( [], _, [] ).

getmin( [ X | L ], X ) :- getmin( L, Y ), X < Y, !.
getmin( [ _ | L ], Y ) :- getmin( L, Y ).
getmin( [ X ], X ).

g( L1, L2, X ) :- f_allmorethanany( L1, L2, Y ), getmin( Y, X ).
