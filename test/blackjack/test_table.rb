require 'helper'

class TestTable < Test::Unit::TestCase
  def setup
    @table = Blackjack::Table.new
    @dealer = Blackjack::Dealer.new(@table)
  end

  def test_players_hitting_if_a_player_can_hit
    @player = Blackjack::Player.new
    assert @player.hit?

    @table.players << @player
    assert @table.players_hitting?
  end

  def test_dealer
    assert_equal @dealer, @table.dealer
  end

  def test_everyone_but_dealer
    @player = Blackjack::Player.new
    @table.players << @player
    assert_equal [@player], @table.everyone_but_dealer
  end

end
