randomencounter :-
	random(1,256,Result),
	randomizer(Result).
/*randomizer(Result) for desert*/
randomizer(Result) :-
	letak_player(X,Y), 
	Result < 64,
	terrain(desert,X,Y),
	write('You have encountered tokemondesert01.'),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(desert,X,Y),
	write('You have encountered tokemondesert02.'),nl, !.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(desert,X,Y),
	write('You have encountered tokemondesert03.'),nl, !.

/******************************************************/
/*randomizer(Result) for forest*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(forest,X,Y),
	write('You have encountered tokemonforest01.'),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(forest,X,Y),
	write('You have encountered tokemondforest02.'),nl, !.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(forest,X,Y),
	write('You have encountered tokemondforest03.'),nl, !.
/******************************************************/
/*randomizer(Result) for wasteland*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(wasteland,X,Y),
	write('You have encountered tokemonwasteland01.'),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(wasteland,X,Y),
	write('You have encountered tokemondwasteland02.'),nl, !.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(wasteland,X,Y),
	write('You have encountered tokemondwasteland03.'),nl, !.
/******************************************************/
/*randomizer(Result) for grassland*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(grassland,X,Y),
	write('You have encountered tokemongrassland01.'),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(grassland,X,Y),
	write('You have encountered tokemondgrassland02.'),nl, !.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(grassland,X,Y),
	write('You have encountered tokemondgrassland03.'),nl, !.
/******************************************************/
/*randomizer(Result) for mountain*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(mountain,X,Y),
	write('You have encountered tokemonmountain01.'),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(mountain,X,Y),
	write('You have encountered tokemonmountain02.'),nl, !.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(mountain,X,Y),
	write('You have encountered tokemondountain03.'),nl, !.
/******************************************************/
/*randomizer(Result) for lava*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(lava,X,Y),
	write('You have encountered tokemonlava01.'),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(lava,X,Y),
	write('You have encountered tokemonlava02.'),nl, !.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(lava,X,Y),
	write('You have encountered tokemonlava03.'),nl, !.
/******************************************************/
/*randomizer(Result) safely*/
randomizer(Result) :-
	Result >= 192,
	letak_player(X,Y),
	terrain(_,X,Y),
	write('You have traveled safely.'),nl, !.

