class Player

	attr_reader :current_guess_count
	attr_accessor :name

	
	def initialize(name = nil)
		@name = name
		@current_guess_count = 0
	end

end