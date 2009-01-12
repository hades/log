odd_occ( [X|L], X ) :- !, even_occ( L, X ).
odd_occ( [X], X ).
odd_occ( [_|L], X ) :- odd_occ( L, X ).

even_occ( [X|L], X ) :- !, odd_occ( L, X ).
even_occ( [], _ ).
even_occ( [_|L], X ) :- even_occ( L, X ).

len( [_|L], 1 + Len ) :- len( L, Len ).
len( [_], 1 ).

max_length( [X|Tail], Xlen ) :- max_length( Tail, Taillen ), len( X, Xlen ), Xlen > Taillen, !.
max_length( [_|Tail], Taillen ) :- max_length( Tail, Taillen ).
max_length( [X], Xlen ) :- len( X, Xlen ).

get_elements_of_len( [X|Tail], Len, [X | TailRes] ) :- len( X, Len ), !, get_elements_of_len( Tail, Len, TailRes ).
get_elements_of_len( [_|Tail], Len, TailRes ) :- get_elements_of_len( Tail, Len, TailRes ).
get_elements_of_len( [], _, [] ).

b_longest( L, R ) :- max_length( L, Len ), get_elements_of_len( L, Len, R ).

b_odd_occ( [X|Tail], Text, [X|Tailres] ) :- odd_occ( Text, X ), !, b_odd_occ( Tail, Text, Tailres ).
b_odd_occ( [_|Tail], Text, Tailres ) :- b_odd_occ( Tail, Text, Tailres ).
b_odd_occ( [], _, [] ).

b_unique( [X|Tail], Tailres ) :- member( X, Tail ), !, b_unique( Tail, Tailres ).
b_unique( [X|Tail], [X|Tailres] ) :- b_unique( Tail, Tailres ).
b_unique( [], [] ).

g( L1, L2, X ) :- b_longest( L1, Longest ), b_odd_occ( Longest, L2, OddOcc ), b_unique( OddOcc, X ).