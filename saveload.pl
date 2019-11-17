/* Save game */
save_game(_) :-
	checkStart(0),
	write('Game has not started. Type "start." to start the game.'),!.

save_game(File):-
	open(File, write, Stream),
	\+ loop_write(Stream),
	close(Stream),
	format('Your game has been saved to ~a', [File]),nl.

/* Letak player */
loop_write(Stream) :-
	letak_player(X,Y),
	write(Stream, letak_player(X,Y)), write(Stream, '.'),
	nl(Stream),
	fail.

/* Jumlah legendary yang perlu dikalahkan */
loop_write(Stream) :- 
	legendary_to_beat(X),
	write(Stream,legendary_to_beat(X)), write(Stream, '.'),
	nl(Stream),
	fail.
/*List monster*/
loop_write(Stream):-
	list_monsta(L),
	write(Stream, list_monsta(L)), write(Stream, '.'),
	nl(Stream),
	fail.

/* Monsta yang dimiliki saat save */
loop_write(Stream) :-
	monsta_owned(X),
	write(Stream, monsta_owned(X)), write(Stream, '.'),
	nl(Stream),
	fail.

/* Health Monsta saat itu */
loop_write(Stream) :-
	monsta_owned_health(X,Y),
	write(Stream, monsta_owned_health(X,Y)), write(Stream, '.'),
	nl(Stream),
	fail.

loop_write(Stream) :-
	numMonsta(X),
	write(Stream, numMonsta(X)), write(Stream, '.'),
	nl(Stream),
	fail.

/* Item Player */
loop_write(Stream) :-
	player_bag(L),
	write(Stream, player_bag(L)), write(Stream, '.'),
	nl(Stream),
	fail.

/* Count item player has */
/* Repel */
loop_write(Stream) :-
	whiteLilyPerfumeC(X),
	write(Stream, whiteLilyPerfumeC(X)), write(Stream, '.'),
	nl(Stream),
	fail.

loop_write(Stream) :-
	numItems(X),
	write(Stream, numItems(X)), write(Stream, '.'),
	nl(Stream),
	fail.

/* Primitif - primitif lainnya */
loop_write(Stream) :-
	checkGym(X),
	write(Stream, checkGym(X)), write(Stream, '.'),
	nl(Stream),
	fail.

loop_write(Stream) :-
	cave(X,Y),
	write(Stream, cave(X,Y)), write(Stream, '.'),
	nl(Stream),
	fail.

loop_write(Stream) :-
	wlEffect(X),
	write(Stream, wlEffect(X)), write(Stream, '.'),
	nl(Stream),
	fail.

/* Load game */
load_game(_):-
	checkStart(1),
	write('You have started the game. Quit the game first to load the game!'),nl,!.

load_game(File):-
	load_internal(File),
	format('Your game data from ~a has been loaded.', [File]),nl.

load_internal(File):-
	retract(letak_player(_,_)),
	retract(legendary_to_beat(_)),
	retract(list_monsta(_)),
	retractall(monsta_owned(_)),
	retractall(monsta_owned_health(_,_)),
	retract(numMonsta(_)),
	retract(player_bag(_)),
	retract(whiteLilyPerfumeC(_)),
	retract(numItems(_)),
	retract(checkGym(_)),
	retract(cave(_,_)),
	retract(wlEffect(_)),
	open(File, read, Stream),
	readfile(Stream, _),
	close(Stream).

readfile(Stream,[]) :-
	at_end_of_stream(Stream),!.

readfile(Stream, [H|T]) :-
	\+at_end_of_stream(Stream),!,
	read(Stream,H),
	asserta(H),
	readfile(Stream,T).