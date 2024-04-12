'From Pharo11.0.0 of 15 January 2024 [Build information: Pharo-11.0.0+build.721.sha.d5a832027715be24ea99a180b36da45cfe189a99 (64 Bit)] on 12 April 2024 at 9:45:39.159 am'!
TestCase subclass: #PageAccueilTest
	instanceVariableNames: 'page'
	classVariableNames: ''
	package: 'ProjetBonnesPratiques'!

!PageAccueilTest methodsFor: 'running' stamp: 'saintHeraud 3/12/2024 18:39'!
setUp
	super setUp.

	page := PageAccueil new.
	"Put here a common initialization logic for tests"! ! 
