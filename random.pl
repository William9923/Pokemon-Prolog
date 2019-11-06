randomencounter :-
	random(1,256,Result),
	randomizer(Result).
/*randomizer(Result) for desert*/
randomizer(Result) :-
	letak_player(X,Y), 
	Result < 64,
	terrain(desert,X,Y),
	M = 'tokemondesert01',
	battle(M),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(desert,X,Y),
	M = 'tokemondesert02',
	battle(M),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(desert,X,Y),
	M = 'tokemondesert03',
	battle(M),nl,!.
/******************************************************/
/*randomizer(Result) for forest*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(forest,X,Y),
	M = 'tokemonforest01',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(forest,X,Y),
	M = 'tokemonforrest02',
	battle(M),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(forest,X,Y),
	M = 'tokemonforrest03',
	battle(M),nl,!.
/******************************************************/
/*randomizer(Result) for wasteland*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(wasteland,X,Y),
	M = 'tokemonwasteland01',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(wasteland,X,Y),
	M = 'tokemonwasteland02',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(wasteland,X,Y),
	M = 'tokemonwasteland03',
	battle(M),nl,!.
/******************************************************/
/*randomizer(Result) for grassland*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(grassland,X,Y),
	M = 'tokemonwasteland03',
	battle(M),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(grassland,X,Y),
	M = 'tokemonwasteland03',
	battle(M),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(grassland,X,Y),
	M = 'tokemonwasteland03',
	battle(M),nl,!.
/******************************************************/
/*randomizer(Result) for mountain*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(mountain,X,Y),
	M = 'tokemonwasteland03',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(mountain,X,Y),
	M = 'tokemonwasteland03',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(mountain,X,Y),
	M = 'tokemonwasteland03',
	battle(M),nl,!.

/******************************************************/
/*randomizer(Result) for lava*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(lava,X,Y),
	M = 'tokemonwasteland03',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(lava,X,Y),
	M = 'tokemonwasteland03',
	battle(M),nl,!.

andomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(lava,X,Y),
	M = 'tokemonwasteland03',
	battle(M),nl,!.
	
/******************************************************/
/*randomizer(Result) safely*/
randomizer(Result) :-
	Result >= 192,
	letak_player(X,Y),
	terrain(_,X,Y),
	write('You have traveled safely.'),nl, !.

