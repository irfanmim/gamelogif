
start :-
	valid(mulai).

valid(quit) :- !.

valid(X) :-
   	(X = 'goto' -> write('tidak boleh') ; write('boleh'),nl, write(X)),nl,
   	read(Y),
	valid(Y).