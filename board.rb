class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join" "
        end
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](position)
        row, col = position
        return @grid[row][col]
    end

    def []=(position, val)
            row, col = position
            @grid[row][col] = val
    end

    def num_ships
        @grid.flatten.count {|ele| ele == :S}
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            p "You sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        i = 0
        quarter = @size * 0.25

        while self.num_ships < quarter
            random1 = rand(0...@grid.length)
            random2 = rand(0...@grid.length)
            pos = [random1, random2]
            self[pos] = :S
            i += 1
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end

