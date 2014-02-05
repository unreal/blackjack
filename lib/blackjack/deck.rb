module Blackjack
  class Deck
    attr_reader :cards
    def initialize
      reset
    end

    def shuffle
      @cards.shuffle!
    end

    def draw
      @cards.shift
    end

    def count
      @cards.length
    end

    def reset
      @cards = []
      [:hearts, :diamonds, :spades, :clubs].each do |suit|
        ['ace',2,3,4,5,6,7,8,9,10,'jack','queen','king'].each do |type|
          @cards << Blackjack::Card.new(suit, type)
        end
      end
    end
  end
end
