################################################################################
#
# Introduction to Ruby on Rails
#
# Final Ruby Assignment
#
################################################################################
#
# Requirements
#
################################################################################
			#
			# 1. When the program is launched, it accepts the number of guesses the
			#    Player is allowed to make and the beginning and end range of the
			#    set of numbers the user is allowed to guess from. Be sure to make
			#    sure that input for number of turns is an Integer and that however
			#    you decide to accept the range input, that the range is only
			#    Integers and not Floating point numbers.
			#
			# 2. Program asks for Player's name and uses the Player's name
			#    throughout the enitrety of the game.
			#
			# 2. Program chooses a random number from the range inputted at run-time
			#    (inclusive.)
			#
			# 3. Program asks Player for their first guess.
			#
			# 4. Program evaluates whether the guess was correct.
			#
			#    1. If the guess is correct, program prints to the Player that they guessed
			#       it with 1 try.
			#
			#    2. If the guess is lower than the computer's number, program prints to the
			#       the Player that they need to guess a higher number and says how
			#       many tries they have remaining.
			#
			#    3. If the guess is higher than the computer's number, program prints to the
			#       the Player that they need to guess a lower number and says how
			#       many tries they have remaining.
			#
			# 5. The program should loop until the correct guess is made or they run
			#    out of guesses to make. The program should also increment the count
			#    of times the Player has made guesses.
			#
			# 6. The program should only let the Player make the number of guesses
			#    set up via the parameters set at run-time.
			#
			# 7. When the game has been "won," the program will print the final number of
			#    tries.
			#
			# 8. When the game ends, where they have "won" or "lost" the program should ask
			#    if they would like to play again or cancel.
			#
			# 9. If they would like to play again, the program should begin again. If the
			#    Player asks to cancel, the program exits.
			#
# 10. Be sure to include documentation illustrating how to run your
#     program. Your program should be easy to use and understand so that
#     the Teacher/TAs can play to completion.
#
################################################################################
#
# Functional Requirements
#
################################################################################
#
			# 1. The number of guesses allowed and range of numbers to be
			#    guessed from should be entered as a command line parameter.
			#
			# 2. Should make use of at least three Classes.
			#
			# 3. Uses one Mixin in a Class or Classes such as Comparable or Enumerable
			#    (or choice of Student.)
			#
			# 4. Implement a custom exception Class that is inherited from
			#    StandardError (or the StandardError Class tree.)
			#
			# 3. Demonstrate the following:
			#
			#   - local and instance variables
			#   - arrays, hashes, and custom object type(s)
			#   - logical conditions
			#   - branching via both if/elsif/else and case/when
			#   - classes and object instantiation
			#   - attr_accessor/attr_reader/attr_writer
			#   - instance methods
			#   - module mixin to class
			#   - array
			#   - hash
			#   - command line input
			#   - command line display
			#   - string interpolation
			#   - comments
			#   - error checking
			#   - raising/rescuing exceptions
			#
################################################################################
#
# Additional Directions
#
# In addition to completing all tasks from Labs 01 - 05, please include in
# your program the following tasks.
#
################################################################################
#
			# 1. Instead of hard-coding the number of guesses a Player may make when
			#    starting the Game, this should be a parameter when you run your
			#    script in the command line.
			#
			# 2. Also, a parameter to your program should be the range of numbers
			#    that the Player may guess from.
			#
			# 3. You should error check to make sure that the input the User gives
			#    to your script when run are present. If not, raise an exception,
			#    exit the program and tell them to fix their input.
			#
			# 4. Make sure all input entered by the Player is checked, meaning that
			#    when your program asks the Player to guess a number, they should
			#    not be able to enter blank data for their name or guesses. Make
			#    sure that their guess attempts count does not increase.
			#
			# 5. Include a Module as a mixin such as Enumerable or Comparable. These
			#    may be useful to you in your `SecretNumber` class!
			#
			# 6. Create a custom exception Class that can be used around your
			#    program to raise and rescue around your program. How you use this
			#    is up to you.
			#
################################################################################
#
# Bonus Work
#
################################################################################
#
# 1. Implement the ability to have more than 1 Player play the Game at
#    a time.
#
# 2. Track the Player's score over the course of multiple games. (Wins
#    & Losses.)
#
# 3. If you have another idea for additional functionality, talk with
#    the Teacher/TAs and be sure to provide documentation illusutrating
#    what the additional functionality is supposed to do and how to use
#    it.
#
################################################################################

$LOAD_PATH.unshift(File.join(__FILE__, "../lib"))

require "player"
require "secret_number"
require "game"
require "string"
require "invalidrange"
require "game_master"

GameMaster.new
