module PlayerMethods
  attr_reader :bank

  def call_bet
    @bank -= 10
  end

  def get_card(card)
    @hand ||= []
    @hand << card
  end

  def hand_value
    #value calculation here
  end
end
