randomencounter :-
	random(1,256,Result),
	randomizer(Result).

/*randomizer(Result) for desert*/
randomizer(Result) :-
	letak_player(X,Y), 
	Result < 48,
	terrain(desert,X,Y),
	M = 'Armadillomon',
	battle(M),
	capture_menu(M),
	!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 48,
	Result < 96,
	terrain(desert,X,Y),
	M = 'GiantWormmon',
	battle(M),
	capture_menu(M),
	!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 96,
	Result < 144,
	terrain(desert,X,Y),
	M = 'Golemon',
	battle(M),
	capture_menu(M),
	!.
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 144,
	Result < 192,
	terrain(desert,X,Y),
	M = 'Gnomemon',
	battle(M),
	capture_menu(M),
	!.
/******************************************************/
/*randomizer(Result) for forest*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 48,
	terrain(forest,X,Y),
	M = 'Cactusmon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 48,
	Result < 96,
	terrain(forest,X,Y),
	M = 'Willowmon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 96,
	Result < 144,
	terrain(forest,X,Y),
	M = 'Vinemon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 144,
	Result < 180,
	terrain(forest,X,Y),
	M = 'Dryadmon',
	battle(M),
	capture_menu(M),
	!.
/******************************************************/
/*randomizer(Result) for wasteland*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 48,
	terrain(wasteland,X,Y),
	M = 'Spectermon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 48,
	Result < 96,
	terrain(wasteland,X,Y),
	M = 'Bansheemon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 96,
	Result < 144,
	terrain(wasteland,X,Y),
	M = 'Draugrmon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 144,
	Result < 192,
	terrain(wasteland,X,Y),
	M = 'GrimmHoundmon',
	battle(M),
	capture_menu(M),
	!.
/******************************************************/
/*randomizer(Result) for grassland*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 48,
	terrain(grassland,X,Y),
	M = 'MantaRaymon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 48,
	Result < 96,
	terrain(grassland,X,Y),
	M = 'GatorGatorGatormon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 96,
	Result < 144,
	terrain(grassland,X,Y),
	M = 'Orcamon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 144,
	Result < 180,
	terrain(grassland,X,Y),
	M = 'Undinemon',
	battle(M),
	capture_menu(M),
	!.	
/******************************************************/
/*randomizer(Result) for mountain*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 48,
	terrain(mountain,X,Y),
	M = 'Dragonflymon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 48,
	Result < 96,
	terrain(mountain,X,Y),
	M = 'Falconmon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 96,
	Result < 144,
	terrain(mountain,X,Y),
	M = 'GreatOwlmon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 144,
	Result < 180,
	terrain(mountain,X,Y),
	M = 'Slyphmon',
	battle(M),
	capture_menu(M),
	!.
/******************************************************/
/*randomizer(Result) for lava*/
randomizer(Result) :-
	letak_player(X,Y),
	Result < 48,
	terrain(lava,X,Y),
	M = 'Cobramon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 48,
	Result < 96,
	terrain(lava,X,Y),
	M = 'KomodoDragonmon',
	battle(M),
	capture_menu(M),
	!.

randomizer(Result) :-
	letak_player(X,Y),
	Result >= 96,
	Result < 144,
	terrain(lava,X,Y),
	M = 'Magmamon',
	battle(M),
	capture_menu(M),
	!.
	
randomizer(Result) :-
	letak_player(X,Y),
	Result >= 144,
	Result < 180,
	terrain(lava,X,Y),
	M = 'Salamandermon',
	battle(M),
	capture_menu(M),
	!.
/******************************************************/
/*randomizer(Result) safely*/
randomizer(Result) :-
	Result >= 192,
	letak_player(X,Y),
	terrain(_,X,Y),
	write('You have traveled safely.'),!.
