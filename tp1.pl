/*
TP logique N°01 : Programation logique avec PROLOG;

Created on Wed Nov 24 15:06:29 2021
Author: riyouz
*/

/* Les faits (facts) */

homme(albert).
homme(jean).
homme(paul).
homme(bertrand).
homme(louis).
homme(benoit).

femme(germaine).
femme(christiane).
femme(simone).
femme(marie).
femme(sophie).

pere(albert,jean).
pere(jean,paul).
pere(paul,bertrand).
pere(paul,sophie).
pere(jean,simone).
pere(louis,benoit).

mere(germaine,jean).
mere(christiane,simone).
mere(christiane,paul).
mere(simone,benoit).
mere(marie,bertrand).
mere(marie,sophie).


/* Les predicats (les règles, rules) */

parent(X,Y) :- pere(X,Y);mere(X,Y).

fils(X,Y) :- homme(X),parent(Y,X).
fille(X,Y) :- femme(X),parent(Y,X).

grand_pere(X,Y) :- pere(X,Z),parent(Z,Y).
grand_mere(X,Y) :- mere(X,Z),parent(Z,Y).

/*
grand_pere(X,Y) :- parent(X,Z),parent(Z,Y),homme(X).
grand_mere(X,Y) :- parent(X,Z),parent(Z,Y),femme(X).
*/

frere(X,Y) :- homme(X),parent(Z,X),parent(Z,Y),(X\==Y).
soeur(X,Y) :- femme(X),parent(Z,X),parent(Z,Y),(X\==Y).


/* Interrogations

?-homme(paul)
?-femme(X) % Liste des femmes
?-femme(_) % Est-ce qu'il y'a des femmes
?-mere(germaine,jean).
?-mere(germaine,X). % Qui est la mere de jean
?-homme(X),pere(X). % Quels sont les hommes qui sont des peres

*/
