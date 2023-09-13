require 'sinatra'
enable :sessions

get '/' do  #---'/' means direct to localhost or HOMEPAGE!
	erb :index #this part direct you to index html page
end

post '/game' do
	@player_name = params[:name]
	@rounds = params[:rounds].to_i 
	session[:name] = @player_name
	session[:rounds] = @rounds
	session[:results] = []
	erb :game # this one redirect to any html page u want
end

post '/result' do  #---<form action = put link here at index file
      
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
	    		@outcome = "You Win"	    		
	    	end
    	when "Paper"
    		if @player_choice == "Rock"
	    		@outcome = "You Lose"
	    	else
	    		@outcome = "You Win"
	    	end
    	when "Scissors"	
    		if @player_choice == "Paper"
	    		@outcome = "You Lose"
	    	else
	    		@outcome = "You Win"	
	    	end
      end
   end
   history = { player: @player_choice, computer: @computer_choice, result: @outcome}
   session[:results] << history
   puts session[:results] 
   if session[:results].length < session[:rounds]
   	erb :game
   else
   	counter_winlose = session[:results].map { |hash| hash[:result]}
   	session[:win_count] = counter_winlose.count("You Win")
   	session[:lose_count] = counter_winlose.count("You Lose")
   	session[:tie_count] = counter_winlose.count("TIE!")
   	puts "#{counter_winlose}"
   	erb :result
   end
   
end
