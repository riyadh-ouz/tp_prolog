/*
Test TP logique : Programation logique avec PROLOG;
*/

/* Exo 1 */

jouer(M,A) :- actor(M,A,_);actress(M,A,_).
co_stars(A,B) :- jouer(M,A),jouer(M,B),A\==B.


/* Exo 2 */

nbrElm([],0).
nbrElm([_|L],N) :- nbrElm(L,N1), N is N1 + 1.


concat([],L2,L2).
concat([X|L1],L2,[X|L]) :- concat(L1,L2,L).

renverse([],[]).
renverse([X|L1],L2) :- renverse(L1,L3),concat(L3,[X],L2).

palindrome(L) :- renverse(L,L).

diviser(L,0,[],L).
diviser([X|L],N,[X|L1],L2) :- N > 0,N1 is N-1,diviser(L,N1,L1,L2).
