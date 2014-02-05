module Blackjack
  class Player
    attr_accessor :hand
    def initialize
      @hand = []
    end

    def hand_value
      @hand_value = 0
      @hand.select {|card| card.type != "ace" }.each do |card|
        case card.type
        when 2..10
          @hand_value += card.type
        else
          @hand_value += 10
        end
      end

      @hand.select {|card| card.type == "ace" }.each do |ace|
        if @hand_value + 11 < 21
          @hand_value += 11
        else
          @hand_value += 1
        end
      end

      @hand_value
    end

    def bust?
      hand_value > 21
    end

    def hit?
      hand_value <= 17
    end

    def stay?
      !hit?
    end
  end
end
