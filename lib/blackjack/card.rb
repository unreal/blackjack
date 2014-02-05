module Blackjack
  class Card
    attr_reader :type
    def initialize(suit, type)
      @suit = suit
      @type = type
    end

    def to_s
      "#{@type} of #{@suit}"
    end
  end
end
