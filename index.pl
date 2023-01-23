start :- 
    maladie(Nom),
        write('Nous pensons que vous souffrez de :'),
        write(' '),
        write(Nom),
        nl,
        undo.

/*Bases de faits et de règles*/
maladie(paludisme):- paludisme.
maladie(cholera):- cholera.
maladie(lepre):- lepre.
maladie(tuberculose):- tuberculose.
maladie(typhoide):- typhoide.
maladie(varicele):- varicele.
maladie(rougeole_adulte):- rougeole_adulte.
maladie(rougeole_enfant):- rougeole_enfant.
maladie(covid_19) :- covid_19.
maladie(syphilis) :- syphilis.
maladie(ebola) :- ebola.
maladie(grippe) :- grippe.


paludisme:- 
    vrai(fievre_froide),
    vrai(cephalees),
    vrai(vertiges),
    vrai(coubatures).

cholera:- 
    vrai(douleurs_abdominales),
    vrai(diarhee_chronoque),
    vrai(soif_intense),
    vrai(deshydratation).

lepre:- 
    vrai(macules),
    vrai(perte_de_sensibilite),
    vrai(gonflement_du_nez),
    vrai(maux_perforants_plantaires).

tuberculose:- 
    vrai(douleurs_toraciques),
    vrai(dysphne),
    vrai(hemoptysie),
    vrai(nez_qui_coule), 
    vrai(toux_seche).

typhoide:- 
    vrai(courbature),
    vrai(maux_de_ventre),
    vrai(fievre_en_plateau), 
    vrai(maux_de_tete).

grippe:- 
    vrai(nez_qui_coule), 
    vrai(maux_de_tete), 
    vrai(fievre_froide), 
    vrai(toux_seche).

varicele:- 
    vrai(toux_legere),
    vrai(macules_rouges),
    vrai(demangeaison),
    vrai(fieve_froide),
    vrai(nez_qui_coule).

rougeole_enfant:-
    vrai(yeux_rouges_larmoyants),
    vrai(points_blauc_en_bouche),
    vrai(toux_seche),
    vrai(nez_qui_coule),
    vrai(fievre_en_plateau).

rougeole_adulte:-
    vrai(yeux_rouges_larmoyants),
    vrai(points_blauc_en_bouche),
    vrai(rhinopharyngite),
    vrai(toux_seche),
    vrai(nez_qui_coule),
    vrai(fievre_en_plateau).

ebola:- 
    vrai(maux_de_tete),
    vrai(douleurs_musculaires),
    vrai(mal_de_gorge),
    vrai(nausees_vomissements),
    vrai(fievre_froide),
    vrai(hemoragie).

syphilis:- 
    vrai(chancre),
    vrai(maux_de_tete),
    vrai(douleurs_musculaires),
    vrai(fievre_froide),
    vrai(macule_rouges).

covid_19:- 
    vrai(maux_de_tete),
    vrai(douleurs_musculaires),
    vrai(mal_de_gorge),
    vrai(toux_seche),
    vrai(fievre_en_plateau),
    vrai(perte_odorat_gout).


/* Questions */
inpput(Question):-
    write('Souffrez vous de : '),
    write(Question),
    write(' ?'),
    read(Reponse),
    nl,
    ((Reponse == yes; Reponse == y) 
        ->
            assert(yes(Question));
            assert(no(Question)),fail).
:- dynamic yes/1,no/1.

vrai(Order) :-
    (yes(Order)
    -> true;
    (no(Order)
    -> fail;
    inpput(Order))).

undo :-retract(yes(_)),fail.
undo :-retract(no(_)),fail.
undo.