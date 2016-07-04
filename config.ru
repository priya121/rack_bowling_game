$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'bowling_game_app'
require 'display'

run BowlingGameApp.new.rack_up

