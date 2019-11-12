/*** MOVE - move procedure ***/
/* Moving up */

w :-
    checkStart(0),
    write('You have not started the game.'), !.
/* 'You have not started the game. Type "start" to begin' */

w :- letak_player(_,Y),
	edge(_,[_,YMax]),
	Y =:= YMax,
   	write('You cannot go there!'), nl, !.
/* 'Something prevents you from getting through */

w :- letak_player(X,Y),
    Ynew is Y + 1,
    terrain(river,X,Ynew),
    write('You cannot go there!'), nl, !.
/* 'Something prevents you from getting through */

w :- letak_player(X,Y),
    Ynew is Y + 1,
    terrain(block,X,Ynew),
    write('You cannot go there!'), nl, !.
/* 'Something prevents you from getting through' */

w :- letak_player(X,Y),
    wlEffect(Z), Z > 0,
    retract(letak_player(X,Y)),
    Ynew is Y + 1,
    asserta(letak_player(X,Ynew)),
    write('Player berbelok ke atas'),nl,
    map,nl, 
    retract(wlEffect(Z)),
    Znew is Z-1,
    asserta(wlEffect(Znew)),
    write('Para monster liar berlari saat mencium baumu tersisa '),write(Znew), write(' langkah lagi'),nl, !.
/* 'You move upward' */
/* 'The wild monstas ran when the encounter your scent'     ' steps remaining' */
%% tambahin buat gym
%% tambahin buat yang legendary cave

w :- letak_player(X,Y),
    retract(letak_player(X,Y)),
    Ynew is Y + 1,
    asserta(letak_player(X,Ynew)),
    write('Player berbelok ke atas'),nl,
    map,nl,
    randomencounter,
    !.
/* 'You move upward' */

/* Moving down */
s :-
    checkStart(0),
    write('You have not started the game.'), !.
/* 'You have not started the game. Type "start" to begin' */

s :- letak_player(_,Y),
	edge(_,[YMin,_]),
	Y =:= YMin,
    write('You cannot go there!'), nl, !.
/* 'Something prevents you from getting through' */

s :- letak_player(X,Y),
    Ynew is Y - 1,
    terrain(river,X,Ynew),
    write('You cannot go there!'), nl, !.
/* 'Something prevents you from getting through' */

s :- letak_player(X,Y),
    Ynew is Y - 1,
    terrain(block,X,Ynew),
    write('You cannot go there!'), nl, !.
/* 'Something prevents you from getting through' */

s :- letak_player(X,Y),
    wlEffect(Z), Z > 0,
    retract(letak_player(X,Y)),
    Ynew is Y - 1,
    asserta(letak_player(X,Ynew)),
    write('Player berbelok ke bawah'),nl,
    map,nl, 
    retract(wlEffect(Z)),
    Znew is Z-1,
    asserta(wlEffect(Znew)),
    write('Para monster liar berlari saat mencium baumu tersisa '),write(Znew), write(' langkah lagi'),nl, !.
/* 'You move downward' */
/* 'The wild monstas ran when the encounter your scent'     ' steps remaining' */

s :- letak_player(X,Y),
    retract(letak_player(X,Y)),
    Ynew is Y - 1,
    asserta(letak_player(X,Ynew)), 
    write('Player berbelok ke bawah'),nl,
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
    write('You cannot go there!'), nl, !.
/* 'Something prevents you from getting through' */

d :- letak_player(X,Y),
    Xnew is X + 1,
    terrain(river,Xnew,Y),
    write('You cannot go there!'), nl, !.
/* 'Something prevents you from getting through' */

d :- letak_player(X,Y),
    Xnew is X + 1,
    terrain(block,Xnew,Y),
    write('You cannot go there!'), nl, !.
/* 'Something prevents you from getting through' */

d :- letak_player(X,Y),
    wlEffect(Z), Z > 0,
    retract(letak_player(X,Y)),
    Xnew is X + 1,
    asserta(letak_player(Xnew,Y)),
    write('Player berbelok ke kanan'),nl,
    map,nl, 
    retract(wlEffect(Z)),
    Znew is Z-1,
    asserta(wlEffect(Znew)),
    write('Para monster liar berlari saat mencium baumu tersisa '),write(Znew), write(' langkah lagi'),nl, !.
/* 'You move to the right' */
/* 'The wild monstas ran when the encounter your scent'     ' steps remaining' */

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
    write('You cannot go there!'), nl, !.
/* 'Something prevents you from getting through' */

a :- letak_player(X,Y),
    Xnew is X - 1,
    terrain(river,Xnew,Y),
    write('You cannot go there!'), nl, !.
/* 'Something prevents you from getting through' */

a :- letak_player(X,Y),
    Xnew is X - 1,
    terrain(block,Xnew,Y),
    write('You cannot go there!'), nl, !.
/* 'Something prevents you from getting through' */

a :- letak_player(X,Y),
    wlEffect(Z), Z > 0,
    retract(letak_player(X,Y)),
    Xnew is X - 1,
    asserta(letak_player(Xnew,Y)),
    write('Player berbelok ke kiri'),nl,
    map,nl, 
    retract(wlEffect(Z)),
    Znew is Z-1,
    asserta(wlEffect(Znew)),
    write('Para monster liar berlari saat mencium baumu tersisa '),write(Znew), write(' langkah lagi'),nl, !.
/* 'You move to the left' */
/* 'The wild monstas ran when the encounter your scent'     ' steps remaining' */

a :- letak_player(X,Y),
    retract(letak_player(X,Y)),
    Xnew is X - 1,
    asserta(letak_player(Xnew,Y)), 
    write('Player berbelok ke kiri'),nl,
    map, nl,
    randomencounter,
    !.
/* 'You move to the left' */