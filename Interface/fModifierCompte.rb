require 'gtk3'
require './TexteEntree'
require './Page.rb'

class FModifC < Page

	def initialize(monApp, header, anciennePage, unJoueur)

		super(monApp, :vertical, header,  anciennePage, unJoueur)

		@frame = Gtk::Table.new(1,1,false)

		@gModifC = Gtk::ButtonBox.new(:vertical)
          @gModifC.spacing = 30

          @pseudo = TexteEntree.creer('Pseudo : ', false)
          @mdp = TexteEntree.creer('Mot de passe : ', true)
          @valider = Gtk::Button.new(:label => 'Valider les modifications', :use_underline => nil, :stock_id => nil)
          @valider.set_relief(:none)

          @gModifC.add(@pseudo.gTexteEntree, :expand => true, :fill => false)
          @gModifC.add(@mdp.gTexteEntree, :expand => true, :fill => false)
          @gModifC.add(@valider, :expand => true, :fill => false)



		@valider.signal_connect('clicked') {



			puts("OK nouveau joueur\n")
			if (@pseudo.entree.text == '')
				if (@mdp.entree.text == '')
					@mdp.erreur.set_markup("<span foreground=\"#EF2929\" font-desc=\"Courier New bold 10\">Erreur entrer un pseudo et un mot de passe</span>\n")
				elsif (unJoueur.nouveauMotDePasse(@mdp.entree.text) == false)
					@mdp.erreur.set_markup("<span foreground=\"#EF2929\" font-desc=\"Courier New bold 10\">Erreur entrer un mot de passe différent</span>\n")
				end

			elsif (unJoueur.nouveauPseudo(@pseudo.entree.text))

				if (@mdp.entree.text != '' && unJoueur.nouveauMotDePasse(@mdp.entree.text) == false)
					@mdp.erreur.set_markup("<span foreground=\"#EF2929\" font-desc=\"Courier New bold 10\">Erreur entrer un mot de passe différent</span>\n")
				end
			else
				@mdp.erreur.set_markup("<span foreground=\"#EF2929\" font-desc=\"Courier New bold 10\">Erreur ce pseudo est déjà utilisé ou esr déjà votre pseudo actuel</span>\n")
			end
		}


		@header.btnMenu.signal_connect('clicked') {
	        self.supprimeMoi
	        menu = FMenu.new(@window, @header, self, unJoueur)
	        menu.ajouteMoi
	        @window.show_all
	    }

	    @frame.attach(@gModifC,0,1,0,1)

		@bg=(Gtk::Image.new(:file =>"../Assets/ImgGame2.png"))
        @frame.attach(@bg,0,1,0,1)

        self.add(@frame)

	end

end
