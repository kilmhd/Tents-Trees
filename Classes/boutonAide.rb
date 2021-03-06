require 'gtk3'

#====== La classe BoutonAide représente la classe mère de tous les autres boutons aides

class BoutonAide

	#=Variable d'instance
	# @bouton		: Le bouton
	# @coordI, @coordJ	: Coordonnée du bouton
	# @cliquable		: booléen 
	# @@prix		: prix de l'aide en feuille

	attr_accessor :cliquable
	attr_accessor :bouton


	#Initialize le bouton
	# @param uneValeur    //Le nom du label
	# @param cliquable    //Booléen
	# @return void  	//ne renvoie rien
	def initialize(uneValeur, cliquable)
		@bouton = Gtk::Button.new(:label => uneValeur, :use_underline => nil, :stock_id => nil)
		@cliquable = cliquable
	end


end
