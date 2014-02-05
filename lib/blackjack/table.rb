module Blackjack
  class Table
    attr_accessor :players
    def initialize
      @players = []
    end

    def everyone_but_dealer
      @players.select {|p| !p.is_a?(Blackjack::Dealer) }
    end

    def dealer
      @players.find {|p| p.is_a?(Blackjack::Dealer) }
    end

    def players_hitting?
      return false if dealer.bust?

      @players.select {|p| p.hit? }.any?
    end

    def busts
      everyone_but_dealer.select {|p| p.bust? }
    end

    def non_busts
      everyone_but_dealer.select {|p| !p.bust? }
    end
  end
end
