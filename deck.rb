require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    puts self.cards
    create_deck
  end

  def shuffle
  end

  def get_top_card
  end

  def prepare_deck
    create_deck
    shuffle
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
