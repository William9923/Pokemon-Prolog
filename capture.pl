capture:-
	numMonsta(X),
	X >= 6,
	write('You have too much monsta with you already'),nl,!.

%% cancel capture if you already have that monsta 
capture:-
	enemy_monsta(M),
	list_monsta(L),
	member(M,L),
	format('~a will sad if you abondon it and capture another monsta!', [M]),nl,!.

%% capturing legendary monsta 
capture :- 
	enemy_monsta(M),
	member(M,['Legendary EmeraldHawkmon','Legendary CrimsonDragonmon','Legendary GreatForestmon']),
	capture_rate_legendary,
	list_monsta(L),
	enemy_monsta(M),
	enemy_monsta_health(M,Health),
	append(L,[M],LNew),
	retract(list_monsta(L)),
	asserta(list_monsta(LNew)),
	asserta(monsta_owned(M)),
 	asserta(monsta_owned_health(M,Health)),
	format('Congratulation, you have successfully make ~a your slave!!', [M]),nl,
	numMonsta(X),
	X1 is X + 1,
	retract(numMonsta(_)),
	asserta(numMonsta(X1)),
	end_battle,
	!.

%% capturing normal_monsta
capture :- 
	enemy_monsta(M),
	\+member(M,['Legendary EmeraldHawkmon','Legendary CrimsonDragonmon','Legendary GreatForestmon']),
	capture_rate,
	list_monsta(L),
	enemy_monsta(M),
	enemy_monsta_health(M,Health),
	append(L,[M],LNew),
	retract(list_monsta(L)),
	asserta(list_monsta(LNew)),
	asserta(list_monsta(LNew)),
	asserta(monsta_owned(M)),
	asserta(monsta_owned_health(M,Health)),
	format('Congratulation, you have successfully make ~a your slave!!', [M]),nl,
	numMonsta(X),
	X1 is X + 1,
	retract(numMonsta(_)),
	asserta(numMonsta(X1)),
	end_battle,
	!.

%% failed capture 
capture:-
	write('You failed to capture it'),nl.


%% succesful capture
%% capture:- 
%% 	in_battle(1),
%% 	list_monsta(L),
%% 	numMonsta(X),
%% 	X < 6,
%% 	enemy_monsta(M),
%% 	enemy_monsta_health(M,Health),
%% 	\+member(M,L),
%% 	append(L,[M],LNew),
%% 	retract(list_monsta(L)),
%% 	asserta(list_monsta(LNew)),
%% 	asserta(monsta_owned(M)),
%% 	asserta(monsta_owned_health(M,Health)),
%% 	format('Congratulation, you have successfully make ~a your slave!!', [M]),nl,
%% 	end_battle,
%% 	format('You have captured ~a!!',[M]),
%% 	X1 is X + 1,
%% 	retract(numMonsta(_)),
%% 	asserta(numMonsta(X1)),
%% 	!.
%% capture 

%% end battle status
end_battle :-
	retract(in_battle(_)),
	asserta(in_battle(0)),
	retract(monsta_out(_)),
	asserta(monsta_out(0)),
	retract(special_out(_)),
	asserta(special_out(0)).

%% capture rate for normal monsta 
capture_rate:-
	random(1,10,X),
	X > 4.

%% capture rate for legendary monsta 
capture_rate_legendary:-
	random(1,10,X),
	X > 7.
