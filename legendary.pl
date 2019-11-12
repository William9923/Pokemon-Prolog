call_legendary :-
	checkStart(0),!.

call_legendary:-
	checkStart(1),
	legendary_to_beat(Z),
	Z =:= 3,
	M = 'Legendary GreatForestmon',	
	battle(M),nl,
	dialog1,balik_basecamp,
	retract(checkGym(_)),
	asserta(checkGym(0)),!.

call_legendary:-
	checkStart(1),
	legendary_to_beat(Z),
	Z =:= 2,
	M = 'Legendary CrimsonDragonmon',
	battle(M),nl,
	dialog2,balik_basecamp,
	retract(checkGym(_)),
	asserta(checkGym(0)),!.

call_legendary:-
	checkStart(1),
	legendary_to_beat(Z),
	Z =:= 1,
	M = 'Legendary AzureSharkmon',
	battle(M),nl,
	dialog3,
	win,!.

	
call_legendary:-
	write('Error').


balik_basecamp :-
	terrain(home,X,Y),
	retract(letak_player(_,_)),
	asserta(letak_player(X,Y)).



dialog1 :-
	write('defeat 1'),nl.

dialog2:-
	write('defeat 2'),nl.

dialog3:-
	write('defeat 3'),nl.