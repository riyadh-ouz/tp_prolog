/*
TP logique N°02 : Programation logique avec PROLOG;

Created on Wed Nov 24 16:01:15 2021
Author: riyouz
*/

/* Les faits (facts) */

% menu

hors_d_oeuvre(artichauts).
hors_d_oeuvre(crevettes).
hors_d_oeuvre(oeufs).

viande(grillade_de_oeuf).
viande(poulet).

poisson(loup).
poisson(sole).

dessert(glace).
dessert(tarte).
dessert(fraises).

% calories

calories(artichauts,150).
calories(crevettes,250).
calories(oeufs,200).
calories(grillade_de_oeuf,500).
calories(poulet,430).
calories(loup,250).
calories(sole,200).
calories(glace,300).
calories(tarte,400).
calories(fraises,250).


/* Les prédicats (les règles,rules) */

% ; signifie 'ou' logique
plat(X) :- viande(X);poisson(X).

repas(X,Y,Z) :- hors_d_oeuvre(X),plat(Y),dessert(Z).

% K is K1+K2+K3

cal_repas(X,Y,Z,K) :- repas(X,Y,Z),calories(X,K1),calories(Y,K2),calories(Z,K3),K is K1+K2+K3.

repas_equilibre(X,Y,Z) :- cal_repas(X,Y,Z,K),(K < 900).


/* Interrogations

?- repas(crevettes,Y,Z). Quels sont les repas comportant des crevettes.
?- repas(X,Y,Z),Z\==fraises. ne comportant pas de fraises

*/
