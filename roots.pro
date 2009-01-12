/* Однокоренные слова -- те слова, которые содержат общую последовательности из хотя бы трёх букв.
   Для данного текста L получить список X уникальных пар однокоренных слов.
 */

sim_roots( [ A, B, C | _ ], [ A, B, C | _ ] ).
sim_roots( [ A, B, C | _ ], [ _ | Tail ] ) :- sim_roots( [ A, B, C ], Tail ).
sim_roots( [ _ | A ], B ) :- sim_roots( A, B ).

b_pairs( [X|Tailone], [X|Tailtwo], Remain ) :- b_pairs( [X|Tailone], Tailtwo, Remain ), !.
b_pairs( [X|Tailone], [Y|Tailtwo], [ [X,Y] | Remain ] ) :- b_pairs( [X|Tailone], Tailtwo, Remain ).
b_pairs( [_|Tailone], [], Remain ) :- b_pairs( Tailone, Tailone, Remain ).
b_pairs( [], _, [] ).

b_setsquare( L, X ) :- b_pairs( L, L, X ).

b_uniquepairs( [ [X, Y] | Tail ], Tailres ) :- member( [X,Y], Tail ), !, b_uniquepairs( Tail, Tailres ).
b_uniquepairs( [ [X, Y] | Tail ], Tailres ) :- member( [Y,X], Tail ), !, b_uniquepairs( Tail, Tailres ).
b_uniquepairs( [ [X, Y] | Tail ], [ [X, Y] | Tailres ] ) :- b_uniquepairs( Tail, Tailres ).
b_uniquepairs( [], [] ).

b_usetsquare( L, X ) :- b_pairs( L, L, Y ), b_uniquepairs( Y, X ).

f_simrootpairs( [ [ X, Y ] | Tail ], [ [X, Y] | Tailres ] ) :- sim_roots( X, Y ), !, f_simrootpairs( Tail, Tailres ).
f_simrootpairs( [ _ | Tail ], Tailres ) :- f_simrootpairs( Tail, Tailres ).
f_simrootpairs( [], [] ).

g( L, X ) :- b_usetsquare( L, Pairs ), f_simrootpairs( Pairs, X ).

