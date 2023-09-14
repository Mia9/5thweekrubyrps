require 'sinatra'
enable :sessions


get '/' do  #---'/' means direct to localhost or HOMEPAGE!
	#----define a variable with condition also can
	if session[:players] == nil 
		session[:players] = []
	else
		session[:players] = session[:players]
	end

	puts session[:players]

	erb :index #this part direct you to index html page
end

get '/result' do
	puts session[:results]
	erb :result
end

get '/index' do
	"Hello"
	erb :game
end

post '/game' do
	session[:name] = params[:name]
	session[:rounds] = params[:rounds].to_i 
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
   	puts session[:win_count]
   	player_win_scoreboard = {
			"player_name" => session[:name],
			"win_count" => session[:win_count]
		}
   	puts player_win_scoreboard
   	session[:players].append(player_win_scoreboard)
   	erb :result
   end   
end

