'From Pharo11.0.0 of 15 January 2024 [Build information: Pharo-11.0.0+build.721.sha.d5a832027715be24ea99a180b36da45cfe189a99 (64 Bit)] on 12 April 2024 at 9:45:39.122 am'!
Object subclass: #ModelCreationDeCompte
	instanceVariableNames: 'nom prenom email motDePasse jourDeNaissance moisDeNaissance anneeDeNaissance genre'
	classVariableNames: ''
	package: 'ProjetBonnesPratiques'!

!ModelCreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/18/2024 21:03'!
getGenre
	^genre.! !

!ModelCreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/18/2024 20:53'!
getPrenom
	^prenom.! !

!ModelCreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/18/2024 21:01'!
getNom
	^nom.! !

!ModelCreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/18/2024 21:02'!
getMois
	^moisDeNaissance.! !

!ModelCreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/18/2024 21:03'!
getEmail
	^email.! !

!ModelCreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/18/2024 21:04'!
getAnnee
	^anneeDeNaissance.! !

!ModelCreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/18/2024 21:02'!
getJourDeNaisse
	^jourDeNaissance.! !

!ModelCreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/22/2024 19:53'!
validateData
    "Cette méthode vérifie si toutes les informations nécessaires ont été saisies"
	"Si tout est saisi, ça renvoit un nil."
	"La méthode trim permet de supprimer les espaces devant et derrière une str."

    | trimmedNom trimmedPrenom trimmedEmail trimmedMotDePasse trimmedGenre |

    trimmedNom := self getNom trim.
    trimmedPrenom := self getPrenom trim.
    trimmedEmail := self getEmail trim.
    trimmedMotDePasse := self getMotDePasse trim.
    trimmedGenre := self getGenre trim.

    (trimmedNom isEmpty)
        ifTrue: [^self inform: 'Veuillez saisir votre nom.'].
    
    (trimmedPrenom isEmpty)
        ifTrue: [^ 'Veuillez saisir votre prénom.'].
    
    (trimmedEmail isEmpty)
        ifTrue: [^self inform: 'Veuillez saisir votre email.'].
    
    (trimmedMotDePasse isEmpty)
        ifTrue: [^self inform: 'Veuillez saisir votre mot de passe.'].
    
    (trimmedGenre isEmpty)
        ifTrue: [^self inform: 'Veuillez sélectionner votre genre.'].
    
    ^ nil
! ! 

