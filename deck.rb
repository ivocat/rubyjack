require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    suites = %w(♥ ♦ ♣ ♠)
    ranks = %w(ace 2 3 4 5 6 7 8 9 ten jack queen king)
    suites.each do |suit|
      ranks.each do |rank|
        self.cards << Card.new(rank, suit)
      end
    end
    shuffle
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_top_card
    @cards.pop
  end
end
