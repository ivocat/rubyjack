module PlayerMethods
  attr_reader :bank, :hand

  BET_SIZE = 10

  def call_bet
    @bank -= BET_SIZE
  end

  def get_card(card)
    @hand ||= []
    @hand << card
  end

  def return_card
    @hand.pop
  end

  def hand_value
    value = 0
    aces_in_hand = 0
    @hand.each do |card|
      value += card.value
      aces_in_hand += 1 if card.rank == :ace
    end
    aces_in_hand.times do
      if value > 21
        value -= 10
      end
    end
    value
  end

  def award
    @bank += BET_SIZE
  end

  def hand_size
    @hand.length
  end

  def refill_bank
    @bank = 100
  end
end
