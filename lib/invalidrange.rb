class InvalidRange < StandardError

  def initialize(message = "Sorry, that range is invalid.")
    super(message)
  end
  
end