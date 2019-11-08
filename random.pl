randomencounter :-
	random(1,256,Result),
	randomizer(Result).
/*randomizer(Result) for desert*/
randomizer(Result) :-
	letak_player(X,Y), 
	Result < 64,
	terrain(desert,X,Y),
	M = 'Dragonflymon',
	battle(M),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(desert,X,Y),
	M = 'Falconmon',
	battle(M),nl,!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(desert,X,Y),
	M = 'GreatOwlmon',
	battle(M),nl,!.
/******************************************************/
/*randomizer(Result) for forest*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(forest,X,Y),
	M = 'MantaRaymon',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(forest,X,Y),
	M = 'GatorGatorGatormon',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(forest,X,Y),
	M = 'Orcamon',
	battle(M),nl,!.

/******************************************************/
/*randomizer(Result) for wasteland*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(wasteland,X,Y),
	M = 'Cobramon',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(wasteland,X,Y),
	M = 'KomodoDragonmon',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(wasteland,X,Y),
	M = 'Magmamon',
	battle(M),nl,!.

/******************************************************/
/*randomizer(Result) for grassland*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(grassland,X,Y),
	M = 'Slyphmon',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(grassland,X,Y),
	M = 'Slyphmon',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(grassland,X,Y),
	M = 'Slyphmon',
	battle(M),nl,!.
	
/******************************************************/
/*randomizer(Result) for mountain*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(mountain,X,Y),
	M = 'Undinemon',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(mountain,X,Y),
	M = 'Undinemon',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(mountain,X,Y),
	M = 'Undinemon',
	battle(M),nl,!.

/******************************************************/
/*randomizer(Result) for lava*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 64,
	terrain(lava,X,Y),
	M = 'Salamandermon',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 64,
	Result < 128,
	terrain(lava,X,Y),
	M = 'Salamandermon',
	battle(M),nl,!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 128,
	Result < 192,
	terrain(lava,X,Y),
	M = 'Salamandermon',
	battle(M),nl,!.
	
/******************************************************/
/*randomizer(Result) safely*/
randomizer(Result) :-
	Result >= 192,
	letak_player(X,Y),
	terrain(_,X,Y),
	write('You have traveled safely.'),nl, !.

