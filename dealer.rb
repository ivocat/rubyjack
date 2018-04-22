class Dealer
  attr_accessor :move_number
  attr_reader :balance, :deck

  def initialize
    @balance = 100
    @deck = Deck.new
    shuffle_deck
  end

  def call_bet
    @balance -= 10
  end

  protected

  def shuffle_deck
    deck.shuffle
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
