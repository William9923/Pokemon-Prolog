inst(quit).
inst(help).
inst(w).
inst(s).
inst(d).
inst(a).
inst(map).
inst(take).
inst(drop(_)).
inst(drop_monsta(_)).
inst(use(_)).
inst(status).
inst(bag).

/* Start Game Function */
%% if game has already started
start:- 
	checkStart(1),
	write('You have started Monsta a long time ago. Quit the game to exit the game.'),nl.
%% if game hasnt started yet
start:-
	checkStart(0),
	retract(checkStart(0)),
	asserta(checkStart(1)),
	start_commands, nl,
	help, nl, nl,
	start_menu.
	
%% Basic game menu
start_menu:-
	repeat,
	write('> '),
	read(Ins),
	user_in(Ins),nl,
	Ins = quit.


/* Fungsi Validasi Inputan Awal Pemain*/
user_in(X):-
	\+inst(X),
	write('Invalid user inputs! Type "help." to see through available commands!'), nl.

%% if validated and able to run
user_in(X):-
	inst(X),
	X.

/* Prosedur Pemanggilan Menu Utama Games */
start_commands:-
	write('MonstaWorld'),nl,
	write('Welcome to this monster battling games'),nl,
	write('This is an adventure game, writen in prolog programming languange.'),nl,
	write('The purpose of this game is to kill the 2 legendary Monsta and get your memory back!'),nl.

help :-
	write('Please enter the command below using Prolog syntax'),nl,
	write('Available commands are       :'),nl,
	write(' start.                      : to start the MonstaWorld game.'),nl,
	write(' help.                       : to see the MonstaWorld in-game available commands.'),nl,
	write(' quit.                       : to exit from the game.'),nl,
	write(' w.,s.,a.,d.                 : to move player based on the wind direction.'),nl,
	write(' map.                        : to print the map of MonstaWorld'),nl,
	write(' take.                       : untuk mengambil items yang ada di lantai posisi pemain'),nl,
	write(' drop_monsta(monsta)         : untuk melepaskan monsta ke dunia MonstaWorld kembali.'),nl,
	write(' drop(item).                 : untuk melakukan drop items'),nl,
	write(' use(item).                  : untuk memakai item yang ada di inventory'),nl,
	write(' bag.                        : untuk melihat isi inventory/bag pemain'),nl,
	write(' status_all.                 : untuk melihat semua status monsta yang dimiliki pemain'),nl,
	nl,nl,
	write('Legends:'), nl,
    write('Player   : P'), nl,
	write('Gym      : G'), nl,
    write('Item     : I'), nl,
    write('Cave     : C'), nl,
    write('River    : R'), nl.