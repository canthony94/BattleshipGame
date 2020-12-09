require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (n*n)/2
        @max_input = n - 1
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            p "you win"        
            return true
        else
            return false
        end
    end

    def game_over?
        if win? || lose?
            return true
        else
            false
        end
    end

    def turn  
        begin      
            guess = @player.get_move
            
            if @board.attack(guess) == false
                @remaining_misses -= 1
            end
            @board.print
            puts "Remaining misses: #{@remaining_misses}"
        rescue NoMethodError
            puts "please enter a valid sequence between 0 and #{@max_input}"
        end
    end
end
