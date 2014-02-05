require 'helper'

class TestDeck< Test::Unit::TestCase
  def setup
    @deck = Blackjack::Deck.new
  end

  def test_52_cards
    assert_equal 52, @deck.count
  end

  def test_shuffle
    initial_state = @deck.cards.dup
    assert_not_equal initial_state, @deck.shuffle
  end

  def test_draw
    assert @deck.draw.is_a? Blackjack::Card
    assert_equal 51, @deck.count
  end

  def test_reset
    @deck.draw
    assert_equal 51, @deck.count
    @deck.reset
    assert_equal 52, @deck.count
  end
end
