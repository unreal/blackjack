require 'helper'

class TestPlayer < Test::Unit::TestCase
  def setup
    @player = Blackjack::Player.new
    @six = Blackjack::Card.new(:hearts, 6)
    @ace = Blackjack::Card.new(:hearts, "ace")
  end

  def test_starts_with_empty_hand
    assert @player.hand.empty?
  end

  def test_hand_value_with_normal_card
    @player.hand << @six
    assert_equal 6, @player.hand_value
  end

  def test_high_ace_value
    @player.hand << @ace
    assert_equal 11, @player.hand_value
  end

  def test_low_ace_value
    @player.hand << @ace
    @player.hand << @ace
    assert_equal 12, @player.hand_value
  end

  def test_hits_on_17
    @player.hand << @ace
    @player.hand << @six
    assert @player.hit?
  end

  def test_stays_on_18
    @player.hand << @ace
    @player.hand << @ace
    @player.hand << @six
    assert @player.stay?
  end

  def test_busts_when_higher_than_21
    @player.hand << @six
    @player.hand << @six
    @player.hand << @six
    @player.hand << @six

    assert @player.bust?
  end

end
