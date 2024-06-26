'From Pharo11.0.0 of 15 January 2024 [Build information: Pharo-11.0.0+build.721.sha.d5a832027715be24ea99a180b36da45cfe189a99 (64 Bit)] on 12 April 2024 at 9:45:39.113 am'!
TestCase subclass: #CreationDeCompteTest
	instanceVariableNames: 'creation'
	classVariableNames: ''
	package: 'ProjetBonnesPratiques'!

!CreationDeCompteTest methodsFor: 'running' stamp: 'saintHeraud 2/6/2024 15:46'!
setUp
	"super setUp."
	 creation := CreationDeCompte new.

	"Put here a common initialization logic for tests"! !


!CreationDeCompteTest methodsFor: 'tests' stamp: 'saintHeraud 2/20/2024 15:34'!
testAnneeDeNaissanceCorrecte

	self assert: (creation anneeDeNaissanceEstCorrecte: 2000)  equals: 2000.! !

!CreationDeCompteTest methodsFor: 'tests' stamp: 'saintHeraud 3/12/2024 20:03'!
testEnregistreData

	| model |
	model := ModelCreationDeCompte new.


	"Simule la récupération des données depuis self (en supposant que self a des données valides)"
	model recupData: creation.

	"Simule le fait que l'utilisateur n'existe pas"
	model verifierUtilisateur: creation.

	"Tentative d'enregistrement des données"
	model saveData2: creation! ! 

!CreationDeCompteTest methodsFor: 'tests' stamp: 'saintHeraud 3/12/2024 20:13'!
testJourDeNaissanceEstCorrect

	self should: [ creation jourDeNaissanceEstCorrect: 10 ] raise: Error. "Vérifiez qu'une erreur est levée avec un jour valide"

	self
		should: [ creation jourDeNaissanceEstCorrect: 'abc' ]
		raise: Error. "Vérifiez qu'une erreur est levée avec un jour non entier"

	self should: [ creation jourDeNaissanceEstCorrect: 0 ] raise: Error. "Vérifiez qu'une erreur est levée avec un jour inférieur à 1"

	self should: [ creation jourDeNaissanceEstCorrect: 32 ] raise: Error. "Vérifiez qu'une erreur est levée avec un jour supérieur à 31"
	self assert: (creation jourDeNaissanceEstCorrect: 15) equals: 15! !

!CreationDeCompteTest methodsFor: 'tests' stamp: 'saintHeraud 2/20/2024 15:44'!
testGenreEstCorrect
	|x y|
	
	x := creation champGenre.
	x text: 'homme'.
	
	y := creation champGenre.
	y text: 'femme'.
	
	self assert: (creation genreEstCorrect ) equals: x text.
	self assert: (creation genreEstCorrect ) equals: y text.
	
	! !

!CreationDeCompteTest methodsFor: 'tests' stamp: 'saintHeraud 2/20/2024 15:37'!
testJourDeNaissanceCorrecte

	self assert: (creation jourDeNaissanceEstCorrect: 12)  equals: 12.
	! !
