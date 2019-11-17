call_legendary :-
	checkStart(0),!.

call_legendary:-
	checkStart(1),
	legendary_to_beat(Z),
	Z =:= 3,
	M = 'Legendary GreatForestmon',
	asserta(vs_legend),
	battle(M),nl,
	capture_menu(M),
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
	capture_menu(M),
	dialog2,balik_basecamp,
	retract(checkGym(_)),
	asserta(checkGym(0)),
	retract(cave(_,_)),
	asserta(cave(10,7)),
	retract(vs_legend),!.

call_legendary:-
	checkStart(1),
	legendary_to_beat(Z),
	Z =:= 1,
	M = 'Legendary AzureSharkmon',
	asserta(vs_legend),
	battle(M),nl,
	capture_menu(M),
	dialog3,balik_basecamp,
	retract(cave(_,_)),
	asserta(cave(11,14)),
	retract(vs_legend),
	win,!.

	
call_legendary:-
	write('Error').


balik_basecamp :-
	terrain(home,X,Y),
	retract(letak_player(_,_)),
	asserta(letak_player(X,Y)).



dialog1 :-
	write('Y---you are strong! But in order to find the answer, you have the other 3 legendary monsta'),nl.

dialog2:-
	write('You have defeated me! I will give a piece of your memory. But remember, you will find the truth and it is not good!'),nl.

dialog3:-
	write('You are strong. Really strong. Now I will give all my power and PLEASE DEFEAT SUGIONO!'),nl.