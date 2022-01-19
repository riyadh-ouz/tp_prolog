/*
TP logique N°02 (listes) : Programation logique avec PROLOG;

Created on Wed Jan 19 08:26:23 2022
Author: riyouz
*/

/* Les prédicats de manipulation des listes */

liste([]).
liste([_|_]).

premier([X|_],X).
rest([_|X],X).

dernier([X|[]],X).
dernier([_|Y],X) :- dernier(Y,X).

nieme(1,[X|_],X).
nieme(N,[_|Q],X) :- N > 1,N1 is N-1,nieme(N1,Q,X).

element(X,[X|_]).
element(X,[Y|L]) :- X \== Y,element(X,L).

nonElement(_,[]).
nonElement(X,[Y|L]) :- X \== Y,nonElement(X,L).

sous_ensemble([],[_|_]).
sous_ensemble([X|Q],L2) :- element(X,L2),sous_ensemble(Q,L2).

concat([],L2,L2).
concat([X|L1],L2,[X|L]) :- concat(L1,L2,L).

ajouter_fin(X,[],[X]).
ajouter_fin(X,[Y|Z],[Y|T]) :- ajouter_fin(X,Z,T).

inverse([],[]).
inverse([X|L1],L2) :- inverse(L1,L3),concat(L3,[X],L2).

longueur([],0).
longueur([_|L],S) :- longueur(L,S1),S is S1 + 1.

somme([],0).
somme([X|L],S) :- somme(L,S1),S is S1 + X.

min([X],X).
min([X|L],X) :- min(L,M),X =< M.
min([X|L],M) :- min(L,M),X > M.

enlever(X,[X|L],L).
enlever(X,[Y|L],[Y|L2]) :- X \== Y,enlever(X,L,L2).

tri_selection([],[]).
tri_selection(L,[Min|L1]) :- min(L,Min),enlever(Min,L,L2),tri_selection(L2,L1).

/* tri par insertion */
insertion(X,[],[X]).
insertion(X,[Y|L],[X,Y|L]) :- X =< Y.
insertion(X,[Y|L],[Y|L1]) :- X > Y, insertion(X,L,L1).

tri_insertion([],[]).
tri_insertion([X|L],L1) :- tri_insertion(L,L2),insertion(X,L2,L1).


nb_pairs([],0).
nb_pairs([X|L],N) :- nb_pairs(L,N1),X mod 2 =:= 0,N is N1 + 1.
nb_pairs([X|L],N) :- nb_pairs(L,N),X mod 2 =:= 1.

elements_rang_impair([],[]).
elements_rang_impair([X],[X]).
elements_rang_impair([X,_|L],[X|L1]) :- elements_rang_impair(L,L1).

liste_pairs([],[]).
liste_pairs([X|L],[X|L1]):- X mod 2 =:= 0,liste_pairs(L,L1).
liste_pairs([X|L],L1):- X mod 2 =:= 1,liste_pairs(L,L1).

egale([],[]).
egale([X|Q1],[X|Q2]) :- egale(Q1,Q2).

split_list([],_,[],[]).
split_list([T|Q],X,[T|L1],L2) :- split_list(Q,X,L1,L2),X > T.
split_list([T|Q],X,L1,[T|L2]) :- split_list(Q,X,L1,L2),(X < T;X == T).

moinsder(L1,L2) :- dernier(L1,X),concat(L,[X],L1),egale(L,L2).

suppr_doublons([],[]).
suppr_doublons([X|L],L1) :- element(X,L),suppr_doublons(L,L1).
suppr_doublons([X|L],[X|L1]) :- (nonElement(X,L)),suppr_doublons(L,L1).

prefix([],[_|_]).
prefix([X|L1],[X|L2]) :- prefix(L1,L2).

suffix(L1,L2) :- inverse(L1,L3),inverse(L2,L4),prefix(L3,L4).
