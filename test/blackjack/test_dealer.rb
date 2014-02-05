require 'helper'

class TestDealer < Test::Unit::TestCase
  def setup
    @table = Blackjack::Table.new
    @dealer = Blackjack::Dealer.new(@table)
    @player = Blackjack::Player.new
  end

  def test_dealer_is_added_to_table
    assert_equal [@dealer], @table.players
  end

  def test_deal_deals_players_two_cards
    @dealer.deal
    assert_equal 2, @dealer.hand.length
    assert_equal 50, @dealer.deck.count
  end

  def test_deal_deals_to_all_players_at_table
    @table.players << @player
    @dealer.deal
    assert_equal 2, @dealer.hand.length
    assert_equal 2, @player.hand.length
    assert_equal 48, @dealer.deck.count
  end

  def test_look_at_deals_a_card_to_a_player_if_hit
    assert @dealer.hit?

    @dealer.look_at(@dealer)
    assert_equal 1, @dealer.hand.length
    assert_equal 51, @dealer.deck.count
  end

  def test_look_at_does_not_deal_a_card_if_player_not_hitting
    ten = Blackjack::Card.new(:hearts,10)
    3.times do
      @dealer.hand << ten
    end

    assert !@dealer.hit?
    @dealer.look_at(@dealer)
    assert_equal 3, @dealer.hand.length
    assert_equal 52, @dealer.deck.count
  end

  def test_hit_puts_a_card_in_a_players_hand
    assert_equal 0, @dealer.hand.length
    @dealer.hit(@dealer)
    assert_equal 1, @dealer.hand.length
  end

  def test_run_game
    @table.players << @player
    @dealer.run_game
  end
end
