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
    @deck.shuffle
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

  def play_move
    deal_to_self if self.hand_value < 17
  end

  def collect_cards
    [@player, self].each do |party|
      party.hand_size.times do
        @deck.cards << party.return_card
      end
    end
    @deck.shuffle
  end
end
