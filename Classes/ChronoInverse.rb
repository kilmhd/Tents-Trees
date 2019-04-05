#====== La classe chronoInverse représente un compte à rebours conçu pour être utilisé en thread ( en parallèle du programme princpal pour chronomètrer une partie)

class ChronoInverse
	#= Variables d'instance
	# @initialize		: mémorise le temps de départ du chrono.
	# @initial		: mémorise le temps de départ obtenu avec Time.now.to_i pour pouvoir le soustraire plus tard
	# @start		: boolean en false au lancement du chrono et passe en true lors du premier tosu de boucle.
	# @pause		: boolean met en pause le chrono
	# @chrono		: variable qui stockera le nombre de seconde actuel et qui servira à afficher.
	# @find		: boolean ture pour arrêter le chrono.
	# @compteur		: variable qui va compter le temps passer et le soustraire au chrono

	attr_accessor :start
	attr_accessor :pause
	attr_accessor :chrono


	#initialise les variables à 0 et a false et mémorise le temps initial dans la variable @initialize
	# @param temps		//Prend un temps de départ en paramètre
	# @return void		//ne renvoie rien
	def initialize(temps)
		@initial=0
		@initialize=temps
		@start=false
		@pause=false
		@chrono=0
		@compteur=0
		@fin=false
	end

	#lance le chrono qui se terminera uniquement en appelant la méthode fin()
	# @param void		//ne prend aucun paramètre
	# @return void		//ne renvoie rien
	def start
			
			
			while @fin != true
			
						if @start==false
							@initial=Time.now.to_i
							@start=true
						end
						
						if @pause != true
							if @compteur != Time.now.to_i - @initial
								@compteur=Time.now.to_i - @initial
								@chrono=@initialize-@compteur
								print self
							end
						end
			end
		
	end

	#change la valeur de la variable @pause en true ou en false mettant le chrono en pause ou le faisant repartir
	# @param void		//ne prend aucun paramètre
	# @return void		//ne renvoie rien
	def pause()
		if @pause==true
			@pause=false
			@initial=Time.now.to_i-@compteur
		else 
			@pause=true
		end
	end

	#relance le chrono dans sa configuration initiale
	# @param void		//ne prend aucun paramètre
	# @return void		//ne renvoie rien
	def raz()
		@start=false
		@pause=false
	end

	#retire n seconde au chrono
	# @param void 		//le nombre de scondes à retirer
	# @return void		//ne renvoie rien
	def retire(n)
		@chrono-=n
	end

	#met la variable @fin sur true ce qui à pour effet de mettre un terme au chrono
	# @param void		//ne prend aucun paramètre
	# @return void		//ne renvoie rien
	def fin()
		@fin=true
	end
	
	#Traduction des secondes en heures/minutes/secondes
	# @param void		//ne prend aucun paramètre
	# @return temps	//Retourne le temps sous format h:m:s
	def to_s
	
			heures = @chrono/3600
			minutes = (@chrono - (heures*3600)) / 60
			secondes = @chrono - (heures*3600) - (minutes*60)

			h = heures < 10 ? "0" + heures.to_s : heures.to_s
			m = minutes < 10 ? "0" + minutes.to_s : minutes.to_s
			s = secondes < 10 ? "0" + secondes.to_s : secondes.to_s

			return h + ":" + m + ":" + s + "\n"
	end

end # Marqueur de fin de classe


c=ChronoInverse.new(120)

thr=Thread.new{
			c.start
}


sleep(3)
c.pause()
sleep(3)
c.pause()
#print "Saisi"
#s = gets
#sleep(3)
#print s
sleep(3)
c.raz()
sleep(5)

