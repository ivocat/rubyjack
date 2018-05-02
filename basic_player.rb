class BasicPlayer
  attr_reader :bank, :hand

  def call_bet(bet_size)
    @bank -= bet_size
  end

  def get_card(card)
    @hand ||= []
    @hand << card
  end

  def return_card
    @hand.pop
  end

  def hand_value
    hand_value = 0
    @hand.sort_by { |card| card.value }.each do |card|
      if hand_value + card.value <= 21
        hand_value += card.value
      else
        hand_value += card.alter_value
      end
    end
    hand_value
  end

  def award(reward_size)
    @bank += reward_size
  end

  def hand_size
    @hand.length
  end

  def refill_bank
    @bank = 100
  end
end
