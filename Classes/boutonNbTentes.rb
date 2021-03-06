require 'gtk3'

#====== La classe BoutonNbTentes représente les boutons sur le côté de la grille de jeu pour remplir une ligne/colonne d'herbe

class BoutonNbTentes

	#=Variable d'instance
	# @bouton		: Le bouton
	# @coordI, @coordJ	: Coordonnées du bouton


	attr_accessor :clic
	attr_reader :chemin
	attr_accessor :bouton


	#Initialise le bouton
	# @param uneGrille		//Grille de jeu
	# @param grilleInterface	//affichage de grille de jeu
	# @param indice		//indice ligne/colonne
	# @param chemin		//Le chemin d'accès du dossier contenant les différentes images
	# @param unJoueur		//Le joueur concerné
	# @param classique		//booléen mode classique ou non
	# @return void			//ne renvoie rien
	def initialize(uneGrille, grilleInterface, indice, chemin, unJoueur, classique)
		@bouton = Gtk::Button.new
		# @bouton.set_relief(:none)
		@grilleDeJeu = uneGrille
		@boutonGrille = grilleInterface
		@indice = indice
		@clic = true
		@chemin = chemin
		@joueur = unJoueur
		@classique = classique
	end

end
