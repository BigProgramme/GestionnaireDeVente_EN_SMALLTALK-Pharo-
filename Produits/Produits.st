'From Pharo11.0.0 of 15 January 2024 [Build information: Pharo-11.0.0+build.721.sha.d5a832027715be24ea99a180b36da45cfe189a99 (64 Bit)] on 12 April 2024 at 9:45:39.164 am'!
Object subclass: #Produits
	instanceVariableNames: 'nomDuProduit quantiteDuProduit prixUnitaire'
	classVariableNames: ''
	package: 'ProjetBonnesPratiques'!

!Produits methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/23/2024 09:40'!
getPrice
	^prixUnitaire.! !

!Produits methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/23/2024 09:42'!
setQuantiteDuProduit: uneQuantite
	quantiteDuProduit := uneQuantite.! !
 
!Produits methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/23/2024 09:44'!
calculerTotal
	^(self getPrice * self getQuantiteDuProduit).! !

!Produits methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/23/2024 09:42'!
setPrixUnitaireDuProduit: unNombre
	prixUnitaire := unNombre.! !

!Produits methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/23/2024 09:41'!
getQuantiteDuProduit
	^quantiteDuProduit.! !

!Produits methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/23/2024 09:41'!
setNomDuProduit: unNom
	nomDuProduit := unNom.! !

!Produits methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/23/2024 09:40'!
getNomDuProduit
	^nomDuProduit.! !
