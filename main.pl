%% ini dynamic siapa yang rubah, gw bunuh lu pada ngehe!!
:- dynamic(letak_item/3, 
		letak_player/2,
		list_monsta/1,
		monsta_owned/1,
		monsta_owned_health/2,
		player_bag/1, 
		checkStart/1,
		checkGym/1,
		numMonsta/1,
		numItems/1,
		enemy_monsta/1,
		curr_monsta/1,
		enemy_monsta_health/2,
		in_battle/1,
		monsta_out/1,
		special_out/1,
		legendary_to_beat/1
		).


/*Importing other files*/
:- include(monsta).
:- include(map).
:- include(inventory).
:- include(status).
:- include(random).
:- include(gym).
:- include(start).
:- include(enemy).
:- include(pick).
:- include(run).
:- include(capture).
:- include(status).
:- include(attack).
:- include(battle).
:- include(move).
:- include(use).
:- include(affinity).



:- initialization(nl).
:- initialization(write('Type "start." to start the game!')).
:- initialization(nl).
/* 'Type "start" to begin' */


%% Initialize the start game state
checkStart(0).
checkGym(0).
legendary_to_beat(3).
%% Initial value
in_battle(0).
monsta_out(0).
special_out(0).
enemy_monsta('').
enemy_monsta_health('',0).
curr_monsta('').
numMonsta(1).
numItems(1).


/* Player starting position */
%% player current position, initial : (11,3)
letak_player(10,10).

/* Player First Monsta*/
list_monsta(['Dragonflymon']).
monsta_owned('Dragonflymon').
monsta_owned_health('Dragonflymon',30).

%% gym location : (8,5)
gym(8,5).

/* Dummy Items */
letak_item(panadol, 3 ,3).
letak_item(minimap, 5,5).
letak_item(monstaCage_S, 1 ,11).
letak_item(whiteLilyperfume, 6,10).
letak_item(permenyuvi,3,11).
letak_item(panahApatis,1,4).
letak_item(sugionoBalls,11,11).
letak_item(snickaxs,7,5).
letak_item(pilSemangatTerbaik,8,1).
letak_item(susuKmen,10,1).

keyitems(monstaCage_S).
keyitems(whiteLilyPerfume).
keyitems(permenyuvi).
keyitems(panahApatis).
keyitems(sugionoBalls).
keyitems(snickaxs).
keyitems(pilSemangatTerbaik).
keyitems(susuKmen).


/* initializing items and count item */
monstaCage_S(0).
whiteLilyPerfumeC(3).
permenyuviC(0).
panahApatisC(0).
sugionoBallsC(0).
snickaxsC(0).
pilSemangatTerbaikC(0).
susuKmenC(0).

/* Bag Items */
%% player_bag([]).
%% Dummy Bag Items
player_bag([whiteLilyPerfume]).

/* Map size */
edge([1,11],[1,11]). %Map size;
edgeOffset([X1,X2],[Y1,Y2]) :- 
	edge([XEdge1,XEdge2],[YEdge1,YEdge2]),
	X1 is XEdge1-1, X2 is XEdge2+1,
	Y1 is YEdge1-1, Y2 is YEdge2+1.

/* Drop monsta */
%% if only 1 monsta owned
drop_monsta(_) :-
	numMonsta(1),
	write('You cannot release your last monsta.'),nl,!.
%% do not have that monsta
drop_monsta(M):-
	\+monsta_owned(M),
	write('You do not have that monsta.'),nl,!.
%% bisa delete monsta
drop_monsta(M):-
	format('You have release ~a',[M]),nl,
	list_monsta(L),
	numMonsta(X),
	X1 is X - 1,
	delete(L,M,NewL),
	retract(list_monsta(L)),
	asserta(list_monsta(NewL)),
	retract(monsta_owned(M)),
	retract(monsta_owned_health(M,_)),
	retract(numMonsta(X)),
	asserta(numMonsta(X1)).

/***** PLAYER'S Tokeomon ALIVE/DEATH STATE *****/
/* Game over */
die :- 
	write('The monsta eats your leg'), nl,
	write('You suddenly lost your feel in your chest'), nl,
	write('You take your last breath'), nl,
	write('You DIED - Game Over'),nl,
	write('Then you realized that you are in a dream'),nl,
	quit, abort.
/* 'The monsta eats your legs' */
/* 'You suddenly lose all feeling in your chest and breathe your last breath.' */
/* 'YOU DIED - GAME OVER' */

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
/* 'You have collected two of the most powerful monstas in the world' */
/* 'But then, you realized that monstas aren't actually as bad as you were led to believe' */
/* 'You were manipulated by the professor to capture these creatures' */
/* 'Using the power of the Legendaries, you manage to defeat the professor' */
/* 'From now on, you will protect the monstas' */
/* 'THE END' */

/* Quitting games*/
quit:-
	checkStart(1),
	retract(checkStart(1)),
	asserta(checkStart(0)),
	write('You have quitted from the monsta great world.'),nl,
	write('Welcome to the normal world again'), nl,
    !.
quit:- 
	write('Game belum dimulai. Ketik "start." untuk memulai game.'),nl.
/* 'You have left the great MonstaWorld' */
/* 'Welcome back to regular reality' */

/* 'The game hasn't even started yet, type "start" to begin' */