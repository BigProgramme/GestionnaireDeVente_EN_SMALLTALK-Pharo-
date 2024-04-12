'From Pharo11.0.0 of 15 January 2024 [Build information: Pharo-11.0.0+build.721.sha.d5a832027715be24ea99a180b36da45cfe189a99 (64 Bit)] on 12 April 2024 at 9:45:39.101 am'!
SpPresenter subclass: #CreationDeCompte
	instanceVariableNames: 'labelPrincipal labelDate labelGenre champNom champPrenom champEmail champMotDepasse champJourNaissance champMoisDeNaisse champAnneeDeNaissance champGenre labelQuestionCompte boutonInscription boutonConnection model'
	classVariableNames: ''
	package: 'ProjetBonnesPratiques'!

!CreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/18/2024 17:48'!
moisDeNaissanceEstCorrect: mois
    "Vérifie si le mois de naissance est correct."
    (mois isInteger and: [ mois > 0 and: [ mois <= 12 ]]) 
				ifFalse: [ self inform: 'Entrer un mois valide'].! !

!CreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/19/2024 14:46'!
boutonConnecterAction
	
	PageAccueil new open. 
	
self window close.! !

!CreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/20/2024 15:35'!
jourDeNaissanceEstCorrect: jour
    "Vérifie si le jour de naissance est correct."
    (jour isInteger and: [ jour > 0 and: [ jour <= 31 ]])
			ifFalse: [ self inform: 'Veuillez entrer un jour valide' ].
			^jour.! !

!CreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/16/2024 22:59'!
boutonInscriptionAction

	
	self genreEstCorrect.
	self anneeDeNaissanceEstCorrecte: champAnneeDeNaissance text trim asInteger.
	self moisDeNaissanceEstCorrect: champMoisDeNaisse text trim asInteger.
	self jourDeNaissanceEstCorrect: champJourNaissance text trim asInteger.
	self enregistreData.
	
	PageAccueil new open.
	self window close.
	
	
	! !


!CreationDeCompte methodsFor: 'initialization - deprecated' stamp: 'saintHeraud 2/19/2024 22:14'!
initializePresenter
	
	
	labelPrincipal := self newLabel 
							label: 'CREER VOTRE COMPTE'
							.			
										
	champNom := self newTextInput 
					placeholder: 'Nom de famille'.
	champPrenom := self newTextInput
					placeholder: 'Prénom'.
					
	champEmail := self newTextInput
						placeholder: 'Email'.
	champMotDepasse := self newTextInput
						placeholder: 'Nouveau Mot de passe'.
						
	labelDate := self newLabel 
					label: 'Date de naissance'.
					
	champJourNaissance := self newTextInput
							placeholder: 'JJ'.
	champMoisDeNaisse := self newTextInput
							placeholder: 'MM'.
	champAnneeDeNaissance := self newTextInput 
								placeholder: 'AAAA'.
								
	labelGenre := self newLabel
					label: 'Genre'.
	champGenre := self newTextInput
		placeholder: 'Homme ou Femme'.
	"
	radiogroup := SpRadioButtonPresenter new.
	
	femme := self newRadioButton  
				label: 'femme';
				
				initialStateNotSet;
				labelClickable: true
				.
				
	homme := self newRadioButton   
		label: 'Homme';
		
		initialStateNotSet;
		labelClickable: true
		""associatedRadioButtons: (OrderedCollection new add: femme)""."
		
	"	
	radiogroup add: femme.
	radiogroup add: homme.
		"
	
	boutonInscription := self newButton 
							label: 'S"inscrire';
							icon: (self iconNamed: #thumbsUp);
							action: [ self boutonInscriptionAction].
							
	labelQuestionCompte := self newLabel 
								label: 'Vous avez déjà un compte?'
								.
	boutonConnection := self newButton 
						label: 'Connectez-vous';
						action: [self boutonConnecterAction ].
	
		
			
	! !


!CreationDeCompte methodsFor: 'accessing' stamp: 'saintHeraud 3/15/2024 09:52'!
enregistreData
	model := ModelCreationDeCompte new.
	model recupData: self.
	"model verifierUtilisateur: self."
	model saveData2: self.
	! !

!CreationDeCompte methodsFor: 'accessing' stamp: 'saintHeraud 2/18/2024 18:39'!
champGenre
	^champGenre.! !

!CreationDeCompte methodsFor: 'accessing' stamp: 'saintHeraud 2/20/2024 15:41'!
genreEstCorrect
    | genresValides |

	"Je stocke les genre dans une liste"
    genresValides := #('Femme' 'femme' 'Homme' 'homme'). 
		
	  "On vérifie que le genre est bien valide sinon on envoie un message d'erreur"	
    (genresValides includes: champGenre text trim) ifFalse: [
        self inform: 'Le genre doit être spécifié comme "Femme" ou "Homme".' ] ifTrue: [^self champGenre text].
			"champGenre .
   "" ^genre text."""
! !

!CreationDeCompte methodsFor: 'accessing' stamp: 'saintHeraud 2/5/2024 21:38'!
champEmail
	^champEmail! !

!CreationDeCompte methodsFor: 'accessing' stamp: 'saintHeraud 2/5/2024 21:39'!
champAnneeDeNaissance
	^champAnneeDeNaissance! !

!CreationDeCompte methodsFor: 'accessing' stamp: 'saintHeraud 2/5/2024 21:38'!
champMoisDeNaissance
	^champMoisDeNaisse! !

!CreationDeCompte methodsFor: 'accessing' stamp: 'saintHeraud 2/5/2024 21:37'!
champNom
	^champNom.! !

!CreationDeCompte methodsFor: 'accessing' stamp: 'saintHeraud 2/5/2024 21:38'!
champJourDeNaissance
	^champJourNaissance! !

!CreationDeCompte methodsFor: 'accessing' stamp: 'saintHeraud 2/20/2024 15:29'!
anneeDeNaissanceEstCorrecte: annee
    "Vérifie si l'année de naissance est correcte"
    (annee isInteger and: [ annee > 1900 and: [ annee <= Date today year ]])
		ifFalse: [self inform: 'Entrer une année valide'].
		^annee.
		
	
	! !

!CreationDeCompte methodsFor: 'accessing' stamp: 'saintHeraud 2/5/2024 21:37'!
champPrenom
	^champPrenom.! !

!CreationDeCompte methodsFor: 'accessing' stamp: 'saintHeraud 2/5/2024 21:39'!
champMotDePasse
	^champMotDepasse! !

!CreationDeCompte methodsFor: 'accessing' stamp: 'saintHeraud 2/18/2024 18:38'!
layout 

	self window title: 'CREATION DE COMPTE'.
	self window centered.
	self window extent: 525@450.
	self window resizable: false.

	
^SpGridLayout new
	
		add: labelPrincipal at: 2@1;
		
		add: champNom at: 1@5;
		add: champPrenom at: 2@5 span: 2@1;
		
		add: champEmail at: 1@9 span: 3@1;
		add: champMotDepasse at: 1@10 span: 3@1;
		
		add: labelDate at: 1@12;
		
		add: champJourNaissance at: 1@13;
		add: champMoisDeNaisse at: 2@13;
		add: champAnneeDeNaissance at: 3@13;
		
		add: labelGenre at: 1@17;
		
		
		add: champGenre at: 1@18;
		
		
		add: boutonInscription at: 2@27;
		
		add: labelQuestionCompte at: 1@30;
		add: boutonConnection at: 2@30.! !
