require 'blackjack/player'

module Blackjack
  class Dealer < Player
    attr_reader :hand, :deck
    def initialize(table)
      @hand = []
      @deck = Blackjack::Deck.new
      @table = table

      @table.players << self
    end

    def deal
      2.times do
        @table.players.each do |player|
          card = @deck.draw
          player.hand << card
          puts "#{player} drew a #{card}"
        end
      end
    end

    def run_game
      puts "running game"
      @deck.shuffle
      deal

      while @table.players_hitting?
        puts "running a round"
        @table.players.each do |player|
          next if bust?
          look_at(player)
        end
      end

      puts "---- done dealing ----"

      if @table.dealer.bust?
        puts "Dealer busts"
        @hand_to_beat = 0
      else
        @hand_to_beat = @table.dealer.hand_value
        puts "Dealer: #{@hand_to_beat}"
      end

      if @table.non_busts.any?
        @table.non_busts.each do |player|
          if player.hand_value >= @hand_to_beat
            puts "#{player} wins: #{player.hand_value}"
          else
            puts "#{player} loses: #{player.hand_value}"
          end
        end
      end

      @table.busts.each do |player|
        puts "#{player} busts: #{player.hand_value}"
      end
    end

    def look_at(player)
      if player.hit?
        hit(player)
      end
    end

    def hit(player)
      card = @deck.draw
      player.hand << card
      puts "#{player} hit and got a #{card}"
    end
  end
end
