/* Bag - List of items that player has */

/* Menambahkan barang ke bag */
addBag(_) :- checkStart(1),!.
addBag(Item):-
	player_bag(L),
	append([Item], L, LNew),
	retract(player_bag(L)),
	asserta(player_bag(LNew)).

/* Menghapus item dari inventory */
delItem(Item):-
	player_bag(L),
	delFromBag(Item, L, LNew),
	retract(player_bag(L)),
	asserta(player_bag(LNew)).

%% Basis
delFromBag(_,[],[]).
%% Basis -- ketika item telah ditemukan 
delFromBag(Item, [Item|T], NewL):-
	NewL = T, !.
%% Rekurens -- ketika item belum ditemukan dan belum selesai diperiksa seluruhnya
delFromBag(Item, [H|T], NewL):-
	delFromBag(Item, T, LTail),
	append([H], LTail, NewL).

/* Print Isi Bag */
bag:-
	checkStart(0),
	write('Game has not started. Type "start." to start the game'),nl,!.
bag :- 
	player_bag(L),
	write('Bags :'),nl,
	printBag(L),
	tab(3),whiteLilyPerfumeC(Y),write(Y),write('X'),nl.

%% Basis bag kosong
printBag([]):-
	write('No Items!'),nl,!.
%% Basis bag 
printBag([X]):-
	write('-> '),write(X),
	!.
printBag([X|T]):-
	write('-> '),write(X),
	printBag(T).






