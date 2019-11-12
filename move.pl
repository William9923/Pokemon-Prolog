/*** MOVE - move procedure ***/
/* Moving up */

w :-
    checkStart(0),
    write('You have not started the game.'), !.
/* 'You have not started the game. Type "start" to begin' */

w :- letak_player(_,Y),
	edge(_,[_,YMax]),
	Y =:= YMax,
   	write('You cannot go through this wall!'), nl, !.
/* 'Something prevents you from getting through */

w :- letak_player(X,Y),
    Ynew is Y + 1,
    terrain(river,X,Ynew),
    write('You cannot swim now!'), nl, !.
/* 'Something prevents you from getting through */

w :- letak_player(X,Y),
    Ynew is Y + 1,
    terrain(block,X,Ynew),
    write('Something prevents you from getting through!'), nl, !.
/* 'Something prevents you from getting through' */

/* 'You move upward' */
/* 'The wild monstas ran when the encounter your scent'     ' steps remaining' */
w :-
    letak_player(X,Y),
    YNew is Y + 1,
    terrain(home,X,YNew),
    retract(letak_player(X,Y)),
    asserta(letak_player(X,YNew)),
    map,nl,
    write('You enter the basecamp!'),nl,!.

w :- 
    
    letak_player(X,Y),
    YNew is Y+1,
    gym(X,YNew),
    retract(letak_player(X,Y)),
    asserta(letak_player(X,YNew)),
    map,nl,
    write('Welcome to the gym!'),nl,
    write('Here, we restore your monsta to full health'),nl,
    write('Notes : on limited attemps'),nl,!.

w :- 
    letak_player(X,Y),
    YNew is Y + 1,
    terrain(cave, X,YNew),
    legendary_to_beat(Z),
    retract(letak_player(X,Y)),
    asserta(letak_player(X,YNew)),
    map,nl,
    Num is 3 - Z + 1,
    write('You have entered the '),write(Num), write(' legendary cave.'),nl,
    call_legendary,!.

w :- letak_player(X,Y),
    wlEffect(Z), Z > 0,
    retract(letak_player(X,Y)),
    Ynew is Y + 1,
    asserta(letak_player(X,Ynew)),
    write('You move upward'),nl,
    map,nl, 
    retract(wlEffect(Z)),
    Znew is Z-1,
    asserta(wlEffect(Znew)),
    write('The wild monstas ran when the encounter your scent '),write(Znew), write(' steps remaining'),nl, !.

w :- letak_player(X,Y),
    retract(letak_player(X,Y)),
    Ynew is Y + 1,
    asserta(letak_player(X,Ynew)),
    write('You move upward'),nl,
    map,nl,
    randomencounter,
    !.

/* Moving down */
s :-
    checkStart(0),
    write('You have not started the game.'), !.
/* 'You have not started the game. Type "start" to begin' */

s :- letak_player(_,Y),
	edge(_,[YMin,_]),
	Y =:= YMin,
    write('You cannot go through this wall!'), nl, !.
/* 'Something prevents you from getting through' */

s :- letak_player(X,Y),
    Ynew is Y - 1,
    terrain(river,X,Ynew),
    write('You cannot swim now!'), nl, !.
/* 'Something prevents you from getting through' */

s :- letak_player(X,Y),
    Ynew is Y - 1,
    terrain(block,X,Ynew),
    write('Something prevents you from getting through!'), nl, !.
/* 'Something prevents you from getting through' */

/* 'You move downward' */
/* 'The wild monstas ran when the encounter your scent'     ' steps remaining' */
s :-
    letak_player(X,Y),
    YNew is Y - 1,
    terrain(home,X,YNew),
    retract(letak_player(X,Y)),
    asserta(letak_player(X,YNew)),
    map,nl,
    write('You enter the basecamp!'),nl,!.

s :- 
    letak_player(X,Y),
    YNew is Y-1,
    gym(X,YNew),
    retract(letak_player(X,Y)),
    asserta(letak_player(X,YNew)),
    map,nl,
    write('Welcome to the gym!'),nl,
    write('Here, we restore your monsta to full health'),nl,
    write('Notes : on limited attemps'),nl,!.

s :- 
    letak_player(X,Y),
    YNew is Y - 1,
    terrain(cave, X,YNew),
    legendary_to_beat(Z),
    retract(letak_player(X,Y)),
    asserta(letak_player(X,YNew)),
    map,nl,
    Num is 3 - Z + 1,
    write('You have entered the '),write(Num), write(' legendary cave.'),nl,
    call_legendary,!.

s :- letak_player(X,Y),
    wlEffect(Z), Z > 0,
    retract(letak_player(X,Y)),
    Ynew is Y - 1,
    asserta(letak_player(X,Ynew)),
    write('You move downward' ),nl,
    map,nl, 
    retract(wlEffect(Z)),
    Znew is Z-1,
    asserta(wlEffect(Znew)),
    write('The wild monstas ran when the encounter your scent '),write(Znew), write(' steps remaining'),nl, !.

s :- letak_player(X,Y),
    retract(letak_player(X,Y)),
    Ynew is Y - 1,
    asserta(letak_player(X,Ynew)), 
    write('You move downward'),nl,
    map, nl,
    randomencounter,
    !.
