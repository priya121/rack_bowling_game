require 'bowling_game_app'
require 'bowling_game'
require 'rack/test'

describe BowlingGameApp do 
  include Rack::Test::Methods
  let(:application) { described_class.new }

  def app
    application.rack_up
  end

  context "/score" do
    it "returns OK" do
      get '/score' do
        expect(last_response).to be_ok
      end
    end

    it "returns score for gutter game" do
      game = BowlingGame.new
      game.roll(0)
      get '/score', {"score" => game.score} do
        expect(last_response.body).to eq "0"
      end
    end
  end
end
