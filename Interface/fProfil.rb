require 'gtk3'
#require '../Interface/fDiff.rb'
#require '../Interface/fMenu.rb'
#require '../Interface/fPlay.rb'
require './TexteAfficher.rb'
require './Page.rb'
require './fModifierCompte.rb'



class FProfil < Page

	def initialize(monApp, header, anciennePage, unJoueur)

		super(monApp, :vertical, header,  anciennePage, unJoueur)

		@frame = Gtk::Table.new(1,1,false)

		@gProfil = Gtk::ButtonBox.new(:vertical)
		@gProfil.spacing = 30

		@gProfil2 = Gtk::ButtonBox.new(:horizontal)
		@gProfil2.spacing = 100

		@pseudo = TexteAfficher.creer('Pseudo : ', unJoueur.pseudo)
		@scoreGlobal = TexteAfficher.creer('Score Global : ', unJoueur.scoreGlobal.to_s)
		@scoreFacile = TexteAfficher.creer('Score Facile : ', unJoueur.scoreFacile.to_s)
		@scoreMoyen = TexteAfficher.creer('Score Moyen : ', unJoueur.scoreMoyen.to_s)
		@scoreDifficile = TexteAfficher.creer('Score Difficile : ', unJoueur.scoreDifficile.to_s)
		@nbParties = TexteAfficher.creer('Nombre de parties jouées : ', unJoueur.nbPartiesJouees.to_s)
		@modif =Gtk::Button.new(:label => 'Modifier mes informations', :use_underline => nil, :stock_id => nil)
		@deco = Gtk::Button.new(:label => 'Deconnexion', :use_underline => nil, :stock_id => nil)
		@menu = Gtk::Button.new(:label => 'Menu', :use_underline => nil, :stock_id => nil)

		@gProfil.add(@pseudo.gTexteAfficher, :expand => true, :fill => false)
		@gProfil.add(@scoreGlobal.gTexteAfficher, :expand => true, :fill => false)
		@gProfil.add(@scoreFacile.gTexteAfficher, :expand => true, :fill => false)
		@gProfil.add(@scoreMoyen.gTexteAfficher, :expand => true, :fill => false)
		@gProfil.add(@scoreDifficile.gTexteAfficher, :expand => true, :fill => false)
		@gProfil.add(@nbParties.gTexteAfficher, :expand => true, :fill => false)

		@gProfil.add(@gProfil2)
		@gProfil2.add(@modif, :expand => true, :fill => false)
		@gProfil2.add(@menu, :expand => true, :fill => false)
        @gProfil2.add(@deco, :expand => true, :fill => false)

        @header.btnMenu.signal_connect('clicked') {
	        self.supprimeMoi
	        menu = FMenu.new(@window, @header, self, unJoueur)
	        menu.ajouteMoi
	        @window.show_all
	    }
		@gProfil2.add(@deco, :expand => true, :fill => false)


		@modif.signal_connect('clicked') {
			self.supprimeMoi
            suivant = FModifC.new(@window, header, self, unJoueur)
            suivant.ajouteMoi
            @window.show_all
		}

		@menu.signal_connect('clicked') {
			self.supprimeMoi
            suivant = FMenu.new(@window, header, self, unJoueur)
            suivant.ajouteMoi
            @window.show_all
		}

		@deco.signal_connect('clicked') {}

		@frame.attach(@gProfil,0,1,0,1)

		@bg=(Gtk::Image.new(:file =>"../Assets/ImgPresentation2.jpg"))
        @frame.attach(@bg,0,1,0,1)

        self.add(@frame)

	end
end