'From Pharo11.0.0 of 15 January 2024 [Build information: Pharo-11.0.0+build.721.sha.d5a832027715be24ea99a180b36da45cfe189a99 (64 Bit)] on 12 April 2024 at 9:45:39.188 am'!
TestCase subclass: #ProduitsTest
	instanceVariableNames: 'produit'
	classVariableNames: ''
	package: 'ProjetBonnesPratiques'!

!ProduitsTest methodsFor: 'running' stamp: 'saintHeraud 3/12/2024 14:04'!
setUp
	super setUp.

	produit := Produits new.! !


!ProduitsTest methodsFor: 'tests' stamp: 'saintHeraud 3/12/2024 19:18'!
testCalculerTotal

	produit setQuantiteDuProduit: 10.
	produit setPrixUnitaireDuProduit: 35.
	self assert: produit calculerTotal identicalTo: 350! ! 
