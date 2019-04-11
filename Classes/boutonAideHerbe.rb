require 'gtk3'
require './Classes/boutonAide.rb'

#====== La classe BouonAideHerbe hérite de la classe BoutonAide et répésente une aide spécifique aux herbes

class BoutonAideHerbe < BoutonAide

	#=Variable d'instance
	# @bouton		: Le bouton
	# @coordI, @coordJ	: Coordonnée du bouton
	# @@prix		: prix de l'aide en feuille

	attr_accessor :cliquable
	attr_accessor :bouton
	attr_accessor :prix


	@@prix = 2

	def prix()
		return @@prix
	end

	#Initialize le bouton
	# @param uneValeur    //Le nom du label
	# @param cliquable    //Booléen
	# @return void  	//ne renvoie rien
	def initialize(uneValeur, cliquable)
		super(uneValeur, cliquable)
	end


	#Définie la marche à suivre en cas d'appel d'aide sur le bouton herbe
	# @param uneGrille    //la grille de jeu
	# @param unLabel    //La position d'affichage
	# @param unJoueur    //POur sauvegarder le joueur et ne pas le perdre en cas de changement de page
	# @return nil  	//si aucune aide ne trouve de solution
	def aide(uneGrille, unLabel, unJoueur, interfaceGrille)
		if(@cliquable == true)
			aide1 = Aide.ligneCompleterHerbes(uneGrille)
			aide2 = Aide.colonneCompleterHerbes(uneGrille)
			aide3 = Aide.tenteContourCompleter(uneGrille)
			aide4 = Aide.arbreAngleHerbe(uneGrille)
			aide5 = Aide.caseEstDeLHerbe(uneGrille)
			if(aide1 != nil)
				unLabel.set_markup("<span foreground=\"#FFFFFF\" font-desc=\"Courier New bold 11\">La colonne #{aide1} peut être \ncomplétée par des herbes</span>")
				for i in (0..uneGrille.taille-1)
					interfaceGrille[aide1][i].indiquerAide(uneGrille.grilleJ[aide1][i].etat)
				end
				return aide1
			elsif(aide2 != nil)
				unLabel.set_markup("<span foreground=\"#FFFFFF\" font-desc=\"Courier New bold 11\">La ligne #{aide2} peut être \ncomplétée par des herbes</span>")
				for i in (0..uneGrille.taille-1)
					interfaceGrille[i][aide2].indiquerAide(uneGrille.grilleJ[i][aide2].etat)
				end
				return aide2
			elsif(aide3 != nil)
				unLabel.set_markup("<span foreground=\"#FFFFFF\" font-desc=\"Courier New bold 11\">Le contour de la tente en \n#{aide3.i} #{aide3.j} \ndoit être complété</span>")
				interfaceGrille[aide3.i][aide3.j].indiquerAide(uneGrille.grilleJ[aide3.i][aide3.j].etat)
				return aide3
			elsif(aide4 != nil)
				unLabel.set_markup("<span foreground=\"#FFFFFF\" font-desc=\"Courier New bold 11\">L'arbre en #{aide4.i} #{aide4.j} \npossède un coin qui est obligatoirement de l'herbe</span>")
				interfaceGrille[aide4.i][aide4.j].indiquerAide(uneGrille.grilleJ[aide4.i][aide4.j].etat)
				return aide4
			elsif(aide5 != nil)
				unLabel.set_markup("<span foreground=\"#FFFFFF\" font-desc=\"Courier New bold 11\">La case  en #{aide5.i} #{aide5.j} \nne dépend d'aucun arbre et est donc \nforcément de l'herbe</span>")
				interfaceGrille[aide5.i][aide5.j].indiquerAide(uneGrille.grilleJ[aide5.i][aide5.j].etat)
				return aide5
			else
				unLabel.set_markup("<span foreground=\"#FFFFFF\" font-desc=\"Courier New bold 11\">Aucune herbe \nne peut être placée</span>")
				return nil
			end
		end
	end

end