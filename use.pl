wlEffect(0).
use(_) :-
	checkStart(0),
    write('Game has not started yet. Type "start." to start the game'), !.

%use whitelily
use(whiteLilyPerfume) :- 
                    whiteLilyPerfumeC(0),
                    write('Kamu tidak mempunyai item tersebut'),!.
/* 'You don't have that item' */
use(whiteLilyPerfume) :-
                    whiteLilyPerfumeC(Y),
                    retract(whiteLilyPerfumeC(Y)),
                    Ynew is Y-1,
                    asserta(whiteLilyPerfumeC(Ynew)),
                    wlEffect(X),
                    retract(wlEffect(X)),
                    Xnew is X+4,
                    asserta(wlEffect(Xnew)),
                    write('A good smell wafts from your body '),!.
            


                