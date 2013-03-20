class Game

	include Comparable

	attr_reader :guesses_allowed
	attr_reader :current_guess_count
	attr_reader :secret_number
	attr_reader :game_result

	@@messages = {
	win: "You win!",
	lose: "You used all your guesses. Sorry, you lose.",
	too_low: "Your guess was too low.",
	too_high: "Your guess was too high."
	}

	#for creating a new instance variable of the Game class
	def initialize(guesses_allowed, secret_number_range, player_name)
		@current_guess_count = 0
		#name from GameMaster
		@player = Player.new(player_name)
		@current_guess = nil
		#from GameMaster
		@secret_number_range = secret_number_range
		#secret number is creates in the Game instance so it isn't the same each game
		@secret_number = SecretNumber.new(@secret_number_range)
		#from GameMaster
		@guesses_allowed = guesses_allowed
		#passed back to GameMaster after game is over
		@game_result = "unresolved"
	end

	#increments the guess count after each guess
	def increment_guess_count
		@current_guess_count = @current_guess_count + 1
	end

	#decrement the guess count whenever player input is invalid before player tries again
	def decrement_guess_count
		@current_guess_count = @current_guess_count - 1
	end

	#logic to check if guess was correct or not and whether player has won or lost
	def guess_correct?(guess)

		#logic: did the player win? if not, are they out of guesses? if not, was their guess
		#...too low? if not, their guess must have been too high
		if @secret_number == guess
			puts "<<<         Congratulations, #{@player.name}. #{@@messages[:win]} #{guesses_to_win_statement}"
			@game_result = "win"
			true
		elsif @current_guess_count == @guesses_allowed
			puts "<<<         #{@@messages[:lose]} The secret number was #{@secret_number.secret_number}."
			@game_result = "lose"
			true
		elsif @secret_number > guess
			puts "<<<         " + @@messages[:too_low].to_s + " " + guesses_left_statement.to_s
			false		
		else
			puts "<<<         " + @@messages[:too_high].to_s + " " + guesses_left_statement.to_s
			false
		end
	end

	#starts a new secret game
	def start_game

		@game_over = "false"

		puts "\n<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
		puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<SECRET NUMBER GAME>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
		puts "<<<"

		#tells them terms of the game
		puts "<<<         #{@player.name}, you have #{@guesses_allowed} chances to guess a number between #{@secret_number_range}."
		puts "<<<"

		#runs through the loop for each guess the player is allowed. The guess is passed to the 
		#...guess_correct? method where all logic is stored.
			until @guesses_allowed < @current_guess_count
				begin	
					increment_guess_count	

					puts "<<<         What is your guess?"
					print "<<<         > Enter your guess here: "
					player_guess = Integer(gets.chomp)

					puts "<<<"
					
					#when game is over (player won or is out of guesses), breaks out of loop
					#...and reports result to the GameMaster
					if guess_correct?(player_guess) == true
						return @game_result
						break
					end	
				rescue ArgumentError
					#decrement @current_guess_counter because invalid guess doesn't count as a guess
					decrement_guess_count
					puts "<<<         Sorry, that was an invalid guess. Try again."
				end
			end
	end

	### Helper Methods ###

	#returns string of guesses left with special condition for 1 guess left
	def guesses_left_statement
		guesses_left = (@guesses_allowed - @current_guess_count)
		
		if guesses_left > 1
			"You have " + guesses_left.to_s + " guesses left."
		else
			"Be careful! You only have " + guesses_left.to_s + " guess left."
		end
	end

	#reports how many guesses player needed with special condition for 1 guess
	def guesses_to_win_statement
		if current_guess_count > 1
			"You won in #{@current_guess_count} guesses."
		else
			"You only needed #{@current_guess_count} guess. Wow, impressive!"
		end
	end
end
