require_relative 'dealer'
require_relative 'player'

class House
  attr_reader :interface, :player, :dealer

  BET_SIZE = 10

  def initialize
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def create_player(name)
    @player = Player.new(name)
  end

  def play_game
    while game_is_on?
      play_round
    end
    interface.endgame_prompt
  end

  def add_inteface(interface)
    @interface = interface
  end

  def game_is_on?
    [@dealer.bank, @player.bank].none?(&:zero?)
  end

  def start_over
    @player.refill_bank
    @dealer.refill_bank
    play_game
  end

  private

  def play_round
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
    @dealer.call_bet(BET_SIZE)
    @player.call_bet(BET_SIZE)
  end

  def deal_cards
    2.times do
      @dealer.get_card(@deck.deal_top_card)
      @player.get_card(@deck.deal_top_card)
    end
  end

  def players_move
    interface.show_desk(@dealer.bank, @dealer.hand_size, @player.bank, @player.hand)
    case action = interface.request_action(players_options)
    when :skip
      @second_move = true #skip turn
    when :reveal
      @second_move = false #reveal cards
    else #when :draw
      @player.get_card(@deck.deal_top_card) #draw a card
      @second_move = true
    end
  end

  def players_options
    players_options = [:draw, :reveal, :skip]
    players_options.pop if ( @second_move ||= false )
    players_options.delete(:draw) if @player.hand_size == 3
    players_options
  end

  def dealers_move
    @dealer.get_card(@deck.deal_top_card) if @dealer.needs_card
  end

  def end_round
    @dealer.hand_revealed = true
    interface.show_desk(@dealer.bank, @dealer.hand_size, @player.bank, @player.hand)
    if @player.hand_value == @dealer.hand_value && @player.hand_value <= 21
      @player.award(BET_SIZE)
      @dealer.award(BET_SIZE)
      winner = :noone
    elsif ( @player.hand_value > @dealer.hand_value && @player.hand_value <= 21 )\
          || @dealer.hand_value > 21
      @player.award(BET_SIZE * 2)
      winner = :player
    else
      @dealer.award(BET_SIZE * 2)
      winner = :dealer
    end
    interface.announce_round_winner(winner)
  end

  def return_cards
    [@player, @dealer].each do |party|
      party.hand_size.times do
        @deck.cards << party.return_card
      end
    end
    @deck.shuffle
    @dealer.hand_revealed = false
    @second_move = false
  end
end
