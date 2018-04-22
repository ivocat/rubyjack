require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    create_deck
    shuffle
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_top_card
    @cards.pop
  end

  protected

  def create_deck
    suites = %i(hearts diamonds clubs spades)
    ranks = %i(ace two three four five six seven eight nine ten jack queen king)
    suites.each do |suit|
      ranks.each do |rank|
        self.cards << Card.new(rank, suit)
      end
    end
  end
end
