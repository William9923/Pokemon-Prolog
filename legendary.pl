call_legendary :-
	checkStart(0),!.

call_legendary:-
	checkStart(1),
	legendary_to_beat(Z),
	Z =:= 3,
	M = 'Legendary GreatForestmon',
	asserta(vs_legend),
	battle(M),nl,
	dialog1,balik_basecamp,
	retract(checkGym(_)),
	asserta(checkGym(0)),
	retract(cave(_,_)),
	asserta(cave(5,12)),
	retract(vs_legend),!.

call_legendary:-
	checkStart(1),
	legendary_to_beat(Z),
	Z =:= 2,
	M = 'Legendary CrimsonDragonmon',
	asserta(vs_legend),
	battle(M),nl,
	dialog2,balik_basecamp,
	retract(checkGym(_)),
	asserta(checkGym(0)),
	retract(cave(_,_)),
	asserta(cave(4,4)),
	retract(vs_legend),!.

call_legendary:-
	checkStart(1),
	legendary_to_beat(Z),
	Z =:= 1,
	M = 'Legendary AzureSharkmon',
	asserta(vs_legend),
	battle(M),nl,
	dialog3,balik_basecamp,
	retract(cave(_,_)),
	asserta(cave(18,17)),
	retract(vs_legend),
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