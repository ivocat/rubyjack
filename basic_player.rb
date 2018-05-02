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
    value = 0
    aces_in_hand = 0
    @hand.each do |card|
      value += card.value
      aces_in_hand += 1 if card.rank == 'ace'
    end
    aces_in_hand.times do
      if value > 21
        value -= 10
      end
    end
    value
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
