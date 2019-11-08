heal :-
	list_monsta(L),
	write('Please wait for a minute!!'),nl,
	heal_monsta(L),
	write('Thank you for waiting, all your monsta have been healed!!').

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