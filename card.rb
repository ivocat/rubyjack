class Card
  class << self
    attr_reader :rank_value, :suit_symbol

    def rank_letter(rank)
      if self.rank_value[rank] >= 10
        rank[0].upcase
      else
        self.rank_value[rank]
      end
    end
  end

  @rank_value = {
    ace: 11,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
    ten: 10,
    jack: 10,
    queen: 10,
    king: 10,
  }

  @suit_symbol = {
    hearts: '♥',
    diamonds: '♦',
    clubs: '♣',
    spades: '♠',
  }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def short_name
    self.class.rank_letter(@rank).to_s + self.class.suit_symbol[suit]
  end

  def value
    self.class.rank_value[@rank]
  end
end
