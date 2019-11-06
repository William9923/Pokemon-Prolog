/*** MAP - Printing map with radar ***/	
map :-
	checkStart(0),
    write('Permainan Belum dimulai'), !.
map :-
	edgeOffset([XMin,_],[_,YMax]),
    recPrintRadar(XMin,YMax), !.	
/********************************/
/*** MAP function dependencies***/
recPrintRadar(X,Y) :-
	edgeOffset([_,X],[Y,_]),
	printOneTile(X,Y), tab(1), !.
	
recPrintRadar(X,Y) :-
	\+edgeOffset([_,X],_),
	XPlus is X+1,
	printOneTile(X,Y), tab(1),
	recPrintRadar(XPlus,Y), !.
	
recPrintRadar(X,Y) :-
	edgeOffset([_,X],_),
	edgeOffset([XMin,_],_),
	YMin is Y-1,
	printOneTile(X,Y), tab(1),
	nl,
	recPrintRadar(XMin,YMin).	
/************************************/
/** For printing MAP **/
printOneTile(X,Y) :-    % home
    terrain(home,X,Y),
    write('H'), !.
printOneTile(X,Y) :-    % gym
    terrain(gym,X,Y),
    write('G'), !.
printOneTile(X,Y) :-    % block
    terrain(block,X,Y),
    write('O'), !.
printOneTile(X,Y) :-    % player
    letak_player(X,Y),
    write('P'), !.
printOneTile(X,Y) :-    % player
    letak_item(_,X,Y),
    write('I'), !.
printOneTile(X,Y) :-    % forest
    terrain(forest,X,Y),
    write('-'), !.
printOneTile(X,Y) :-    % wasteland
    terrain(wasteland,X,Y),
    write('-'), !.
printOneTile(X,Y) :-    % river
    terrain(river,X,Y),
    write('R'), !.
printOneTile(X,Y) :-    % grassland
    terrain(grassland,X,Y),
    write('-'), !.
printOneTile(X,Y) :-    % desert
    terrain(desert,X,Y),
    write('-'), !.
printOneTile(X,Y) :-    % mountain
    terrain(mountain,X,Y),
    write('-'), !.
printOneTile(X,Y) :-    % lava
    terrain(lava,X,Y),
    write('-'), !.
printOneTile(_,_) :-	%inaccessible
    write('X').
/***********************************/