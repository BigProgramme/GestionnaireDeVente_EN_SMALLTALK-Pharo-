'From Pharo11.0.0 of 15 January 2024 [Build information: Pharo-11.0.0+build.721.sha.d5a832027715be24ea99a180b36da45cfe189a99 (64 Bit)] on 12 April 2024 at 9:45:39.141 am'!
TestCase subclass: #ModelCreationDeCompteTest
	instanceVariableNames: 'model'
	classVariableNames: ''
	package: 'ProjetBonnesPratiques'!

!ModelCreationDeCompteTest methodsFor: 'running' stamp: 'saintHeraud 3/12/2024 19:51'!
setUp
	 
	
	model := ModelCreationDeCompte  new.

	"Put here a common initialization logic for tests"! !


!ModelCreationDeCompteTest methodsFor: 'tests' stamp: 'saintHeraud 2/18/2024 22:39'!
testPrenom
		|unPrenom|
		unPrenom := 'Saint Heraud'.
		model setPrenom: unPrenom.
	self assert: (model getPrenom) equals: unPrenom.! !

!ModelCreationDeCompteTest methodsFor: 'tests' stamp: 'saintHeraud 2/18/2024 22:27'!
testFichierJson
	self assert: (model fichierJson isFile) equals: true.
	self assert: (model fichierJson extension) equals: 'json'.! !

!ModelCreationDeCompteTest methodsFor: 'tests' stamp: 'saintHeraud 3/12/2024 19:57'!
testSaveData2WhenUserExists 
	|user|
	user := CreationDeCompte new.
       
        model verifierUtilisateur: user.
        self should: [model saveData2: user] raise: Error.
    ! !

!ModelCreationDeCompteTest methodsFor: 'tests' stamp: 'saintHeraud 2/18/2024 22:37'!
testNom
		|unNom|
		unNom := 'MBOUMA'.
		model setNom: unNom.
	self assert: (model getNom) equals: unNom.! !

!ModelCreationDeCompteTest methodsFor: 'tests' stamp: 'saintHeraud 3/12/2024 19:46'!
testValidateDataAvecDataManquant
    
    
	 model setPrenom: 'Saint '.
    model setMail: 'alice@example.com'.
    model setMotDePasse:  'secret'.
    self assert: (model validateData) isNil.
! !
