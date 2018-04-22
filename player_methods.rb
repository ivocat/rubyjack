module PlayerMethods
  attr_reader :balance, :hand

  def call_bet
    @balance -= 10
  end

  def get_cards(card)
    @hand ||= []
    @hand << card
  end
end
