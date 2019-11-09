%% show status (temporary, for debugging purpose)
status :-
	enemy_monsta(X),
	enemy_monsta_health(X,EHealth),
	curr_monsta(Y),
	monsta_owned_health(Y,Health),
	tab(3),format('Your monsta health ~d',[Health]),nl,
	tab(3),format('Your opponent health ~d', [EHealth]),nl.

