odd_occ( [X|L], X ) :- !, even_occ( L, X ).
odd_occ( [X], X ).
odd_occ( [_|L], X ) :- odd_occ( L, X ).

even_occ( [X|L], X ) :- !, odd_occ( L, X ).
even_occ( [], _ ).
even_occ( [_|L], X ) :- even_occ( L, X ).

b_odd_even_occ( [X|Tail], Text, [X|TailOdd], TailEven ) :- odd_occ( Text, X ), !, b_odd_even_occ( Tail, Text, TailOdd, TailEven ).
b_odd_even_occ( [X|Tail], Text, TailOdd, [X|TailEven] ) :- b_odd_even_occ( Tail, Text, TailOdd, TailEven ).
b_odd_even_occ( [], _, [], [] ).

b_unique( [X|Tail], Tailres ) :- member( X, Tail ), !, b_unique( Tail, Tailres ).
b_unique( [X|Tail], [X|Tailres] ) :- b_unique( Tail, Tailres ).
b_unique( [], [] ).

g( L1, L2, X, Y ) :- b_odd_even_occ( L1, L2, OddOcc, EvenOcc ), b_unique( OddOcc, Y ), b_unique( EvenOcc, X ).
