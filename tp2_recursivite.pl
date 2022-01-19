/*
TP logique N°02 (récursivité) : Programation logique avec PROLOG;

Created on Wed Jan 19 08:01:56 2022
Author: riyouz
*/

/* Récursivité */

fact(0,1).
fact(N,S) :- N > 0,N1 is N-1,fact(N1,S1),S is N * S1.

fib(1,1).
fib(2,1).
fib(N,S) :- N > 2,N1 is N-1,N2 is N-2,fib(N1,S1),fib(N2,S2),S is S1+S2.

pair(N) :- (M is N mod 2,M == 0).
impair(N) :- (M is N mod 2,M =\= 0).

/*
pair(0).
impair(1).
pair(N) :- N>0,M is N-1,impair(M).
impair(N) :- N>1,M is N-1,pair(M).
*/

pgcd(X,0,X).
pgcd(0,X,X).
pgcd(X,X,X).
pgcd(A,B,X) :- A \== 0,A < B,R is B mod A,pgcd(A,R,X).
pgcd(A,B,X) :- B \== 0,A > B,R is A mod B,pgcd(B,R,X).

ppcm(A,B,X) :- pgcd(A,B,Y),X is A * B / Y.

syracuse(0,10).
syracuse(N,S) :- N > 0,N1 is N - 1,syracuse(N1,S1),pair(N1),S is S1/2.
syracuse(N,S) :- N > 0,N1 is N - 1,syracuse(N1,S1),impair(N1),S is 3*S1+1.

syracuse(1,1).
syracuse(N,L) :- N mod 2 =:= 1,N \== 1,N1 is N*3+1,syracuse(N1,L1),L is L1+1.
syracuse(N,L) :- N mod 2 =:= 0,N1 is N//2,syracuse(N1,L1),L is L1+1.
