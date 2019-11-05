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
bag :- 
	player_bag(L),
	printBag(L).

%% Basis bag kosong
printBag([]):-
	tab(5), write('Tidak ada items di bag!'),!.
%% Basis bag 
printBag([X]):-
	tab(5), write(X),!.
printBag([X|T]):-
	tab(5), write(X),nl,
	printBag(T).

/* Dropping items */
drop(_):-
	checkStart(0),
	write('Game belum dimulai. Ketik "start." untuk memulai game.'),nl,!.
%% drop keyitems
drop(I):- 
	player_bag(Bag),
	searchBag(I,Bag,yes),
	keyitems(I),
	write('Professor muncul dari bayanganku!!!'),nl,
	write('Janganlah membuang item ini.'),nl,
	write('Item ini akan berguna untukmu.'),nl,
	write('Professor pun lenyap'),nl,!.
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
	write('Kamu tidak memiliki items ini!.'),
	nl, !.

/* Picking items - Picking items in the ground */
%% Jika game belum dijalankan
pick(_):-
	checkStart(0),
	write('Game belum dimulai. Ketik "start." untuk memulai game.'),nl,!.
%% buat yang ngecek jumlah items
%% Jika bag penuh
pick(_):-
	player_bag(Bag),
	countBag(Bag, X),
	write(X),
	write('Bag penuh!.'),nl,
	!.
%% Jika bag belum penuh
pick(I):-
	letak_player(X,Y),
	letak_item(I,X,Y),
	retract(letak_item(I,X,Y)),
	addBag(I),
	format('Mendapatkan ~a.',[I]),nl,
	!.
%% Jika tidak ada item yang bisa diambil
pick(_):-
	write('Tidak ada item yang bisa diambil disini.'),
	nl. 

/* Items Usage */




