'From Pharo11.0.0 of 15 January 2024 [Build information: Pharo-11.0.0+build.721.sha.d5a832027715be24ea99a180b36da45cfe189a99 (64 Bit)] on 12 April 2024 at 9:45:39.085 am'!
Object subclass: #ControlPageAccueil
	instanceVariableNames: 'pageAccueil'
	classVariableNames: ''
	package: 'ProjetBonnesPratiques'!

!ControlPageAccueil methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/15/2024 10:23'!
verifierMotDePasse: pageDeConnection

	 | file contenu stream jsonObjet mdp |
	
	"Je prends le mdp de la page de connection, celui que le user aura rentré."
    mdp := pageDeConnection champMotDePasse text trim. 
    
 	"Je vais chercher mon fichier ou ma base de données."   
	file := 'utilisateur.json' asFileReference. 

    stream := file readStream. "j'ouvre le fichier en mode lecture"

    contenu := stream contents. "Je récupère le contenu du fichier"

    jsonObjet := STONJSON fromString: contenu. "je génère le json à partir du contenu"

    "Parcourir les utilisateurs dans la base de données"
    jsonObjet do: [ :each |
        (each at: #'Mot de passe') = mdp ifTrue: [
            "Si le mdp correspond, on sort de la boucle en renvoyant le mdp trouvé."
            ^mdp
            
        ]
			
    ].
stream close.

"Si le mdp n'est pas trouvé dans la boucle, on informe que l'email est 			incorrect ou inexistant"
			
^self inform: 'Mot de passe incorrect'
				! !

!ControlPageAccueil methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/15/2024 10:17'!
verifierEmail: pageDeConnection

	 | file contenu stream jsonObjet email |
	
	"Je prends l'email de la page de connection, celui que le user aura rentré."
    email := pageDeConnection champEmail text trim.
    
 	"Je vais chercher mon fichier ou ma base de données."   
	file := 'utilisateur.json' asFileReference. 

    stream := file readStream. "j'ouvre le fichier en mode lecture"

    contenu := stream contents. "Je récupère le contenu du fichier"

    jsonObjet := STONJSON fromString: contenu. "je génère le json à partir du contenu"

    "Parcourir les utilisateurs dans la base de données"
    jsonObjet do: [ :each |
        (each at: #Email) = email ifTrue: [
            "Si l'email correspond, on sort de la boucle en renvoyant l'email trouvé"
            ^email.
            
        ]
			
    ].
stream close.
"Si l'email n'est pas trouvé dans la boucle, on informe que l'email est 			incorrect ou inexistant"
			
^self inform: 'Email incorrect ou inexistant'
				! !


!ControlPageAccueil methodsFor: 'accessing' stamp: 'saintHeraud 2/20/2024 13:15'!
page: unePage
	pageAccueil := unePage.! !

!ControlPageAccueil methodsFor: 'accessing' stamp: 'saintHeraud 3/12/2024 18:36'!
page
	^pageAccueil.! !


!ControlPageAccueil methodsFor: 'initialization' stamp: 'saintHeraud 2/20/2024 13:19'!
initialize 
	pageAccueil := PageAccueil new.! !
