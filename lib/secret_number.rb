class SecretNumber

	include Comparable

	attr_reader :set_of_numbers
	attr_reader :secret_number

	#generates the secret number for the game
	def generate_secret_number(range_array)
		range_array.sample
	end

	#takes the range from Game.new, converts it into an array, and passes the array...
	#...to generate_secret_number 
	def initialize(range)
		@secret_number = generate_secret_number(range.to_a)
	end

	def get_secret_number
		@secret_number
	end

	def <=>(another_number)
		self.get_secret_number <=> another_number
	end

end