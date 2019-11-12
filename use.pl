/*
:- dynamic(
    whiteLilyPerfumeC/1,
    permenyuvi/1,monsta_health/2,
    panahApatis/1,pAeffect/1,
    sugionoBalls/1,
    snickaxs/1,
    pilSemangatTerbaik/1,monsta_attack/2,
    susuKmen/1).
*/
:- dynamic(
    whiteLilyPerfumeC/1,wlEffect/1).
wlEffect(0).
use(_) :-
	checkStart(0),
    write('Permainan Belum dimulai'), !.
/* The game hasn't started yet.*/
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
                    write('Bau harum menyerbak keluar dari tubuhmu'),!.
/* 'A good smell wafts from your body ' */
/*
%use permenyuvi
use(permenyuvi) :-
                    permenyuvi(0),
                    write('Kamu tidak mempunyai item tersebut'),!.
use(permenyuvi) :-
                    permenyuvi(X),
                    retract(permenyuvi(X)),
                    Xnew is X-1,
                    asserta(permenyuvi(Xnew)),
                    monsta_health(_, Y),
                    retract(monsta_health(_,Y)),
                    Ynew is Y+40,
                    asserta(monsta_health(_,Ynew)),
                    write('Yummy, health monsta mu bertambah'),!.

%use panahApatis, pAeffect blum dimasukin 
use(panahApatis) :-
                    panahApatis(0),
                    write('Kamu tidak mempunyai item tersebut'),!. 
use(panahApatis) :-
                    panahApatis(X),
                    retract(panahApatis(X)),
                    Xnew is X-1,
                    asserta(panahApatis(Xnew)),
                    pAeffect(Y),
                    retract(pAeffect(Y)),
                    Ynew is Y+1,
                    asserta(pAeffect(Ynew)),
                    write('zzZ.. , ssst Musuhmu tertidur'),!.

%use sugionoBalls, sugionoEffect belum dimasukin
use(sugionoBalls) :-
                    sugionoBalls(0),
                    write('Kamu tidak mempunyai item tersebut'),!. 
use(sugionoBalls) :- 
                    sugionoBalls(X),
                    retract(sugionoBalls(X)),
                    Xnew is X-1,
                    asserta(sugionoBalls(Xnew)),
                    sBeffect(Y),
                    retract(sBeffect(Y)),
                    Ynew is Y+1,
                    asserta(sBeffect(Ynew)),
                    write('Bimsalabim Affinity hilang'),!.

%use snickaxs, snickaxseffect belum dimasukin
use(snickaxs) :-
                    snickaxs(0),
                    write('Kamu tidak mempunyai item tersebut'),!. 
use(snickaxs) :- 
                    snickaxs(X),
                    retract(snickaxs(X)),
                    Xnew is X-1,
                    asserta(snickaxs(Xnew)),
                    snickaxs(Y),
                    retract(snickaxseffect(Y)),
                    Ynew is Y+1,
                    asserta(snickaxseffect(Ynew)),
                    write('Monstamu dapat melakukan Spesial skill lagi'),!.

%use pilSemangatTerbaik, 
use(pilSemangatTerbaik) :-
                    pilSemangatTerbaik(0),
                    write('Kamu tidak mempunyai item tersebut'),!. 
use(pilSemangatTerbaik) :- 
                    pilSemangatTerbaik(X),
                    retract(pilSemangatTerbaik(X)),
                    Xnew is X-1,
                    asserta(pilSemangatTerbaik(Xnew)),
                    monsta_attack(Y),
                    retract(monsta_attack(Y)),
                    Ynew is Y*2,
                    asserta(monsta_attack(Ynew)),
                    write('Monstamu menjadi bersemangat, attack nya meningkat dua kali lipat'),!.

%use susuKmen sKEffect belum dimasukin
use(susuKmen) :- 
                    susuKmen(X),
                    retract(pilSemangatTerbaik(X)),
                    Xnew is X-1,
                    asserta(pilSemangatTerbaik(Xnew)),
                    sKEffect(Y),
                    retract(sKEffect(Y)),
                    Ynew is Y+1,
                    asserta(sKEffect(Ynew)),
                    write('Monstamu menjadi kuat, defensive meningkat'),!.
*/
                    
                    


                