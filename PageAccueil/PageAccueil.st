'From Pharo11.0.0 of 15 January 2024 [Build information: Pharo-11.0.0+build.721.sha.d5a832027715be24ea99a180b36da45cfe189a99 (64 Bit)] on 12 April 2024 at 9:45:39.149 am'!
SpPresenter subclass: #PageAccueil
	instanceVariableNames: 'labelPrincipal labelPrincipal1 labelInvitationEnregistrer champEmail champMotDePasse boutonConnection boutonNouveauCompte controleur caisse'
	classVariableNames: ''
	package: 'ProjetBonnesPratiques'!

!PageAccueil methodsFor: 'initialization - deprecated' stamp: 'saintHeraud 2/20/2024 13:20'!
initializePresenter

	labelPrincipal  := self newLabel
						label: '       BIENVENU SUR LA PAGE DE CONNECTION'.
	labelPrincipal1 := self newLabel
					label: 'CONNECTEZ-VOUS POUR ACCEDER AU SYSTEME'.
					
	
	labelInvitationEnregistrer := self newLabel
													label: 'Pas de compte?'.
						 
				
	champEmail := self newTextInput
						placeholder: 'Adresse mail'.
	champMotDePasse := self newTextInput
							placeholder: 'Mot de passe'.
	
	boutonNouveauCompte := self newButton
								label: 'Enregistrez-vous';
								color: Color blue;
								icon: (self iconNamed: #user);
								action: [ self boutonEnregistrerAction  ]
								yourself.
								
								
	boutonConnection := self newButton 
							label: 'Se connecter';
							action: [ self boutonConnecterAction ]
							
							"color: Color black;"
							yourself.! !


!PageAccueil methodsFor: 'accessing' stamp: 'saintHeraud 2/3/2024 22:21'!
layout

|window|

window  := self window.
window title: 'Page de Connection'.
window extent: 350@400.
window resizable: false.
window centered.

^SpGridLayout new
	add: labelPrincipal at: 1@1;
	add: labelPrincipal1 at: 1@2;
	add: champEmail at: 1@13;
	add: champMotDePasse at: 1@15;
	add: boutonConnection at: 1@20;
	add: labelInvitationEnregistrer at: 1@29;
	add: boutonNouveauCompte at: 1@30;
	 yourself ! !

!PageAccueil methodsFor: 'accessing' stamp: 'saintHeraud 2/20/2024 13:51'!
champEmail
	^champEmail! !

!PageAccueil methodsFor: 'accessing' stamp: 'saintHeraud 2/20/2024 13:51'!
champMotDePasse
	^champMotDePasse.! !


!PageAccueil methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/15/2024 09:53'!
boutonConnecterAction
	caisse := Caisse new.
	
	caisse labelUtilisateur 
		label: caisse labelUtilisateur label, self champEmail text.
	
	self seConnecter.
	
	
	
	
	"|c|
	c := ControlPageAccueil new.
	c verifierEmail: self.
	c verifierMotDePasse: self."
	

! !

!PageAccueil methodsFor: 'as yet unclassified' stamp: 'saintHeraud 2/2/2024 20:56'!
boutonEnregistrerAction

CreationDeCompte new open.

self window close.! !

!PageAccueil methodsFor: 'as yet unclassified' stamp: 'saintHeraud 3/15/2024 10:10'!
seConnecter

	| controle mail mdp |
	controle := ControlPageAccueil new.
	
	mail := controle verifierEmail: self.
	mdp := controle verifierMotDePasse: self.
	
	(mdp = self champMotDePasse text trim and: [
		 mail = self champEmail text trim ]) ifFalse: [ ^ self ].
	
	self inform: 'Connexion réussie'.
	self window close.
	caisse open! !
