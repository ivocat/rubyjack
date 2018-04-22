require_relative 'deck'
require_relative 'player_methods'

class Dealer
  include PlayerMethods
  attr_accessor :move_number
  attr_reader :deck

  def initialize
    @balance = 100
    @deck = Deck.new
  end

  def call_bet
    @balance -= 10
  end

  def shuffle_deck
    deck.shuffle
  end

  protected

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
