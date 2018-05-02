class Card
  class << self
    attr_reader :RANK_VALUE, :SUIT_SYMBOL
  end

  @RANK_VALUE = {
    'ace' => 11,
    # two: 2,
    # three: 3,
    # four: 4,
    # five: 5,
    # six: 6,
    # seven: 7,
    # eight: 8,
    # nine: 9,
    'ten' => 10,
    'jack' => 10,
    'queen' => 10,
    'king' => 10,
  }

  @SUIT_SYMBOL = {
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

  def rank_letter(rank)
    if self.class.RANK_VALUE.fetch(rank, rank.to_i) >= 10
      rank[0].upcase
    else
      self.class.RANK_VALUE.fetch(rank, rank.to_i)
    end
  end

  def short_name
    self.rank_letter(@rank).to_s + self.class.SUIT_SYMBOL[suit]
  end

  def value
    self.class.RANK_VALUE.fetch(@rank, @rank.to_i)
  end
end
