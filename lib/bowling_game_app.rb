require 'rack'
require 'rack/server'
require 'bowling_game'
require 'display'

class BowlingGameApp
  def rack_up
    Rack::Builder.new do |env|
      map "/score" do
        run (Proc.new do |hello_env|
          request = Rack::Request.new(hello_env)
          display = Display.new
          pins_knocked = request["pins_knocked"]
          game = BowlingGame.new
          game.roll(pins_knocked.to_i)
          score = game.score
          show_display = display.generate_page(score.to_s)
          [200, {}, [show_display]]
        end)
      end
    end.to_app
  end
end
