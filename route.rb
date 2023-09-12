require 'sinatra'

get '/' do  #---'/' means direct to localhost
	erb :index
end

post '/game' do
	@player_name = params[:name]
	"Welcome to Sinatra! #{@player_name}"
	erb :game # this one redirect to any html page u want
end

post '/result' do  #---<form action = put link here at index file
   #do something here
   @player_name = params[:name]
   @player_choice = params[:choice]
   @computer_choice = ["Rock", "Paper", "Scissors"].sample
   if @player_choice == @computer_choice
    	@outcome = "TIE!"
   else
    	case @computer_choice
    	when "Rock"
	    	if @player_choice == "Paper"
	    		@outcome = "You Lose"
	    	else
	    		@outcome = "You WIN!"
	    	end
    	when "Paper"
    		if @player_choice == "Scissors"
	    		@outcome = "You Lose"
	    	else
	    		@outcome = "You WIN!"
	    	end
    	when "Scissors"	
    		if @player_choice == "Rock"
	    		@outcome = "You Lose"
	    	else
	    		@outcome = "You WIN!"
	    	end
    	end
   end
   puts "#{@outcome}"
   erb :result
end
































# def run_rockpaperscissor(player_choice, computer_choice)
# 	if player_choice == computer_choice
# 		"It's a TIE!"
# 	elsif 
# 		(player_choice == "Rock" && computer_choice == "Scissors") ||
# 		(player_choice == "Paper" && computer_choice == "Rock") ||
# 		(player_choice == "Scissors" && computer_choice == "Paper")
# 		"Player WINS!"
# 	else
# 		"Computer WINS!"
# 	end
# end








# get 'hello' do
# 	'Hello Sinatra'
# end

# get '/hello/:name' do
# 	"Hello, #{params[:name]}"
# end