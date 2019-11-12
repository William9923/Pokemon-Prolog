heal :- 
	checkStart(0),
	write('You have not start the game!'),nl,!.

heal :- 
	letak_player(X,Y),
	gym(U,W),
	(X =\= U; Y =\= W),
	write('You were not in the gym! Please go to the gym to heal your monsta!'),nl,!.

heal :- 
	checkGym(1),
	write('You cannot heal again!! Please defeat the legendary monsta first!!'),nl,!.

heal :-
	list_monsta(L),
	write('Please wait for a minute!!'),nl,
	heal_monsta(L),
	write('Thank you for waiting, all your monsta have been healed!!'),nl,
	retract(checkGym(0)),
	asserta(checkGym(1)),!.
/* 'This will only take a minute.' */
/* 'A minute later...' */
/* 'Your monstas have been healed!' */
%% Basis
heal_monsta([]).
%% Rekurens
heal_monsta([H|T]):-
	heal_monsta(T),
	retract(monsta_owned_health(H,_)),
	monsta_health(H,Health),
	asserta(monsta_owned_health(H,Health)).

/*
	Basis ide:
	-> Perintah heal diketik
	-> Perintah untuk melakukan heal untuk setiap monsta secara rekursif
	-> Heal dilakukan dengan mengambil fakta health monsta sekarang
	-> dan menggantikannya dengan full health dari monsta tersebut.
*/