class RPS
  attr_reader :player_score, :computer_score, :winner

  def initialize
    @player_score = 0
    @computer_score = 0
  end

  def winner?
    @player_score == 2 || @computer_score == 2
  end

  def round_outcome(player_move)
    computer_move = ['Rock', 'Paper', 'Scissors'].sample
    if computer_move == 'Rock' && player_move == 'Paper'
      @player_score += 1
      return "You chose #{player_move}, Computer chose #{computer_move}. Player Wins!"
    elsif computer_move == 'Rock' && player_move == 'Scissors'
      @computer_score += 1
      return "You chose #{player_move}, Computer chose #{computer_move}. Computer Wins!"
    elsif computer_move == 'Scissors' && player_move == 'Rock'
      @player_score += 1
      return "You chose #{player_move}, Computer chose #{computer_move}. Player Wins!"
    elsif computer_move == 'Scissors' && player_move == 'Paper'
      @computer_score += 1
      return "You chose #{player_move}, Computer chose #{computer_move}. Computer Wins!"
    elsif computer_move == 'Paper' && player_move == 'Scissors'
      @player_score += 1
      return "You chose #{player_move}, Computer chose #{computer_move}. Player Wins!"
    elsif computer_move == 'Paper' && player_move == 'Rock'
      @computer_score += 1
      return "You chose #{player_move}, Computer chose #{computer_move}. Computer Wins!"
    else
      return "Tie!"
    end
  end

end
