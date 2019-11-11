%% Setup : pick up monsta
%% means you can withdraw instantly to
pick(X):-
	in_battle(1),
	\+monsta(X),
	tab(3), write('Invalid monsta'),nl,!.
%% pick first monsta:
pick(X):-
	in_battle(1),
	curr_monsta(''),
	list_monsta(L),
	member(X,L),
	retract(curr_monsta(_)),
	asserta(curr_monsta(X)),
	tab(3), format('Lets go ~a',[X]),nl,
	retract(monsta_out(0)),
	asserta(monsta_out(1)),!.

%% switch to the current monsta 
pick(X):-
	in_battle(1),
	curr_monsta(X),
	write('You cannot switch to that monsta!'),nl,!.

%% switch of your monsta
pick(X):- 
	in_battle(1),
	monsta_out(1),
	list_monsta(L),
	member(X,L),
	\+retract(curr_monsta('')),
	retract(curr_monsta(_)),
	asserta(curr_monsta(X)),
	tab(3),write('Switched Monsta'),nl,!.

%% switch to the monsta you don't have
pick(_):-
	in_battle(1),
	write('You do not have that monsta as your slave'),nl.
