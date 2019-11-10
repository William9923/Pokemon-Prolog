
%% Affinity rules
%% Condition :
affinity(leaves, water, win).
affinity(leaves, fire, lose).
affinity(water, fire, win).
affinity(water, leaves, lose).
affinity(fire, leaves, win).
affinity(fire, water, lose).
affinity(wing, earth, win).
affinity(earth,wing, lose).
affinity(ghost,wing,win).
affinity(wing,ghost,lose).
affinity(earth,ghost,win).
affinity(ghost, earth, lose).
affinity(X,Y,draw).

affinity_checker(X,X,1):-!.
affinity_checker(X,Y,Z):-
	affinity(X,Y,win),
	Z is 2,!.
affinity_checker(X,Y,Z):-
	affinity(X,Y,lose),
	(Z is 0.5),!.