!ModelCreationDeCompte methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/22/2024 21:42'!
"Cette méthode permet de vérifier si l'utilisateur existe ou pas dans notre bdd"
verifierUtilisateur: dataSaisie
    | leNom lePrenom leMail fichier contenu jsonObject stream |
    
	"On veut vérifier le nom, le prénom et le mail"
    leMail := dataSaisie champEmail text trim.
    lePrenom := dataSaisie champPrenom text trim.
    leNom := dataSaisie champNom text trim.
    
    fichier := 'utilisateur.json' asFileReference.
    stream := fichier readStream. "on Ouvre le fichier en mode lecture"
    contenu := stream contents. "on récupère le contenu du fichier"
	 
	contenu isEmpty ifTrue: [^ false]. "Si le fichier est vide, l'utilisateur pourra s'enregistrer sans problème."
	
    jsonObject := STONJSON fromString: contenu. "on génère le JSON à partir du contenu"
    

	"Je vais parcourir le fichier pour récupérer les infos des utilisateurs inscrits"
    jsonObject do: [:utilisateur |
        ((utilisateur at: #Email) = leMail 
            and: [(utilisateur at: #Nom) = leNom 
            and: [(utilisateur at: #Prenom) = lePrenom]
						]) 
							ifTrue: [
                "Si l'email, le nom et le prénom correspondent, on informe l'utilisateur"
                stream close. "on ferme le flux de lecture"
                ^true.
            ]
    ].
    stream close. "là on ferme le flux de lecture"
    ^ false. "Aucun utilisateur correspondant trouvé, donc l'utilisateur n'existe pas dans la BDD, il pourrait donc s'enregistrer"
! !


!ModelCreationDeCompte methodsFor: 'initialization' stamp: 'saintHeraud 2/18/2024 21:02'!
getMotDePasse
	^motDePasse.! !

!ModelCreationDeCompte methodsFor: 'initialization' stamp: 'saintHeraud 2/18/2024 21:36'!
recupData: dataSaisie

    self setNom: dataSaisie champNom text.
    self setPrenom: dataSaisie champPrenom text.
    self setMail: dataSaisie champEmail text.
    self setMotDePasse:  dataSaisie champMotDePasse text.
    self setJour: dataSaisie champJourDeNaissance text.
    self setMois: dataSaisie champMoisDeNaissance text.
    self setAnnee: dataSaisie champAnneeDeNaissance text.
    self setGenre: dataSaisie champGenre text.! !

!ModelCreationDeCompte methodsFor: 'initialization' stamp: 'saintHeraud 2/5/2024 09:36'!
setGenre: unGenre
	genre  := unGenre.
	! !

!ModelCreationDeCompte methodsFor: 'initialization' stamp: 'saintHeraud 2/5/2024 09:40'!
setJour: jour
	jourDeNaissance   := jour.
	! !

!ModelCreationDeCompte methodsFor: 'initialization' stamp: 'saintHeraud 2/5/2024 09:37'!
setAnnee: annee
	anneeDeNaissance   := annee.
	! !

!ModelCreationDeCompte methodsFor: 'initialization' stamp: 'saintHeraud 3/15/2024 10:02'!
"Cette méthode permettra d'enregistrer les données lors de l'inscription de l'utilisateur."
saveData2: dataSaisie

	| jsonObject jsonString existingData stream validationError utilisateurExiste |
	
	"La variable utilisateurExiste reprendra juste la valeur de la méthode qui permet de vérifier si l'utilisateur existe ou pas, sachant qu'elle renvoie true si l'utilisateur existe!!"
	utilisateurExiste := self verifierUtilisateur: dataSaisie.
	
	"Et donc, si c'est true--> l'utilisateur existe, on envoie un message!!"
    utilisateurExiste ifTrue: [^ self inform: 'Vous êtes déjà inscrit, connectez-vous!!'].

	"La méthode validateData permet de vérifier si l'utilisateur a rentré tous les champs avant de s'enregistrer. Elle renvoie nil si tout est rentré."
	validationError := self validateData.
    validationError ifNotNil: [^ validationError].

"---------------------------------------------------------------"
"Si tout est ok, on pourra alors sauvegarder les données donc enregistrer le nouvel utilisateur dans notre base de données."

	"je créé un dictionnaire pour le stockage des nouvelles données {key: value}"
	jsonObject := Dictionary new
		              at: 'Nom' put: self getNom; 
		              at: 'Prenom' put: self getPrenom;
		              at: 'Email' put: self getEmail;
		              at: 'Mot de passe' put: self getMotDePasse;
		              at: 'Date de naissance'
		              put:
			              self getJourDeNaisse , '/' , self getMois , '/'
			              , self getAnnee;
		              at: 'Genre' put: self getGenre;
		              yourself.

	"Convertion des nouvelles données en une chaîne JSON"
	"lien documentation:"
	"https://github.com/pharo-open-documentation/pharo-wiki/blob/master/ExternalProjects/Export/JSON.md#stonjson"
	jsonString := STONJSON toString: jsonObject.

	"je vérifie si le fichier existe déjà"
	self fichierJson exists
		ifTrue: [ "Je lis et prends le contenu actuel du fichier"
			existingData := self fichierJson contents. "existingData n'est rien d'autre que le contenu de notre bdd."

			"On vérifie si le fichier est vide ou s'il n'y a pas de données JSON valides"
			jsonString := existingData isEmptyOrNil 
											"Si c'est nil, j'ajoute mes données json"
				              ifTrue: [ '[' , jsonString , ']' ] "Les '[' c'est pour la construction de mon .json"	
									"Sinon, les lignes de code parlent d'elles-même "
				              ifFalse: [
				              existingData
					              copyReplaceAll: ']' "copyReplaceAll: with:"
					              with: ',' , jsonString , ']' ] ]
		ifFalse: [ "Si le fichier n'existe pas encore, je créé un tableau JSON contenant les nouvelles données"
			jsonString := '[' , jsonString , ']' ].

	"et là on écrit la chaîne JSON mise à jour dans le fichier"
	stream := self fichierJson writeStream.
	stream nextPutAll: jsonString.
	stream close.
	self inform: 'Enregistrement réussi!!'
! !

!ModelCreationDeCompte methodsFor: 'initialization' stamp: 'saintHeraud 2/5/2024 09:36'!
setMotDePasse: unMotDePasse
	motDePasse  := unMotDePasse.
	! !

!ModelCreationDeCompte methodsFor: 'initialization' stamp: 'saintHeraud 2/5/2024 21:50'!
setPrenom: unPrenom
	prenom := unPrenom.! !

!ModelCreationDeCompte methodsFor: 'initialization' stamp: 'saintHeraud 2/5/2024 09:35'!
setMail: unMail
	email := unMail.
	! !

!ModelCreationDeCompte methodsFor: 'initialization' stamp: 'saintHeraud 2/19/2024 07:55'!
fichierJson

	|file|
	
	file := 'utilisateur.json' asFileReference.

	^file.! !

!ModelCreationDeCompte methodsFor: 'initialization' stamp: 'saintHeraud 2/5/2024 09:40'!
setMois: mois
	moisDeNaissance    := mois.
	! !

!ModelCreationDeCompte methodsFor: 'initialization' stamp: 'saintHeraud 2/5/2024 09:35'!
setNom: unNom
	nom:= unNom.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ModelCreationDeCompte class
	instanceVariableNames: ''!

!ModelCreationDeCompte class methodsFor: 'testing' stamp: 'saintHeraud 2/7/2024 14:21'!
isVoyageRoot 
	^true.! !
