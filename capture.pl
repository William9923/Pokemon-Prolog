%% failed capture :  Too much monsta
capture:-
	numMonsta(X),
	X >= 6,
	write('You have too much monsta with you already!! Please drop your monsta first.'),nl,!.

%% cancel capture if you already have that monsta 
capture:-
	enemy_monsta(M),
	list_monsta(L),
	member(M,L),
	format('~a will sad if you abondon it and capture another monsta!', [M]),nl,!.

%% capturing legendary monsta 
capture :- 
	enemy_monsta(M),
	member(M,['Legendary EmeraldHawkmon','Legendary CrimsonDragonmon','Legendary GreatForestmon']),
	list_monsta(L),
	enemy_monsta(M),
	monsta_health(M,Health),
	append(L,[M],LNew),
	retract(list_monsta(L)),
	asserta(list_monsta(LNew)),
	asserta(monsta_owned(M)),
 	asserta(monsta_owned_health(M,Health)),
	format('Congratulation, you have successfully make ~a as your monsta!! Powerful allies is on your side. Nobody can stop you now.', [M]),nl,
	numMonsta(X),
	X1 is X + 1,
	retract(numMonsta(_)),
	asserta(numMonsta(X1)),
	!.

%% capturing normal_monsta
capture :- 
	enemy_monsta(M),
	\+member(M,['Legendary EmeraldHawkmon','Legendary CrimsonDragonmon','Legendary GreatForestmon']),
	list_monsta(L),
	enemy_monsta(M),
	monsta_health(M,Health),
	append(L,[M],LNew),
	retract(list_monsta(L)),
	asserta(list_monsta(LNew)),
	asserta(monsta_owned(M)),
	asserta(monsta_owned_health(M,Health)),
	format('Congratulation, you have successfully make ~a your slave!!', [M]),nl,
	numMonsta(X),
	X1 is X + 1,
	retract(numMonsta(_)),
	asserta(numMonsta(X1)),
	!.

capture_inst(capture).

capture_user_in(X):-
	\+capture_inst(X).

capture_user_in(X):-
	capture_inst(X),X.

capture_menu(M):-
	asserta(enemy_monsta(M)),
	format(' ~a faints! Do you want to capture ~a?',[M,M]),nl,
	format(' (capture/0 to capture ~a, otherwise use any other key.)',[M]),nl,
	write('->'),read(X),capture_user_in(X).
