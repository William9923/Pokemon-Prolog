inst(die).
inst(quit).
inst(help).
inst(look).
inst(w).
inst(s).
inst(d).
inst(a).
inst(map).
inst(pick(_)).
inst(drop(_)).
inst(drop_monsta(_)).
inst(use(_)).
inst(attack).
inst(status).
inst(bag).
%% inst(save_game(_)).

/* Start Game Function */
start:- 
	checkStart(1),
	write('You have started Monsta along time ago. Quit to restart the game.').
start:-
	checkStart(0),
	retract(checkStart(0)),
	asserta(checkStart(1)),
	start_commands, nl,
	help, nl, nl,
	repeat,
	write('>'),
	read(Ins),
	user_in(Ins),nl,
	Ins = quit.


/* Fungsi Validasi Inputan Awal Pemain*/
user_in(X):-
	\+inst(X),
	write('Masukkan salah!. Silahkan diulangi'), nl.

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
	write('Masukkan perintah - perintah berikut dengan syntax prolog'),nl,
	write('Command yang tersedia adalah :'),nl,
	write(' start.                      : untuk memulai game Monsta'),nl,
	write(' help.                       : untuk melihat bantuan perintah pada game Monsta'),nl,
	write(' quit.                       : untuk keluar dari game.'),nl,
	write(' w.,s.,a.,d.                 : untuk menggerakkan pemain sesuai arah mata angin'),nl,
	write(' map.                        : untuk mencetak peta / minimap MonstaWorld'),nl,
	write(' pick(item).                 : untuk mengambil items yang ada di lantai posisi pemain'),nl,
	write(' drop(item).                 : untuk melakukan drop items'),nl,
	write(' use(item).                  : untuk memakai item yang ada di inventory'),nl,
	write(' bag.                        : untuk melihat isi inventory/bag pemain'),nl,
	write(' status(monsta).             : untuk melihat status monsta yang dimiliki pemain'),nl,
	nl,nl,
	write('Legends:'), nl,
    write('Player   : P'), nl,
	write('Gym      : G'), nl,
    write('Item     : I'), nl,
    write('Cave     : C'), nl,
    write('Tree     : T'), nl.

help_battle :-
	write('Perintah saat dalam battle:'),nl,
	write(' attack.                     : monsta yang sedang bertarung akan melakukan normal attack'),nl,
	write(' withdraw.                   : mengembalikan monsta yang sedang bertarung dan menggantikannya dengan monsta lain yang dimiliki'),nl,
	write(' run.                        : lari dalam pertarungan. Cat : persentase lari sangatlah kecil'),nl,
	write(' special_attack.             : menggunakan special attack dari monsta yang ada.'),nl.

