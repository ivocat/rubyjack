class Card
  RANK_VALUE = {
    'ace' => 11,
    'ten' => 10,
    'jack' => 10,
    'queen' => 10,
    'king' => 10,
  }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def rank_letter(rank)
    if RANK_VALUE.fetch(rank, rank.to_i) >= 10
      rank[0].upcase
    else
      RANK_VALUE.fetch(rank, rank.to_i)
    end
  end

  def short_name
    self.rank_letter(@rank).to_s + @suit
  end

  def value
    RANK_VALUE.fetch(@rank, @rank.to_i)
  end

  def alter_value
    if @rank == 'ace'
      1
    else
      value
    end
  end
end
