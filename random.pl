/*randomencounter for desert*/
randomencounter :-
	letak_player(X,Y), 
	random(1,256,Result),
	Result < 64,
	terrain(desert,X,Y),
	write('You have encountered tokemondesert01.'),nl,!.
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result),
	Result >= 64,
	Result < 128,
	terrain(desert,X,Y),
	write('You have encountered tokemondesert02.'),nl, !.
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result),
	Result >= 128,
	Result < 192,
	terrain(desert,X,Y),
	write('You have encountered tokemondesert03.'),nl, !.

/******************************************************/
/*randomencounter for forest*/
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result),
	Result < 64,
	terrain(forest,X,Y),
	write('You have encountered tokemonforest01.'),nl,!.
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result),
	Result >= 64,
	Result < 128,
	terrain(forest,X,Y),
	write('You have encountered tokemondforest02.'),nl, !.
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result),
	Result >= 128,
	Result < 192,
	terrain(forest,X,Y),
	write('You have encountered tokemondforest03.'),nl, !.
/******************************************************/
/*randomencounter for wasteland*/
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result),
	Result < 64,
	terrain(wasteland,X,Y),
	write('You have encountered tokemonwasteland01.'),nl,!.
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result), 
	Result >= 64,
	Result < 128,
	terrain(wasteland,X,Y),
	write('You have encountered tokemondwasteland02.'),nl, !.
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result), 
	Result >= 128,
	Result < 192,
	terrain(wasteland,X,Y),
	write('You have encountered tokemondwasteland03.'),nl, !.
/******************************************************/
/*randomencounter for grassland*/
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result), 
	Result < 64,
	terrain(grassland,X,Y),
	write('You have encountered tokemongrassland01.'),nl,!.
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result), 
	Result >= 64,
	Result < 128,
	terrain(grassland,X,Y),
	write('You have encountered tokemondgrassland02.'),nl, !.
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result),
	Result >= 128,
	Result < 192,
	terrain(grassland,X,Y),
	write('You have encountered tokemondgrassland03.'),nl, !.
/******************************************************/
/*randomencounter for mountain*/
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result),
	Result < 64,
	terrain(mountain,X,Y),
	write('You have encountered tokemonmountain01.'),nl,!.
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result),
	Result >= 64,
	Result < 128,
	terrain(mountain,X,Y),
	write('You have encountered tokemonmountain02.'),nl, !.
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result), 
	Result >= 128,
	Result < 192,
	terrain(mountain,X,Y),
	write('You have encountered tokemondountain03.'),nl, !.
/******************************************************/
/*randomencounter for lava*/
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result),
	Result < 64,
	terrain(lava,X,Y),
	write('You have encountered tokemonlava01.'),nl,!.
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result),
	Result >= 64,
	Result < 128,
	terrain(lava,X,Y),
	write('You have encountered tokemonlava02.'),nl, !.
randomencounter :-
	letak_player(X,Y),
	random(1,256,Result),
	Result >= 128,
	Result < 192,
	terrain(lava,X,Y),
	write('You have encountered tokemonlava03.'),nl, !.
/******************************************************/
/*randomencounter safely*/
randomencounter :-
	letak_player(X,Y),
	terrain(_,X,Y),
	write('You have traveled safely.'),nl, !.

