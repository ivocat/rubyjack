class Dealer
  attr_accessor :move_number
  attr_reader :balance, :deck

  def initialize(deck)
    @balance = 100
    @deck = deck
  end

  def game
    #shuffle
    #call bets
    #deal
    #move
    #evaluate
    #repeat
  end

  protected

  def shuffle_deck
  end

  def call_bets
    #should address players' wallets via methods
  end

  def deal
  end

  def move
  end

  def evaluate_game
  end
end