/* 'You move downward' */

/* Moving right */
d :-
    checkStart(0),
    write('You have not started the game.'), !.
/* 'You have not started the game. Type "start" to begin' */

d :- letak_player(X,_),
	edge([_,XMax],_),
	X =:= XMax,
    write('You cannot go through this wall!'), nl, !.
/* 'Something prevents you from getting through' */

d :- letak_player(X,Y),
    Xnew is X + 1,
    terrain(river,Xnew,Y),
    write('You cannot swim now!'), nl, !.
/* 'Something prevents you from getting through' */

d :- letak_player(X,Y),
    Xnew is X + 1,
    terrain(block,Xnew,Y),
    write('Something prevents you from getting through!'), nl, !.
/* 'Something prevents you from getting through' */
/* 'You move to the right' */
/* 'The wild monstas ran when the encounter your scent'     ' steps remaining' */

d :-
    letak_player(X,Y),
    XNew is X + 1,
    terrain(home,XNew,Y),
    retract(letak_player(X,Y)),
    asserta(letak_player(XNew,Y)),
    map,nl,
    write('You enter the basecamp!'),nl,!.

d :- 
    letak_player(X,Y),
    XNew is X + 1,
    gym(XNew,Y),
    retract(letak_player(X,Y)),
    asserta(letak_player(XNew,Y)),
    map,nl,
    write('Welcome to the gym!'),nl,
    write('Here, we restore your monsta to full health'),nl,
    write('Notes : on limited attemps'),nl,!.

d :- 
    letak_player(X,Y),
    XNew is X + 1,
    terrain(cave, XNew,Y),
    legendary_to_beat(Z),
    retract(letak_player(X,Y)),
    asserta(letak_player(XNew,Y)),
    map,nl,
    Num is 3 - Z + 1,
    write('You have entered the '),write(Num), write(' legendary cave.'),nl,
    call_legendary,!.

d :- letak_player(X,Y),
    wlEffect(Z), Z > 0,
    retract(letak_player(X,Y)),
    Xnew is X + 1,
    asserta(letak_player(Xnew,Y)),
    write('You move to the right'),nl,
    map,nl, 
    retract(wlEffect(Z)),
    Znew is Z-1,
    asserta(wlEffect(Znew)),
    write('The wild monstas ran when the encounter your scent '),write(Znew), write(' steps remaining'),nl, !.

d :- letak_player(X,Y),
    retract(letak_player(X,Y)),
    Xnew is X + 1,
    asserta(letak_player(Xnew,Y)), 
    write('Player berbelok ke kanan'),nl,
    map, nl,
    randomencounter,
    !.
/* 'You move to the right' */

/* Moving left */
a :-
    checkStart(0),
    write('You have not started the game.'), !.
/* 'You have not started the game. Type "start" to begin' */

a :- letak_player(X,_),
	edge([XMin,_],_),
	X =:= XMin,
    write('You cannot go through this wall!'), nl, !.
/* 'Something prevents you from getting through' */

a :- letak_player(X,Y),
    Xnew is X - 1,
    terrain(river,Xnew,Y),
    write('You cannot swim now!'), nl, !.
/* 'Something prevents you from getting through' */

a :- letak_player(X,Y),
    Xnew is X - 1,
    terrain(block,Xnew,Y),
    write('Something prevents you from getting through!'), nl, !.
/* 'Something prevents you from getting through' */
/* 'You move to the left' */
/* 'The wild monstas ran when the encounter your scent'     ' steps remaining' */
a :-
    letak_player(X,Y),
    XNew is X - 1,
    terrain(home,XNew,Y),
    retract(letak_player(X,Y)),
    asserta(letak_player(XNew,Y)),
    map,nl,
    write('You enter the basecamp!'),nl,!.

a :- 
    letak_player(X,Y),
    XNew is X - 1,
    gym(XNew,Y),
    retract(letak_player(X,Y)),
    asserta(letak_player(XNew,Y)),
    map,nl,
    write('Welcome to the gym!'),nl,
    write('Here, we restore your monsta to full health'),nl,
    write('Notes : on limited attemps'),nl,!.

a :- 
    letak_player(X,Y),
    XNew is X - 1,
    terrain(cave, XNew,Y),
    legendary_to_beat(Z),
    retract(letak_player(X,Y)),
    asserta(letak_player(XNew,Y)),
    map,nl,
    Num is 3 - Z + 1,
    write('You have entered the '),write(Num), write(' legendary cave.'),nl,    call_legendary,!.

a :- letak_player(X,Y),
    wlEffect(Z), Z > 0,
    retract(letak_player(X,Y)),
    Xnew is X - 1,
    asserta(letak_player(Xnew,Y)),
    write('You move to the left'),nl,
    map,nl, 
    retract(wlEffect(Z)),
    Znew is Z-1,
    asserta(wlEffect(Znew)),
    write('The wild monstas ran when the encounter your scent '),write(Znew), write(' steps remaining'),nl, !.

a :- letak_player(X,Y),
    retract(letak_player(X,Y)),
    Xnew is X - 1,
    asserta(letak_player(Xnew,Y)), 
    write('You move to the left'),nl,
    map, nl,
    randomencounter,
    !.
/* 'You move to the left' */