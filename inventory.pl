/* Bag - List of items that player has */
/* Counting Items */
%% Basis
countBag(_,_):- checkStart(1),!.
countBag([],0).
%% Rekurens
countBag([_|T],X):-
	countBag(T,X1),
	X is X1 + 1.

/* Searching Bag */
%% basis 
searchBag(_,_,_):- checkStart(1),!.
searchBag(_, [], B):-
	B = no, !.

%% Rekurens
%% apabila ditemukan
searchBag(H, [H|_], B):-
	B = yes, !.
%% apabila belum ditemukan
searchBag(X, [_|T], B):-
	searchBag(X, T, Btemp),
	B = Btemp.

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
	printBag(L),nl.

%% Basis bag kosong
printBag([]):-
	write('Tidak ada items di bag!'),nl,!.
%% Basis bag 
printBag([X]):-
	write('-> '),write(X),!.
printBag([X|T]):-
	write('-> '),write(X),nl,
	printBag(T).

/* Dropping items */
drop(_):-
	checkStart(0),
	write('Game has not started. Type "start." to start the game'),nl,!.
%% drop keyitems
drop(I):- 
	trace,
	player_bag(Bag),
	searchBag(I,Bag,yes),
	keyitems(I),
	write('Professor suddenly appear from the shadow!!!'),nl,
	write('Do not drop this item.'),nl,
	write('This item will be useful later on.'),nl,
	write('Professor suddenly gone'),nl,!.
%% drop inventory normal items
drop(I):-
	player_bag(Bag),
	searchBag(I,Bag,yes),
	letak_player(X,Y),
	delItem(I),
	asserta(letak_item(I,X,Y)),
	format('Kamu menjatuhkan ~a.',[I]),
	nl, !.
%% drop barang yang tidak dimiliki
drop(_):-
	write('You do not have this item!.'),
	nl, !.

/* Picking items - Picking items in the ground */
%% Jika game belum dijalankan
take:-
	checkStart(0),
	write('Game has not started. Type "start." to start the game'),nl,!.
%% buat yang ngecek jumlah items
%% Jika bag penuh
take:-
	letak_player(X,Y),
	letak_item(I,X,Y),
	player_bag(Bag),
	numItems(Z),
	Z > 10,
	write('Bag penuh!.'),nl,
	!.
%% Jika bag belum penuh
take:-
	letak_player(X,Y),
	letak_item(I,X,Y),
	retract(letak_item(I,X,Y)),
	addBag(I),
	format('Get ~a!!',[I]),nl,
	!.
%% Jika tidak ada item yang bisa diambil
take:-
	write('There are no items here.'),
	nl. 





