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

		print_created_by
		print_intro

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

			puts "<<<"
			puts "<<<              ///Current Score///"
			puts "<<<              Wins:  #{player_win_count}"
			puts "<<<              Loses: #{player_lose_count}"
			puts "<<<"

			puts "<<<              Would you like to play again? [Y or N]"
			print "<<<              Enter here: "
			play_again_response = gets.chomp.to_s.byteslice(0).capitalize

			if play_again_response == "N"
				puts "<<<"
				puts "<<<         Thank you for playing."
				puts "<<<"
				puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
				@keep_playing == false
				exit
			else
				puts "<<<"
				puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
				@keep_playing == true
			end
		end	
	end





	#setups the game parameters for all the games played during this session
	def setup_session
		begin
			#Gets number of guesses from player.
			puts "\n/////////////////////////////////////////////////////////////////////////////////"
			puts "//////////////////////////////////GAME SETUP/////////////////////////////////////"
			puts "//"
			puts "//            How many guesses do you want for each game?"
			print "//            >     Enter number of guesses here: "
			@guesses_allowed = Integer(gets.chomp)
			puts "//"

			#Gets secret number range from player.
			lower_limit = 0
			upper_limit = 0

			#error checks that range is valid and doesn't continue until valid range
			#...input by user
			#while range is invalid
			while lower_limit >= upper_limit
				begin
					puts "//            What range do you want to guess within? (you're going to enter two"
					puts "//            numbers, the lower and upper limits of the range. So if you want to"
					puts "//            guess between 1-10, enter a '1' then a '10')"
					print "//            >     Enter lower limit of the range here: "
					#check input is an integer (rescued in larger code block below)
					lower_limit = Integer(gets.chomp)
					print "//            >     Enter upper limit of the range here: "
					#check input is an integer (rescued in larger code block below)
					upper_limit = Integer(gets.chomp)
					#throw error is range is invalid
					if lower_limit >= upper_limit
						raise InvalidRange
					end
					puts "//"
				rescue InvalidRange
					puts "That was an invalid range. Try again."
				end
			end

			#contactinates upper and lower limits into a string
			string_range = "#{lower_limit}..#{upper_limit}"

			#Uses custom #to_range method of String to convert string into range
			@secret_number_range = string_range.to_range

			#gets user name
			puts "//            What is your name?"
			print "//            >     Enter your name here: "
			@player_name = String(gets.chomp.capitalize)
			puts "//"
			puts "//            Thank you! Now that we're all setup, it's time to play!"
			puts "//"
			puts "//////////////////////////////////END OF SETUP///////////////////////////////////"
		#rescue exeception anytime user inputs a non-integer and quits program
		rescue ArgumentError
			#program will close if user provides blank or non-integer input
			puts "Sorry, your input was invalid. That usually means you accidentally entered a
			non-integer or left the field blank. Please restart the program and try again."
			exit
		end
	end





	def print_created_by
		puts "Created by Greg Buckner"
	end





	def print_intro
		puts "\nWelcome to the Secret Number Game. The purpose of this game is to guess a secret"
		puts "number within a range of numbers using a limited amount of guesses. For example,"
		puts "guessing a number between 1 and 10 with only 3 guesses."
		
		puts "\nFirst, you're going to setup the game by telling the program how many guesses you"
		puts "want, what the range of numbers to guess from is, and your name."
		
		puts "\nThen you can play against the computer! Every game has the same number of guesses"
		puts "and range after you finish setup. But each game has a new secret number each time"
		puts "you play. The program will keep score of how many times you win and lose a game so"
		puts "feel free to play multiple times."
	end	

end