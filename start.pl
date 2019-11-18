inst(start).
inst(quit).
inst(help).
inst(w).
inst(s).
inst(d).
inst(a).
inst(map).
inst(drop(_)).
inst(drop_monsta(_)).
inst(use(_)).
inst(status).
inst(bag).
inst(heal).
inst(save_game(_)).
inst(load_game(_)).

/* Start Game Function */
%% if game has already started
start:- 
	checkStart(1),
	write('You have started the game.'),nl,!.

start:-
	checkStart(0),
	retract(checkStart(0)),
	asserta(checkStart(1)),
	start_story,
	start_commands, nl,
	help, nl,
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
	write('==================================================='),nl,
	write(' _____             _          _ _ _         _   _ '),nl,
	write('|     |___ ___ ___| |_ ___   | | | |___ ___| |_| |'),nl,
	write('| | | | . |   |_ -|  _| . |  | | | | . |  _| | . |'),nl,
	write('|_|_|_|___|_|_|___|_| |__,|  |_____|___|_| |_|___|'),
	nl,
	write('==================================================='),nl,nl,
	write('Welcome to this monster battling games'),nl,
	write('This is an adventure game, writen in prolog programming languange.'),nl.

help :-
	write('Please enter the command below using Prolog syntax'),nl,
	write('Available commands are       :'),nl,
	write(' start.                      : to start the MonstaWorld game.'),nl,
	write(' help.                       : to see the MonstaWorld in-game available commands.'),nl,
	write(' quit.                       : to exit from the game.'),nl,
	write(' w.,s.,a.,d.                 : to move player based on the wind direction.'),nl,
	write(' map.                        : to print the map of MonstaWorld'),nl,
	write(' save_game(filename).        : to save the game'),nl,
	write(' drop(monsta)                : to release monsta back to their world.'),nl,
	write(' use(item).                  : to use items in your bag.'),nl,
	write(' bag.                        : to see all items in player bag.'),nl,
	write(' status.                     : to see status of player.'),nl,
	nl,
	write('Legends:'), nl,
    write('Player     : P'), nl,
    write('Home       : H'), nl,
	write('Gym        : G'), nl,
    write('Cave       : C'), nl,
    write('River      : ~'), nl,
    write('Forest     : ^'), nl,
    write('Wasteland  : _'), nl,
    write('Grassfield : v'), nl,
    write('Dessert    : .'), nl,
    write('Lava       : !'),nl,
    write('Mountain   : M'),nl,
    write('Fence      : X'),nl.

countdown(0):-
	write('').
countdown(X):-
	write('...'),
	sleep(1),
	X1 is X - 1,
	countdown(X1).

start_story :- 
	write('You were awake in a unfamiliar room.'),nl,
	write('It is really strange, since you cannot remember anything.'),nl,
	write('Press c to continue (Of course, you must use prolog syntax)'),nl,read(_),
	write('   you here something rustling near you..'),nl,
	countdown(2),write('You realize that you were never alone in that room!!'),nl,
	write('When you try to look closer to the other person, it seems mad at you !!.'), nl,
	write('He suddenly approaching you and talk to you.'),nl,
	write('"So, you were awaken", said that man'),nl,
	write('Press c to continue (Of course, you must use prolog syntax)'),nl,read(_),
	write('Suddenly, you panicked and ask where you were right now'),nl,
	write('"W-wh-where am I?? How can I be here", you shouted'),nl,
	write('"Hajimemashite, my name is Prof. Sugiono. You were here because you were summoned by 3 legendary monsta.') ,nl,
	write('I am here to help you regain your memory", said the man'),nl,
	write('Press c to continue (Of course, you must use prolog syntax)'),nl,read(_),
	write('"Sugiono.., I think I ever heard that name.", I told myself'),nl,
	write('"So, how can you help me?", I asked the Professor'),nl,
	write('"Simple, you should KILL all 3 legendary monsta from this world, that way you can restore your memory back."'),nl,
	write('"'),countdown(2), write('make sense. If I want to escape from this world. I just need to KILL all those who summoned me"'),nl,
	write('"Alright, since right now you do not have anything to battle with,'),nl, 
	write('I will help you. You can use my best buddy Dragonflymon", said Sugiono'),nl,
	write('"So where can I find the legendary monsta"'),nl,
	write('"There should be 3 legendary cave in this world. Go there and KILL them"'),nl,
	write('After that, I am set of to a journey to regain my loss memory and to go back to my world!!'),nl,countdown(5),nl.



  
