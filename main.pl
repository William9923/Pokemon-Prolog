:- dynamic(letak_item/3, 
		letak_player/2,
		list_monsta/1,
		monsta_owned/1,
		monsta_owned_health/2,
		player_bag/1, 
		checkStart/1,
		checkGym/1,
		letak_item/3
		).


/*Importing other files*/
:- include(monsta).
:- include(map).
:- include(inventory).
:- include(status).
:- include(random).
:- include(gym).
:- include(start).
:- include(battle).
:- include(move).


:- initialization(nl).
:- initialization(write('Type "start." to start the game!')).
:- initialization(nl).

%% Initialize the start game state
checkStart(0).
checkGym(0).

/* Player starting position */
%% player current position, initial : (11,3)
letak_player(10,10).

/* Player Monsta*/
list_monsta(['Dragonflymon']).
monsta_owned('Dragonflymon').
monsta_owned_health('Dragonflymon',60).
monsta_owned_attack('Dragonflymon', 40).
monsta_owned_defense('Dragonflymon', 100).
monsta_owned_special_attack_name('Dragonflymon', 'Dragon Swarm').
monsta_owned_special_attack('Dragonflymon', 40).
monsta_owned_speed('Dragonflymon', 100).
monsta_owned_affinity_type('Dragonflymon', leaves).

/* Counting Items */
%% Basis
countMonsta(_,_):- checkStart(1),!.
countMonsta([],0).
%% Rekurens
countMonsta([_|T],X):-
	countMonsta(T,X1),
	X is X1 + 1.


%% gym location : (8,5)
gym(8,5).

/* Dummy Items */
letak_item(panadol, 3 ,3).
letak_item(minimap, 5,5).

keyitems(minimap).
keyitems(panadol).

/* Bag Items */
%% player_bag([]).
%% Dummy Bag Items
player_bag([panadol, manisan, asinan]).

/* Map size */
edge([1,11],[1,11]). %Map size;
edgeOffset([X1,X2],[Y1,Y2]) :- 
	edge([XEdge1,XEdge2],[YEdge1,YEdge2]),
	X1 is XEdge1-1, X2 is XEdge2+1,
	Y1 is YEdge1-1, Y2 is YEdge2+1.

/*****************************************/
/*Initializing an initial map condition*/
terrain(forest,1,1).
terrain(forest,2,1).
terrain(forest,3,1).
terrain(forest,4,1).
terrain(wasteland,5,1).
terrain(wasteland,6,1).
terrain(wasteland,7,1).
terrain(wasteland,8,1).
terrain(wasteland,9,1).
terrain(wasteland,10,1).
terrain(wasteland,11,1).
terrain(river,1,2).
terrain(river,2,2).
terrain(river,3,2).
terrain(grassland,4,2).
terrain(river,5,2).
terrain(wasteland,6,2).
terrain(wasteland,7,2).
terrain(desert,8,2).
terrain(desert,9,2).
terrain(desert,10,2).
terrain(wasteland,11,2).
terrain(forest,1,3).
terrain(forest,2,3).
terrain(forest,3,3).
terrain(forest,4,3).
terrain(river,5,3).
terrain(wasteland,6,3).
terrain(wasteland,7,3).
terrain(desert,8,3).
terrain(desert,9,3).
terrain(desert,10,3).
terrain(wasteland,11,3).
terrain(forest,1,4).
terrain(forest,2,4).
terrain(forest,3,4).
terrain(forest,4,4).
terrain(river,5,4).
terrain(wasteland,6,4).
terrain(block,7,4).
terrain(desert,8,4).
terrain(desert,9,4).
terrain(desert,10,4).
terrain(wasteland,11,4).
terrain(forest,1,5).
terrain(forest,2,5).
terrain(forest,3,5).
terrain(forest,4,5).
terrain(river,5,5).
terrain(wasteland,6,5).
terrain(wasteland,7,5).
terrain(wasteland,8,5).
terrain(wasteland,9,5).
terrain(wasteland,10,5).
terrain(wasteland,11,5).
terrain(forest,1,6).
terrain(forest,2,6).
terrain(forest,3,6).
terrain(forest,4,6).
terrain(river,5,6).
terrain(river,6,6).
terrain(river,7,6).
terrain(grassland,8,6).
terrain(grassland,9,6).
terrain(wasteland,10,6).
terrain(wasteland,11,6).
terrain(forest,1,7).
terrain(forest,2,7).
terrain(forest,3,7).
terrain(forest,4,7).
terrain(river,5,7).
terrain(river,6,7).
terrain(river,7,7).
terrain(grassland,8,7).
terrain(grassland,9,7).
terrain(wasteland,10,7).
terrain(wasteland,11,7).
terrain(forest,1,8).
terrain(forest,2,8).
terrain(forest,3,8).
terrain(forest,4,8).
terrain(grassland,5,8).
terrain(grassland,6,8).
terrain(gym,7,8).
terrain(grassland,8,8).
terrain(grassland,9,8).
terrain(grassland,10,8).
terrain(grassland,11,8).
terrain(mountain,1,9).
terrain(mountain,2,9).
terrain(mountain,3,9).
terrain(mountain,4,9).
terrain(river,5,9).
terrain(river,6,9).
terrain(river,7,9).
terrain(grassland,8,9).
terrain(grassland,9,9).
terrain(grassland,10,9).
terrain(grassland,11,9).
terrain(lava,1,10).
terrain(lava,2,10).
terrain(mountain,3,10).
terrain(mountain,4,10).
terrain(mountain,5,10).
terrain(mountain,6,10).
terrain(mountain,7,10).
terrain(mountain,8,10).
terrain(grassland,9,10).
terrain(home,10,10).
terrain(grassland,11,10).
terrain(lava,1,11).
terrain(lava,2,11).
terrain(lava,3,11).
terrain(mountain,4,11).
terrain(mountain,5,11).
terrain(mountain,6,11).
terrain(mountain,7,11).
terrain(mountain,8,11).
terrain(grassland,9,11).
terrain(grassland,10,11).
terrain(grassland,11,11).

/***** PLAYER'S Tokeomon ALIVE/DEATH STATE *****/


/* Game over */
die :- 
	write('The monsta eats your leg'), nl,
	write('You suddenly lost your feel in your chest'), nl,
	write('You take your last breath'), nl,
	write('You DIED - Game Over'),nl,
	write('Then you realized that you are in a dream'),nl,
	quit, abort.

/* Win Games - catch 2 legendary*/
win :- 
	nl,
	write('You have collected 2 most powerful tokemon in the whole universe'), nl,
	write('But, then you realized that all tokemon is actually really good'),nl,
	write('You were manipulated by the evil professor to capture all this good creature'),nl,
	write('Using those 2 legendary tokemon, you destroy the professor and all his creation'), nl,
	write('From now on, you will protect the safety of all tokemon'), nl,
	write('THE END'),
	retract(checkStart(1)),
	asserta(checkStart(0)),
	abort.

/* Quitting games*/
quit:-
	checkStart(1),
	retract(checkStart(1)),
	asserta(checkStart(0)),
	write('You have quitted from the monsta great world.'),nl,
	write('Welcome to the normal world again'), nl.
quit:- 
	write('Game belum dimulai. Ketik "start." untuk memulai game.'),nl.



































