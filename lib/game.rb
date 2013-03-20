class Game

	include Comparable

	attr_reader :guesses_allowed
	attr_reader :current_guess_count
	attr_reader :secret_number
	attr_reader :game_result

	@@messages = {
	win: "You win!",
	lose: "You used all your guesses. You lose.",
	too_low: "Your guess was too low.",
	too_high: "Your guess was too high."
	}

	#for creating a new instance variable of the Game class
	def initialize(guesses_allowed, secret_number_range, player_name)
		@current_guess_count = 0
		@player = Player.new(player_name)
		@current_guess = nil
		@secret_number_range = secret_number_range
		@secret_number = SecretNumber.new(@secret_number_range)
		@guesses_allowed = guesses_allowed
		@game_result = "unresolved"
	end

	#increments the guess count after each guess
	def increment_guess_count
		@current_guess_count = @current_guess_count + 1
	end

	def decrement_guess_count
		@current_guess_count = @current_guess_count - 1
	end

	#logic to check if guess was correct or not and whether player has won or lost
	def guess_correct?(guess)

		#logic: did the player win? if not, are they out of guesses? if not, was their guess...
		#...too low? if not, their guess must have been too high
		if @secret_number == guess
			puts "Congratulations, #{@player.name}. #{@@messages[:win]} #{guesses_to_win_statement}"
			@game_result = "win"
			true
		elsif @current_guess_count == @guesses_allowed
			puts "#{@@messages[:lose]} The secret number was #{@secret_number.secret_number}."
			@game_result = "lose"
			true
		elsif @secret_number > guess
			puts @@messages[:too_low].to_s + " " + guesses_left_statement.to_s
			false		
		else
			puts @@messages[:too_high].to_s + " " + guesses_left_statement.to_s
			false
		end
	end

	# #setups the game parameters before player begins
	# def setup_game
	# 	begin
	# 		#Gets number of guesses from player.
	# 		puts "///GAME SETUP///"
	# 		puts "//How many guesses should this game allow each player?"
	# 		print "      The number of guesses should be: "
	# 		@guesses_allowed = Integer(gets.chomp)
			
	# 		#Gets secret number range from player.
	# 		lower_limit = 0
	# 		upper_limit = 0

	# 		while lower_limit >= upper_limit
	# 			begin
	# 				puts "What should be the range of numbers the player is guessing within?"
	# 				print "      The lower limit should be: "
	# 				lower_limit = Integer(gets.chomp)
	# 				print "      The upper limit should be: "
	# 				upper_limit = Integer(gets.chomp)
					
	# 				if lower_limit >= upper_limit
	# 					raise InvalidRange
	# 				end
	# 			rescue InvalidRange
	# 				puts "That was an invalid range. Try again."
	# 			end
	# 		end

	# 		#contactinates upper and lower limits into a string
	# 		string_range = "#{lower_limit}..#{upper_limit}"

	# 		#Uses custom #to_range method of String to convert string into range
	# 		@secret_number_range = string_range.to_range
			
	# 		#passes range to SecretNumber class
	# 		@secret_number = SecretNumber.new(@secret_number_range)
	# 	rescue ArgumentError
	# 		#program will close if user provides blank or non-integer input
	# 		puts "Sorry, your input was invalid. That usually means you accidentally entered a" 
	# 		puts "...non-integer or left the field blank. Please restart the program and try again."
	# 		exit
	# 	end
	# end

	#starts a new secret game
	def start_game

		@game_over = "false"

		print_created_by

		puts "///Welcome to the Secret Number Game///"

		#collects player's name and tells them terms of the game

		puts "#{@player.name}, you have #{@guesses_allowed} chances to guess a number between #{@secret_number_range}."

		#runs through the loop for each guess the player is allowed. The guess is passed to the 
		#...guess_correct? method where all logic is stored.
			until @guesses_allowed < @current_guess_count
				begin	
					increment_guess_count	

					puts "What is your guess?"
					player_guess = Integer(gets.chomp)

					if guess_correct?(player_guess) == true
						return @game_result
						break
					end	
				rescue ArgumentError
					#decrement @current_guess_counter because invalid guess doesn't count as a guess
					decrement_guess_count
					puts "Sorry, that was an invalid guess. Try again."
				end
			end
	end

	### Helper Methods ###

	def print_created_by
		puts "Created by Greg Buckner"
	end

	def guesses_left_statement
		guesses_left = (@guesses_allowed - @current_guess_count)
		
		if guesses_left > 1
			"You have " + guesses_left.to_s + " guesses left."
		else
			"Be careful! You only have " + guesses_left.to_s + " guess left."
		end
	end

	def guesses_to_win_statement
		if current_guess_count > 1
			"You won in #{@current_guess_count} guesses."
		else
			"You only needed #{@current_guess_count} guess. Wow, impressive!"
		end
	end
end
