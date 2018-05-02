require_relative 'card'

class Deck
  attr_accessor :cards

  SUITS = %w(♥ ♦ ♣ ♠)
  RANKS = %w(ace 2 3 4 5 6 7 8 9 ten jack queen king)

  def initialize
    @cards =  SUITS.flat_map do |suit|
                RANKS.map do |rank|
                  Card.new(rank, suit)
                end
              end.shuffle
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_top_card
    @cards.pop
  end
end
