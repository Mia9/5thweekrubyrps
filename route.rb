require 'sinatra'

get '/' do  #---'/' means direct to localhost or HOMEPAGE!
	erb :index #this part direct you to index html page
end

post '/game' do
	@player_name = params[:name]
	"Welcome to Sinatra! #{@player_name}"
	erb :game # this one redirect to any html page u want
end

post '/result' do  #---<form action = put link here at index file
   #do something here
   
   @score = 0
   @player_name = params[:name]
   @player_choice = params[:choice]
   @computer_choice = ["Rock", "Paper", "Scissors"].sample
   
   if @player_choice == @computer_choice
    	@outcome = "TIE!"
   else
    	case @computer_choice
    	when "Rock"
	    	if @player_choice == "Scissors"
	    		@outcome = "You Lose"
	    	else
	    		@outcome = "You WIN!"
	    		@score += 1
	    	end
    	when "Paper"
    		if @player_choice == "Rock"
	    		@outcome = "You Lose"
	    	else
	    		@outcome = "You WIN!"
	    		@score += 1
	    	end
    	when "Scissors"	
    		if @player_choice == "Paper"
	    		@outcome = "You Lose"
	    	else
	    		@outcome = "You WIN!"
	    		@score += 1
	    	end

      end 

   end

   puts "#{@outcome}" #---will show in the server console, not html
   puts "#{@score}"

   
   erb :result
end

# post '/result' do
# 	@score = 1
# 	if @outcome == "You WIN!"
# 		@score += 1
# 	else 
# 		@score = 0
# 	end
# 	puts "#{@score}"
#    erb :result
# end

