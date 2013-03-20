$LOAD_PATH.unshift(File.join(__FILE__, "../lib"))

require "player"
require "secret_number"
require "game"
require "string"
require "invalidrange"
require "game_master"

#only need to create a new GameMaster object to play!
GameMaster.new