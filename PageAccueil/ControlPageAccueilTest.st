'From Pharo11.0.0 of 15 January 2024 [Build information: Pharo-11.0.0+build.721.sha.d5a832027715be24ea99a180b36da45cfe189a99 (64 Bit)] on 12 April 2024 at 9:45:39.094 am'!
TestCase subclass: #ControlPageAccueilTest
	instanceVariableNames: 'controleur'
	classVariableNames: ''
	package: 'ProjetBonnesPratiques'!

!ControlPageAccueilTest methodsFor: 'running' stamp: 'saintHeraud 3/12/2024 18:28'!
setUp
	super setUp. 

	"Put here a common initialization logic for tests"
	controleur := ControlPageAccueil new.! !


!ControlPageAccueilTest methodsFor: 'tests' stamp: 'saintHeraud 3/12/2024 18:34'!
testVerifierMotDePasse

	| pageDeConnection |
	
	pageDeConnection := PageAccueil new.
	pageDeConnection champMotDePasse text: '123456'.

	"Créer un fichier utilisateur.json avec un utilisateur contenant le mot de passe 'password'"
	"We assume that the file exists and contains a user with the password 'password'"
	self
		assert: (controleur  verifierMotDePasse: pageDeConnection )
		equals: (pageDeConnection champMotDePasse text).
! !

!ControlPageAccueilTest methodsFor: 'tests' stamp: 'saintHeraud 3/12/2024 18:33'!
testVerifierEmail
	
	| pageDeConnection |
	
	pageDeConnection := PageAccueil new.
	pageDeConnection champEmail  text: 'saintheraudmbouma8@gmail.com'.

	"Créer un fichier utilisateur.json avec un utilisateur contenant le mot de passe 'password'"
	"We assume that the file exists and contains a user with the password 'password'"
	self
		assert: (controleur  verifierEmail: pageDeConnection )
		equals: (pageDeConnection champEmail text).
! !
