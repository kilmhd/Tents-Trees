
require 'gtk3'
require './Interface/fSaison.rb'

#====== La classe BoutonSaison représente les boutons de l'interface sur la section aventure

class BoutonSaison

	#=Variable d'instance
	# @bouton			: Le bouton
	# @coordI, @coordJ		: Coordonée du bouton
	# @img				: mémorise l'image associé au bouon
	# @numSaison			: enregistre le numéro relatif à la saison
	# @@prix 			: prix de l'aide en feuille

	attr_accessor :cliquable
	attr_accessor :bouton


	#Initialise le bouton représentant l'accès aux saisons
	# @param uneSaison		//Chaine de caracère représentant une des 4 saison (été/hiver/automne/pintemps)
	# @param cliquable		//Booléen pou définir si le bouton sera cliquable ou non
	# @return void			//ne renvoie rien
	def initialize(monApp, uneSaison, unJoueur)
		@bouton = Gtk::Button.new()
        focus_hadjustment=(:start)

		@saison = uneSaison
		@joueur = unJoueur

		case @saison
			when "Printemps" then
				@numSaison = 0
				@joueur.acheterNiveau(@numSaison)
			when "Ete" then
				@numSaison = 1
			when "Automne" then
				@numSaison = 2
			when "Hiver" then
				@numSaison = 3
   		end
   		@pix = (GdkPixbuf::Pixbuf.new(:file=>"./Assets/Vignette#{@saison}V.png",:width=> monApp.width/5, :height=> monApp.height/5))
        @img=(Gtk::Image.new(:pixbuf => @pix))
        @bouton.set_image(@img)

        @cliquable = @joueur.niveauDeverouille(@numSaison)
#   		puts @saison
	end

	#Actualise l'image de la case
	# @param void		//ne prend aucun paramètre
	# @return void			//ne renvoie rien
	def actualiserImg(monApp)
		if (@cliquable)
			@pix = (GdkPixbuf::Pixbuf.new(:file=>"./Assets/Vignette#{@saison}.png",:width=> monApp.width/5, :height=> monApp.height/5))
        	@img=(Gtk::Image.new(:pixbuf => @pix))
	        @bouton.set_image(@img)
	    end
	end


	#Débloque un bouton en le rendant cliquable pour un joueur donné
	# @param unJoueur		//Joueur ayant débloqué le bouton
	# @return void			//ne renvoie rien
	def debloquer(monApp)
#		puts @saison
#		puts @joueur.niveauDeverouille(@numSaison)
#		puts "cliquable : #{@cliquable}"

		if (@cliquable == false)
			@cliquable = @joueur.acheterNiveau(@numSaison)
		end
		if (@cliquable)
			@pix = (GdkPixbuf::Pixbuf.new(:file=>"./Assets/Vignette#{@saison}.png",:width=> monApp.width/5, :height=> monApp.height/5))
        	@img=(Gtk::Image.new(:pixbuf => @pix))
        	@bouton.set_image(@img)
        end
	end

	#Lance le mode aventure de la saison concerné
	# @param uneApp		//La fenêtre
	# @param unHeader		//La bande en haut (titre de page)
	# @param unePrecedente		//La fenêtre précédente pour destruction
	# @param unJoueur		//Le joueur concerné
	# @return void			//ne renvoie rien
	def lancer(uneApp, unHeader, unePrecedente)
		if (@cliquable == true)
			unePrecedente.supprimeMoi
			suivante = FSaison.new(uneApp, unHeader, unePrecedente, @joueur, @saison)
			suivante.ajouteMoi
			uneApp.window.show_all
		end
   	end



end
