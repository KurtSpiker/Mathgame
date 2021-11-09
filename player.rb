class Player
  attr_accessor :name, :lives
  def initialize(name)
    @name = name
    @lives = 3
  end

  def incorrect
    @lives -= 1
  end
end