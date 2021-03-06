require 'gtk3'
require './Classes/boutonAide.rb'

#====== La classe BoutonAideVerif hérite de la classe BoutonAide et va chercher une erreur sur la grille de jeu complété par le joueur

class BoutonAideVerif < BoutonAide

	#=Variable d'instance
	# @bouton		: Le bouton
	# @coordI, @coordJ	: Coordonnée du bouton
	# @cliquable		: booléen
	# @@prix		: prix de l'aide en feuille


	attr_accessor :cliquable
	attr_accessor :bouton


	@@prix = 5

	#renvoie le prix associé au bouton
	# @param void		//ne prend aucun paramètre
	# @return prix		//renvie un prix integer
	def prix()
		return @@prix
	end

	#Définie la marche à suivre en cas d'appel d'aide sur le bouton verif
	# @param monApp		//L'application
	# @param uneGrille    //la grille de jeu
	# @param unLabel    //La position d'affichage
	# @param unJoueur    //POur sauvegarder le joueur et ne pas le perdre en cas de changement de page
	# @param interfaceGrille //L'interface de la grille
	# @return nil  	//si aucune aide ne trouve de solution
	def aide(monApp, uneGrille, unLabel, unJoueur, interfaceGrille)
		if(@cliquable == true)
			aide = Aide.erreur(uneGrille)
			if(aide != nil)
				unLabel.set_markup("<span foreground=\"#E30E0B\" font-desc=\"Courier New bold 11\">Erreur sur la case \n en surbrillance</span>")
				interfaceGrille[aide.i][aide.j].indiquerAide(monApp, uneGrille.grilleJ[aide.i][aide.j].etat)
				return aide
			else
				unLabel.set_markup("<span foreground=\"#E30E0B\" font-desc=\"Courier New bold 11\">Aucune erreur \nsur la grille actuelle</span>")
				return nil
			end
		end
	end


end
