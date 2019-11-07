/* Available instruction */
battle_inst(attack).
battle_inst(special_attack).
battle_inst(withdraw).
battle_inst(run).
battle_inst(fight).


battle(_):-
	checkStart(0),
	write('Game has not started. Type "start." to start the game.'),nl,
	!.
%% nanti implementasiin nama musuh jg.
battle(X) :-
	write('Entering battle phase'),nl,
	format('A wild ~a has appeared !!',[X]), nl,
	list_monsta(L),
	get_first_monsta(L,Y),
	format('Go ~a!!',[Y]),nl,
	battle_menu,
	nl.

battle_menu:-
	tab(1), write('What are you gonna do? (Type with Prolog syntax)'),nl,
	write('>'),tab(3), write('fight.'),nl,
	write('>'),tab(3), write('run.'),nl.


%% showMonsta([H|T],H):-
	



%% fight :-
	


/* Validate battle commands */
battle_user_in(X):-
	\+battle_inst(X),
	write('Invalid battle commands. Please try again!'),nl.

battle_user_in(X):-
	battle_inst(X),
	X.







