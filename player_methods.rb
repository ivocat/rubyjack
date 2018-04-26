module PlayerMethods
  attr_reader :bank

  BET_SIZE = 10

  def call_bet
    @bank -= BET_SIZE
  end

  def get_card(card)
    @hand ||= []
    @hand << card
  end

  def hand_value
    value = 0
    @hand.each do |card|
      if card.rank == :ace
        value += 11 if value + 11 <= 21
        value += 1 if value + 11 > 21
      else
        value += card.value
      end
    end
    value
  end
end
