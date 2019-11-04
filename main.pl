:- dynamic(di/3, 
		letak_player/2, 
		player/3, 
		pinventory/2, 
		checkStart/1).


/*Importing other files*/
:- include(command).
:- include(tokemon).
:- include(map).
:- include(list).
:- include(inventory).
:- include(status).
:- include(start).
:- include(use).
:- include(random).
:- include(text).
:- include(skill).
:- include(modifier).
:- include(fail).
:- include(gym).
:- include(goal).

:- initialization(nl).
:- initialization(write('Write "start." to start the game!')).
:- initialization(nl).

%% Initialize the start game state
checkStart(0).

%% :- initialization(write('Write "load_game(''filename.pl'')" to load previous saved game!')).

/* Check if the game has started or not*/


/* Player starting position */
%% letak_player(1,1).

%% /* Map size */
%% edge([0,11], [0,11]).
%% edgeOffset([X1,X2],[Y1,Y2]):-
%% 	edge([XEdge1, XEdge2], [YEdge1,YEdge2]),
%% 	X1 is XEdge1 - 2, X2 is XEdge2+2,
%% 	Y1 is YEdge1 - 2, Y2.

/** Describe for START and LOOK **/

/***** PLAYER'S Tokeomon ALIVE/DEATH STATE *****/


/* Game over */
%% die :- 
%% 	write('The tokemon eats your leg'), nl,
%% 	write('You suddenly lost your feel in your chest'), nl,
%% 	write('You take your last breath'), nl,
%% 	write('You DIED - Game Over'),nl,
%% 	quit, abort.

%% /* Win Games - catch 2 legendary*/
%% win2 :- 
%% 	nl,
%% 	write('You have collected 2 most powerful tokemon in the whole universe'), nl,
%% 	write('But, then you realized that all tokemon is actually really good'),nl,
%% 	write('You were manipulated by the evil professor to capture all this good creature'),nl,
%% 	write('Using those 2 legendary tokemon, you destroy the professor and all his creation'), nl,
%% 	write('From now on, you will protect the safety of all tokemon'), nl,
%% 	write('THE END'),
%% 	retract(checkStart(1)),
%% 	asserta(checkStart(0)),
%% 	abort.

/* Quitting games*/
quit:-
	checkStart(1),
	retract(checkStart(1)),
	asserta(checkStart(0)),
	write('You have quitted from the tokemon great world.'),nl,
	write('Welcome to the normal world again'), nl.
quit:- 
	write("You haven't started the game yet"),nl.



































