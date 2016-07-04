class BowlingGame
  def initialize
    @score = 0  
  end

  def roll(pins_knocked)
    @pins = pins_knocked
  end

  def score
    @score += @pins
  end
end

