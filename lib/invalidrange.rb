class InvalidRange < StandardError
	
	#for game setup, when a use enters an invalid range (lower limit > upper limit)
  	def initialize(message = "Sorry, that range is invalid.")
    	super(message)
	end
  
end