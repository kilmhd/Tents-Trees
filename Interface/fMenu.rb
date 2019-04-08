require 'gtk3'

require './fDidact.rb'
require './Page.rb'
require './fProfil.rb'
require './fGameMode.rb'
require './fScore.rb'


class FMenu < Page

     def initialize(monApp, header, anciennePage, unJoueur)

     	super(monApp, :vertical, header,  anciennePage, unJoueur)

        @frame = Gtk::Table.new(1,1,false)
    		@gMenu = Gtk::ButtonBox.new(:vertical)
        #@gMenu.spacing = 10

    		@ghead = Gtk::ButtonBox.new(:horizontal)
        @ghead.spacing = 750
    			@option = Gtk::Button.new()
          @option.set_relief(:none)
    			@profil = Gtk::Button.new()
          @profil.set_relief(:none)

          @imgP=(Gtk::Image.new(:file =>"./image/profil.png"))
          @profil.set_image(@imgP)
          focus_hadjustment=(:start)

          @imgO=(Gtk::Image.new(:file =>"./image/option.png"))
          @option.set_image(@imgO)
          focus_hadjustment=(:start)

    			@ghead.add(@option, :expand => true, :fill => false)
    			@ghead.add(@profil, :expand => true, :fill => false)
        @gMenu.add(@ghead)

    		@play = Gtk::Button.new(:label => 'Jouer', :use_underline => nil, :stock_id => nil)
        @play.set_relief(:none)
    		@didac = Gtk::Button.new(:label => 'Didacticiel', :use_underline => nil, :stock_id => nil)
        @didac.set_relief(:none)
    		@score = Gtk::Button.new(:label => 'Classement', :use_underline => nil, :stock_id => nil)
        @score.set_relief(:none)

    		@gMenu.add(@play, :expand => true, :fill => false)
    		@gMenu.add(@didac, :expand => true, :fill => false)
    		@gMenu.add(@score, :expand => true, :fill => false)


        @option.signal_connect('clicked') {
               #self.supprimeMoi
               #FPlay.construire(fenetre, 8)
               #@window.show_all
        }
        @profil.signal_connect('clicked') {
               self.supprimeMoi
               suivant = FProfil.new(@window, header, self, unJoueur)
               suivant.ajouteMoi
               @window.show_all
        }
        @play.signal_connect('clicked') {
               self.supprimeMoi
               suivant = FGM.new(@window, header, self, unJoueur)
               suivant.ajouteMoi
               @window.show_all
        }
        @didac.signal_connect('clicked') {
              self.supprimeMoi
              suivant = FDidac.new(@window, header, self, unJoueur)
              suivant.ajouteMoi
              @window.show_all  
        }
        @score.signal_connect('clicked') {
              self.supprimeMoi
              suivant = FScore.new(@window, header, self, unJoueur)
              suivant.ajouteMoi
              @window.show_all 
        }

        @frame.attach(@gMenu,0,1,0,1)

        @bg=(Gtk::Image.new(:file =>"../Assets/ImgGame2.png"))
        @frame.attach(@bg,0,1,0,1)

        self.add(@frame)
    end
end
