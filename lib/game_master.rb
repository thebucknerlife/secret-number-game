class GameMaster

	attr_reader :player_win_count
	attr_reader :player_lose_count
	attr_reader :guesses_allowed
	attr_reader :secret_number_range
	attr_reader :secret_number
	attr_reader :player_name

	def initialize
		@player_win_count = 0
		@player_lose_count = 0
		@guesses_allowed = 0
		@secret_number_range = (0..0)
		@player_name = nil

		#method to establish number of guesses, number range, and player name
		setup_session

		#determines when to stop while loop below
		@keep_playing == true

		#creates a new game, starts that game, keeps track of result of the game
		#...prints the score, updates @keep_playing, then quits when player is done
		until @keep_playing == false 
			@current_game = Game.new(@guesses_allowed, @secret_number_range, @player_name)

			@game_result = @current_game.start_game

			if @game_result == "win"
				@player_win_count = @player_win_count + 1
			elsif @game_result == "lose"
				@player_lose_count = @player_lose_count + 1
			end

			puts "\n///Current Score///"
			puts "wins: #{player_win_count}"
			puts "loses: #{player_lose_count}"

			puts "\nWould you like to play again? [Y or N]"
			play_again_response = gets.chomp.to_s

			if play_again_response == "N"
				puts "Thank you for playing."
				@keep_playing == false
				exit
			else
				@keep_playing == true
			end
		end	
	end

	#setups the game parameters for all the games played during this session
	def setup_session
		begin
			#Gets number of guesses from player.
			puts "///SESSION SETUP///"
			puts "//How many guesses do you want for each game?"
			print "      The number of guesses for each game will be: "
			@guesses_allowed = Integer(gets.chomp)
			
			#Gets secret number range from player.
			lower_limit = 0
			upper_limit = 0

			#error checks that range is valid and doesn't continue until valid range
			#...input by user
			#while range is invalid
			while lower_limit >= upper_limit
				begin
					puts "What should be the range of numbers you'll guess across?"
					print "      The lower limit should be: "
					#check input is an integer (rescued in larger code block below)
					lower_limit = Integer(gets.chomp)
					print "      The upper limit should be: "
					#check input is an integer (rescued in larger code block below)
					upper_limit = Integer(gets.chomp)
					#throw error is range is invalid
					if lower_limit >= upper_limit
						raise InvalidRange
					end
				rescue InvalidRange
					puts "That was an invalid range. Try again."
				end
			end

			#contactinates upper and lower limits into a string
			string_range = "#{lower_limit}..#{upper_limit}"

			#Uses custom #to_range method of String to convert string into range
			@secret_number_range = string_range.to_range

			#gets user name
			puts "What is your name?"
			@player_name = String(gets.chomp.capitalize)
		#rescue exeception anytime user inputs a non-integer and quits program
		rescue ArgumentError
			#program will close if user provides blank or non-integer input
			puts "Sorry, your input was invalid. That usually means you accidentally entered a" 
			puts "...non-integer or left the field blank. Please restart the program and try again."
			exit
		end
	end
end