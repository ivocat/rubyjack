require_relative 'dealer'
require_relative 'player'

class House
  attr_reader :interface, :player, :dealer

  def initialize
    @dealer = Dealer.new
  end

  def create_player(name)
    @player = Player.new(name)
    @dealer.introduce_player(@player)
  end

  def play_game
    while game_is_on?
      round
    end
  interface.endgame_prompt
  end

  def add_inteface(interface)
    @interface = interface
  end

  def game_is_on?
    [@dealer.bank, @player.bank].min > 0
  end

  def start_over
    @player.refill_bank
    @dealer.refill_bank
    play_game
  end

  protected

  def round
    call_bets
    deal_cards
    players_move
    if @second_move
      dealers_move
      players_move unless [@player.hand_size, @dealer.hand_size].min == 3
    end
    end_round
    return_cards
  end

  def call_bets
    @dealer.call_bet
    @player.call_bet
  end

  def deal_cards
    @dealer.first_deal
  end

  def players_move
    interface.show_desk(@dealer.bank, @dealer.hand_size, @player.bank, @player.hand)
    case action = interface.request_action(@player.hand_size, @second_move ||= false)
    when :skip
      @second_move = true #skip turn
    when :reveal
      @second_move = false #reveal cards
    else #when :draw
      @dealer.deal_to_player #draw a card
      @second_move = true
    end
  end

  def dealers_move
    @dealer.play_move
  end

  def end_round
    interface.show_desk(@dealer.bank, @dealer.hand_size, @player.bank, @player.hand, true)
    if @player.hand_value == @dealer.hand_value && @player.hand_value <= 21
      @player.award
      @dealer.award
      winner = :noone
    elsif @player.hand_value > @dealer.hand_value && @player.hand_value <= 21
      2.times { @player.award }
      winner = :player
    else
      2.times { @dealer.award }
      winner = :dealer
    end
    interface.announce_round_winner(winner)
  end

  def return_cards
    @dealer.collect_cards
  end
end
