'From Pharo11.0.0 of 15 January 2024 [Build information: Pharo-11.0.0+build.721.sha.d5a832027715be24ea99a180b36da45cfe189a99 (64 Bit)] on 12 April 2024 at 9:45:39.058 am'!
SpPresenter subclass: #Caisse
	instanceVariableNames: 'utilisateur labelUtilisateur labelDate tableDeVente labelBoissons boutonBoisson1 boutonBoisson2 boutonBoisson3 labelPlat boutonPlat1 boutonPlat2 boutonPlat3 labelDessert boutonDessert1 boutonDessert2 boutonDessert3 boutonTotal boutonAnnuler boutonGenererFacture tableFacture labelFacture boutonImprimerFacture boutonEnregistrerFacture collectionDesVentes boutonDeconnexion'
	classVariableNames: ''
	package: 'ProjetBonnesPratiques'!

!Caisse methodsFor: 'initialization - deprecated' stamp: 'saintHeraud 3/15/2024 10:25'!
initializePresenter
	boutonDeconnexion := self newButton
							label: 'Déconnexion';
							color: Color red;
							action: [ self window close. PageAccueil new open ].

	"La collection qui va contenir les produits vendus. ou cliqués"
	collectionDesVentes := OrderedCollection new.

	labelUtilisateur := self newLabel
							label: ' BONJOUR '.
	labelDate := self newLabel 
					label: ((DateAndTime now) asDateAndTime) asString.
					
	tableDeVente := SpTablePresenter new
		  addColumn: (SpStringTableColumn title: 'Produit' evaluated: #getNomDuProduit);
        addColumn: (SpStringTableColumn title: 'Quantité' evaluated: #getQuantiteDuProduit);
        addColumn: (SpStringTableColumn title: 'Prix Unitaire' evaluated: #getPrice);
        addColumn: (SpStringTableColumn title: 'Total' evaluated: #calculerTotal).

	tableFacture := self newList.
	labelFacture := self newLabel
						label: 'FACTURE'.
						
						
	boutonGenererFacture := self newButton
			label: 'Enregistrer Facture';
			action: [  ].
								
		labelBoissons := self newLabel 
							label: 'BOISSONS'
							
							.
		boutonBoisson1 := self newButton
							label: 'Pepsi';
							action: [ self boutonPepsiAction].
		boutonBoisson2 := self newButton 
								label: 'Coca';
								action: [ self boutonCocaAction ].
		boutonBoisson3 := self newButton 
							label: 'Orangina';
							action: [ self boutonOranginaAction ].
			"-------------------------"	
		labelPlat := self newLabel
					label: 'Les PLats'.
		boutonPlat1 := self newButton 
						label: 'Spaghetti à la bolognaise';
						action: [ self boutonPlat1Action ].
		boutonPlat2 := self newButton 
						label: 'Poulet rôti';
						action: [ self boutonPlat2Action  ].
		boutonPlat3 := self newButton 
						label: 'Sushi assorti';
						action: [ self boutonPlat3Action ].
		"-------------------------"	
		labelDessert := self newLabel
					label: 'Les Desserts'.	
		boutonDessert1 := self newButton 
						label: 'Tarte aux pommes';
						action: [ self boutonDessert1Action  ].
		boutonDessert2 := self newButton 
						label: 'Mousse au chocolat';
						action: [ self boutonDessert2Action  ].
		boutonDessert3 := self newButton 
						label: 'Crème brûlée';
						action: [ self boutonDessert3Action  ].
	"---------------------------------"
	boutonTotal := self newButton
						label: 'TOTAL FACTURE';
						color: Color gray ;
						action: [ self boutonTotalAction ].
	boutonAnnuler := self newButton 
						label: 'ANNULER LA VENTE';
						color: Color red;
						action: [ self boutonAnnulerAction ];
						help: 'Annuler la commande'.
			
				! !


!Caisse methodsFor: 'accessing' stamp: 'saintHeraud 2/23/2024 10:07'!
labelDate
    ^ labelDate
! !

!Caisse methodsFor: 'accessing' stamp: 'saintHeraud 2/23/2024 10:06'!
labelBoissons
    ^ labelBoissons! !

!Caisse methodsFor: 'accessing' stamp: 'saintHeraud 3/12/2024 15:00'!
collectionDesVentes
	^collectionDesVentes.! !

!Caisse methodsFor: 'accessing' stamp: 'saintHeraud 2/23/2024 10:07'!
labelUtilisateur
    ^ labelUtilisateur! !

!Caisse methodsFor: 'accessing' stamp: 'saintHeraud 2/23/2024 10:05'!
labelDessert
    ^ labelDessert.! !

!Caisse methodsFor: 'accessing' stamp: 'saintHeraud 3/15/2024 10:29'!
layout 

	|w|
	w:= self window.
	w extent: 900@500.
	w color: Color white.

	self window title: 'Gestion de vente';
			centered.
			

^SpGridLayout new

		add: labelDate at: 1@1;
		add: labelUtilisateur at: 3@1;
		
		add: tableDeVente at:1@6 span: 1@500;
		
		add: labelBoissons at:2@4 ;
		add: boutonBoisson1 at:2@6 ;
		add: boutonBoisson2 at:2@7;
		add: boutonBoisson3 at: 2@8;
		"-------------------------"	
		add: labelPlat at: 3@4;
		add: boutonPlat1 at:3@6;
		add: boutonPlat2 at:3@7;
		add: boutonPlat3 at:3@8;
		"-------------------------"	
		add: labelDessert at: 4@4;
		add: boutonDessert1 at:4@6;
		add: boutonDessert2 at: 4@7;
		add: boutonDessert3 at:4@8;
		"--------"
		add: boutonTotal at: 1@26;
		add: boutonAnnuler at:1@28;
		add: boutonGenererFacture at:1@30;
		add: boutonDeconnexion at: 2@30;
		
		add: labelFacture at: 2@18;
		add: tableFacture at: 2@20 span: 1@100.
		
		
		
		
		
		
		! !

!Caisse methodsFor: 'accessing' stamp: 'saintHeraud 2/23/2024 10:06'!
tableDeVente
    ^ tableDeVente! !

!Caisse methodsFor: 'accessing' stamp: 'saintHeraud 2/23/2024 10:06'!
labelPlat
    ^ labelPlat
! !


!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/12/2024 17:13'!
boutonAnnulerAction
	self annulationDeLaVente
	"tableFacture items: ''."! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/12/2024 13:44'!
boutonCocaAction "Ce bouton ajoutera à chaque fois le coca dans la table si le bouton est cliqué"
| boisson existant | "Deux variables"

"Existant permet de détecter l'instance d'un objet(boisson dans notre cas)"

	boisson := Boissons new. "Comme le coca est une Boisson"
	boisson setNomDuProduit: 'Coca'. "On lui donne un nom"
	boisson setPrixUnitaireDuProduit: 2.5. "Un prix unitaire"
	boisson setQuantiteDuProduit: 1. "Le premier clique signifie que la qtité est à 1"

		existant := collectionDesVentes detect: [:b | b getNomDuProduit = boisson getNomDuProduit] ifNone: [nil]. "On cherche l'instance de Coca dans notre collection de vente, si ça n'existe pas, on renvoit nil" 
		
		existant ifNotNil: [ "si c'est pas nil, c'est que c'est présent, on pourra MAJ les valeurs lors de plusieurs cliques"
 existant setQuantiteDuProduit: existant getQuantiteDuProduit + boisson getQuantiteDuProduit.
] 
ifNil: [ "si ça n'existait pas, on l'ajoute dans la collection de vente"
    collectionDesVentes add: boisson.
].

tableDeVente items: collectionDesVentes. "et enfin on pourra l'afficher dans notre table de vente"! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/12/2024 16:48'!
boutonTotalAction
	self facturaction.! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/15/2024 10:37'!
boutonPlat3Action
	 "Ce bouton ajoutera à chaque fois le coca dans la table si le bouton est cliqué"
| plat existant | "Deux variables"

"Existant permet de détecter l'instance d'un objet(plat dans notre cas)"

	plat := Plat  new. "Comme le coca est une Boisson"
	plat setNomDuProduit: 'Sushi assorti'. "On lui donne un nom"
	plat setPrixUnitaireDuProduit: 11. "Un prix unitaire"
	plat setQuantiteDuProduit: 1. "Le premier clique signifie que la qtité est à 1"

		existant := collectionDesVentes detect: [:b | b getNomDuProduit = plat getNomDuProduit] ifNone: [nil]. "On cherche l'instance de Coca dans notre collection de vente, si ça n'existe pas, on renvoit nil" 
		
		existant ifNotNil: [ "si c'est pas nil, c'est que c'est présent, on pourra MAJ les valeurs lors de plusieurs cliques"
 existant setQuantiteDuProduit: existant getQuantiteDuProduit + plat getQuantiteDuProduit.
] 
ifNil: [ "si ça n'existait pas, on l'ajoute dans la collection de vente"
    collectionDesVentes add: plat.
].

tableDeVente items: collectionDesVentes. "et enfin on pourra l'afficher dans notre table de vente"! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/12/2024 17:13'!
annulationDeLaVente

	^SpConfirmDialog new
		title: 'Annuler la vente';
		label: 'Vous êtes sûre dannuler la vente?';
		acceptLabel: 'Oui!!';
		cancelLabel: 'Non, continuez';
		label: 'Are you sure?';
		onAccept: [ collectionDesVentes removeAll.
						tableDeVente items: collectionDesVentes.
						tableFacture items: collectionDesVentes.
					];
		onCancel: [ self inform: 'ok!!' ];
		openDialog.
		! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/15/2024 10:38'!
boutonDessert2Action
	 "Ce bouton ajoutera à chaque fois le coca dans la table si le bouton est cliqué"
| dessert existant | "Deux variables"

"Existant permet de détecter l'instance d'un objet(desser dans notre cas)"

	dessert := Dessert new. "Comme le coca est une Boisson"
	dessert setNomDuProduit: 'Mousse au chocolat'. "On lui donne un nom"
	dessert setPrixUnitaireDuProduit: 2.5. "Un prix unitaire"
	dessert setQuantiteDuProduit: 1. "Le premier clique signifie que la qtité est à 1"

		existant := collectionDesVentes detect: [:b | b getNomDuProduit = dessert getNomDuProduit] ifNone: [nil]. "On cherche l'instance de Coca dans notre collection de vente, si ça n'existe pas, on renvoit nil" 
		
		existant ifNotNil: [ "si c'est pas nil, c'est que c'est présent, on pourra MAJ les valeurs lors de plusieurs cliques"
 existant setQuantiteDuProduit: existant getQuantiteDuProduit + dessert getQuantiteDuProduit.
] 
ifNil: [ "si ça n'existait pas, on l'ajoute dans la collection de vente"
    collectionDesVentes add: dessert.
].

tableDeVente items: collectionDesVentes. "et enfin on pourra l'afficher dans notre table de vente"! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/12/2024 13:46'!
boutonPepsiAction
 "Ce bouton ajoutera à chaque fois le coca dans la table si le bouton est cliqué"
| boisson existant | "Deux variables"

"Existant permet de détecter l'instance d'un objet(boisson dans notre cas)"

	boisson := Boissons new. "Comme le coca est une Boisson"
	boisson setNomDuProduit: 'Pepsi'. "On lui donne un nom"
	boisson setPrixUnitaireDuProduit: 2. "Un prix unitaire"
	boisson setQuantiteDuProduit: 1. "Le premier clique signifie que la qtité est à 1"

		existant := collectionDesVentes detect: [:b | b getNomDuProduit = boisson getNomDuProduit] ifNone: [nil]. "On cherche l'instance de Coca dans notre collection de vente, si ça n'existe pas, on renvoit nil" 
		
		existant ifNotNil: [ "si c'est pas nil, c'est que c'est présent, on pourra MAJ les valeurs lors de plusieurs cliques"
 existant setQuantiteDuProduit: existant getQuantiteDuProduit + boisson getQuantiteDuProduit.
] 
ifNil: [ "si ça n'existait pas, on l'ajoute dans la collection de vente"
    collectionDesVentes add: boisson.
].

tableDeVente items: collectionDesVentes. "et enfin on pourra l'afficher dans notre table de vente"! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/12/2024 13:47'!
boutonOranginaAction
 "Ce bouton ajoutera à chaque fois le coca dans la table si le bouton est cliqué"
| boisson existant | "Deux variables"

"Existant permet de détecter l'instance d'un objet(boisson dans notre cas)"

	boisson := Boissons new. "Comme le coca est une Boisson"
	boisson setNomDuProduit: 'Orangina'. "On lui donne un nom"
	boisson setPrixUnitaireDuProduit: 3. "Un prix unitaire"
	boisson setQuantiteDuProduit: 1. "Le premier clique signifie que la qtité est à 1"

		existant := collectionDesVentes detect: [:b | b getNomDuProduit = boisson getNomDuProduit] ifNone: [nil]. "On cherche l'instance de Coca dans notre collection de vente, si ça n'existe pas, on renvoit nil" 
		
		existant ifNotNil: [ "si c'est pas nil, c'est que c'est présent, on pourra MAJ les valeurs lors de plusieurs cliques"
 existant setQuantiteDuProduit: existant getQuantiteDuProduit + boisson getQuantiteDuProduit.
] 
ifNil: [ "si ça n'existait pas, on l'ajoute dans la collection de vente"
    collectionDesVentes add: boisson.
].

tableDeVente items: collectionDesVentes. "et enfin on pourra l'afficher dans notre table de vente"! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/12/2024 16:54'!
boutonEnregistrerFactureAction
! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/15/2024 10:38'!
boutonDessert1Action
	 "Ce bouton ajoutera à chaque fois le coca dans la table si le bouton est cliqué"
| dessert existant | "Deux variables"

"Existant permet de détecter l'instance d'un objet(desser dans notre cas)"

	dessert := Dessert new. "Comme le coca est une Boisson"
	dessert setNomDuProduit: 'Tarte aux pommes'. "On lui donne un nom"
	dessert setPrixUnitaireDuProduit: 3. "Un prix unitaire"
	dessert setQuantiteDuProduit: 1. "Le premier clique signifie que la qtité est à 1"

		existant := collectionDesVentes detect: [:b | b getNomDuProduit = dessert getNomDuProduit] ifNone: [nil]. "On cherche l'instance de Coca dans notre collection de vente, si ça n'existe pas, on renvoit nil" 
		
		existant ifNotNil: [ "si c'est pas nil, c'est que c'est présent, on pourra MAJ les valeurs lors de plusieurs cliques"
 existant setQuantiteDuProduit: existant getQuantiteDuProduit + dessert getQuantiteDuProduit.
] 
ifNil: [ "si ça n'existait pas, on l'ajoute dans la collection de vente"
    collectionDesVentes add: dessert.
].

tableDeVente items: collectionDesVentes. "et enfin on pourra l'afficher dans notre table de vente"! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/15/2024 10:38'!
boutonDessert3Action
	 "Ce bouton ajoutera à chaque fois le coca dans la table si le bouton est cliqué"
| dessert existant | "Deux variables"

"Existant permet de détecter l'instance d'un objet(desser dans notre cas)"

	dessert := Dessert new. "Comme le coca est une Boisson"
	dessert setNomDuProduit: 'Crème brûlée'. "On lui donne un nom"
	dessert setPrixUnitaireDuProduit: 5. "Un prix unitaire"
	dessert setQuantiteDuProduit: 1. "Le premier clique signifie que la qtité est à 1"

		existant := collectionDesVentes detect: [:b | b getNomDuProduit = dessert getNomDuProduit] ifNone: [nil]. "On cherche l'instance de Coca dans notre collection de vente, si ça n'existe pas, on renvoit nil" 
		
		existant ifNotNil: [ "si c'est pas nil, c'est que c'est présent, on pourra MAJ les valeurs lors de plusieurs cliques"
 existant setQuantiteDuProduit: existant getQuantiteDuProduit + dessert getQuantiteDuProduit.
] 
ifNil: [ "si ça n'existait pas, on l'ajoute dans la collection de vente"
    collectionDesVentes add: dessert.
].

tableDeVente items: collectionDesVentes. "et enfin on pourra l'afficher dans notre table de vente"! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/15/2024 10:35'!
boutonPlat1Action
	 "Ce bouton ajoutera à chaque fois le coca dans la table si le bouton est cliqué"
| plat existant | "Deux variables"

"Existant permet de détecter l'instance d'un objet(Plat1 dans notre cas)"

	plat := Plat new. "Comme le coca est une Boisson"
	plat setNomDuProduit: 'Spaghetti à la bolo'. "On lui donne un nom"
	plat setPrixUnitaireDuProduit: 7. "Un prix unitaire"
	plat setQuantiteDuProduit: 1. "Le premier clique signifie que la qtité est à 1"

		existant := collectionDesVentes detect: [:p | p getNomDuProduit = plat getNomDuProduit] ifNone: [nil]. "On cherche l'instance de Coca dans notre collection de vente, si ça n'existe pas, on renvoit nil" 
		
		existant ifNotNil: [ "si c'est pas nil, c'est que c'est présent, on pourra MAJ les valeurs lors de plusieurs cliques"
 existant setQuantiteDuProduit: existant getQuantiteDuProduit + plat getQuantiteDuProduit.
] 
ifNil: [ "si ça n'existait pas, on l'ajoute dans la collection de vente"
    collectionDesVentes add: plat.
].

tableDeVente items: collectionDesVentes. "et enfin on pourra l'afficher dans notre table de vente"! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/15/2024 10:40'!
facturaction
    | facture totalCommande |
    facture := OrderedCollection new.
    facture add: 'Produit        Pu       Qte       Total'.
    facture add: '----------------------------------------'.

    totalCommande := 0.

    collectionDesVentes do: [:element |
        | produit qte pu total |
        produit := element getNomDuProduit.
        qte := element getQuantiteDuProduit.
        pu := element getPrice.
        total := element calculerTotal.

        facture add: (produit, '     		', pu printString, '€', '     		', qte printString, '     		', total printString, '€').

        totalCommande := totalCommande + total
    ].

	
	 facture add: '----------------------------------------'.
	 facture add: DateAndTime  now asDateAndTime.
    facture add: 'Total de la commande: ', totalCommande printString, '€'.

    tableFacture items: facture asArray.
    
    ^ facture! !

!Caisse methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/15/2024 10:37'!
boutonPlat2Action
	 "Ce bouton ajoutera à chaque fois le coca dans la table si le bouton est cliqué"
| plat existant | "Deux variables"

"Existant permet de détecter l'instance d'un objet(plat dans notre cas)"

	plat := Plat  new. "Comme le coca est une Boisson"
	plat setNomDuProduit: 'Poulet rôti'. "On lui donne un nom"
	plat setPrixUnitaireDuProduit: 12. "Un prix unitaire"
	plat setQuantiteDuProduit: 1. "Le premier clique signifie que la qtité est à 1"

		existant := collectionDesVentes detect: [:b | b getNomDuProduit = plat getNomDuProduit] ifNone: [nil]. "On cherche l'instance de Coca dans notre collection de vente, si ça n'existe pas, on renvoit nil" 
		
		existant ifNotNil: [ "si c'est pas nil, c'est que c'est présent, on pourra MAJ les valeurs lors de plusieurs cliques"
 existant setQuantiteDuProduit: existant getQuantiteDuProduit + plat getQuantiteDuProduit.
] 
ifNil: [ "si ça n'existait pas, on l'ajoute dans la collection de vente"
    collectionDesVentes add: plat.
].

tableDeVente items: collectionDesVentes. "et enfin on pourra l'afficher dans notre table de vente"! !
