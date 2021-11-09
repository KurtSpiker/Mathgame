require './player'

class Game
  attr_accessor :player1, :player2, :gameOver, :currentPlayer, :turn
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("player 2")
    @gameOver = false
    @turn = 1
    @currentPlayer = 1
  end

  def play
    while !self.gameOver
      if self.turn > 1
        puts "----- NEW TURN -----"
      end
      prompt
      results
      if self.currentPlayer == 1
        self.currentPlayer = 2
      elsif self.currentPlayer == 2
        self.currentPlayer = 1
      end
    end
    puts "----- GAME OVER -----"
    puts " Good bye !"
  end
  
  
  def prompt
    firstNumber = rand(1..20)
    secondNumbner = rand(1..20)
    playerGuess = 0
    
    if currentPlayer == 1
      player = self.player1
    else
      player = self.player2
    end

    puts "Player #{self.currentPlayer}: What does #{firstNumber} plus #{secondNumbner} equal?"
    playerGuess = $stdin.gets.chomp.to_i
    if !(playerGuess == (firstNumber + secondNumbner))
      puts "Player #{self.currentPlayer}: Seriously? No!"
      player.incorrect
    else
      puts "Player #{self.currentPlayer}: YES! You are correct."
    end
  end

  def results
    if self.player1.lives == 0
      puts "Player 2 wins with a score of #{self.player2.lives}/3"
      self.gameOver = true
    elsif self.player2.lives == 0
      puts "Player 1 wins with a score of #{self.player1.lives}/3"
      self.gameOver = true
    else
      puts "P1: #{self.player1.lives}/3 vs P2: #{self.player2.lives}/3"
    end
  end
end
