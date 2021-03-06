%% Setup : pick up monsta
%% means you can withdraw instantly to
pick(X):-
	in_battle(1),
	\+monsta(X),
	write('Invalid monsta'),nl,!.
%% pick first monsta:
pick(X):-
	in_battle(1),
	curr_monsta(''),
	list_monsta(L),
	member(X,L),
	retract(curr_monsta(_)),
	asserta(curr_monsta(X)),
	format('Lets go ~a',[X]),nl,
	retract(monsta_out(0)),
	asserta(monsta_out(1)),!.

%% switch to the current monsta 
pick(X):-
	in_battle(1),
	curr_monsta(X),
	write('You cannot switch to that monsta!'),nl,!.
/* 'You are already using that monsta!' */

%% switch of your monsta
pick(X):- 
	in_battle(1),
	monsta_out(1),
	list_monsta(L),
	member(X,L),
	\+retract(curr_monsta('')),
	retract(curr_monsta(_)),
	asserta(curr_monsta(X)),
	write('Switched Monsta'),nl,!.

%% switch to the monsta you dont have
pick(_):-
	in_battle(1),
	write('You do not have that monsta as your slave'),nl.
/* 'You do not have that monsta!' */