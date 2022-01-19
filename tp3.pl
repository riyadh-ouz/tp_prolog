/*
TP logique N°03 : Programation logique avec PROLOG;

Created on Wed Jan 19 09:20:14 2022
Author: riyouz
*/

/* CrossWord problem */

word(astante,a,s,t,a,n,t,e).
word(astoria,a,s,t,o,r,i,a).
word(baratto,b,a,r,a,t,t,o).
word(cobalto,c,o,b,a,l,t,o).
word(pistola,p,i,s,t,o,l,a).
word(statale,s,t,a,t,a,l,e).

crossWord(H1,H2,H3,V1,V2,V3) :-
word(H1,_,H1V1,_,H1V2,_,H1V3,_),
word(H2,_,H2V1,_,H2V2,_,H2V3,_),
word(H3,_,H3V1,_,H3V2,_,H3V3,_),
word(V1,_,H1V1,_,H2V1,_,H3V1,_),
word(V2,_,H1V2,_,H2V2,_,H3V2,_),
word(V3,_,H1V3,_,H2V3,_,H3V3,_),
is_set([H1,H2,H3,V1,V2,V3]).

/* habitation */

% les maisons :

maison(studio).
maison(pavillon).
maison(chateau).

% les animaux :

animal(chat).
animal(cheval).
animal(poisson).

% le prédicat habitation représente la relation
% entre une personne,sa maison et son animal :
% Max a un chat :

habitation(max,M,chat) :-maison(M).

% Eric n’habite pas en pavillon :
habitation(eric,M,A) :-maison(M),M\==pavillon,animal(A).

% Luc habite un studio,il n’a pas le cheval :
habitation(luc,studio,A):-animal(A),A\==cheval.

% le prédicat resoudre décrit l’ensemble du problème à résoudre
% avec ses 4 éléments inconnus et affiche la solution :

resoudre_habitation:-
habitation(max,MM,chat),
habitation(eric,ME,AE),
habitation(luc,studio,AL),
MM \== studio,MM \== ME,ME \== studio,
AE \== chat,AE \== AL,AL \== chat,
write(max),write(' '),write(MM),write(' '),writeln(chat),
write(eric),write(' '),write(ME),write(' '),writeln(AE),
write(luc),write(' '),write(studio),write(' '),writeln(AL).


/* Detection d'un cycle dans un graphe */

arc(a,b).
arc(b,c).
arc(c,d).
arc(d,b).

haveCycle(A) :- arc(A,C),arc(C,B),haveCycle(A,B).
haveCycle(A,B) :- arc(A,C),arc(B,D),arc(D,F),haveCycle(C,F).
haveCycle(A,A).
