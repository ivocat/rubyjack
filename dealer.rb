require_relative 'deck'
require_relative 'player_methods'

class Dealer
  include PlayerMethods
  attr_accessor :move_number
  attr_reader :deck, :bank

  def initialize
    @bank = 100
    @deck = Deck.new
  end

  def introduce_player(player)
    @player = player
  end

  def call_bet
    @bank -= 10
  end

  def shuffle_deck
    deck.shuffle
  end

  def first_deal
    2.times do
      deal_to_self
      deal_to_player
    end
  end

  def deal_to_self
    self.get_card(@deck.deal_top_card)
  end

  def deal_to_player
    @player.get_card(@deck.deal_top_card)
  end

  def reveal_hand
    @hand
  end

  def hand_size
    @hand.length
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
