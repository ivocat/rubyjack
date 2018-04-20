class Deck
  @cards = []

  def initialize
  end

  def shuffle
  end

  def get_top_card
  end

  protected

  def create_deck
    suites = %i(hearts diamonds clubs spades)
    ranks = %i(ace two three four five six seven eight nine ten jack queen king)
    suites.each do |suite|
      ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end
end
