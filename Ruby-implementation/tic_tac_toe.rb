class Gameboard

    @@values = [1,2,3,4,5,6,7,8,9]

    def self.display_board()
        puts " #{@@values[0]} | #{@@values[1]} | #{@@values[2]}"
        puts " - | - | -"
        puts " #{@@values[3]} | #{@@values[4]} | #{@@values[5]}"
        puts " - | - | -"
        puts " #{@@values[6]} | #{@@values[7]} | #{@@values[8]}"
    end

    def self.update_board(value, marker)
        value = value - 1
        @@values[value] = marker
    end

    def self.check_spot?(value)
        value = value - 1
        if @@values[value] == "X" || @@values[value] == "O"
            return true
        else
            return false
        end
    end

    def self.winner?()
        if ((@@values[0] == @@values[1]) && (@@values[0] == @@values[2])) ||
            ((@@values[0] == @@values[3]) && (@@values[0] == @@values[6])) ||
            ((@@values[0] == @@values[4]) && (@@values[0] == @@values[8])) ||
            ((@@values[1] == @@values[4]) && (@@values[1] == @@values[7])) ||
            ((@@values[2] == @@values[4]) && (@@values[2] == @@values[6])) ||
            ((@@values[2] == @@values[5]) && (@@values[2] == @@values[8])) ||
            ((@@values[3] == @@values[4]) && (@@values[3] == @@values[5])) ||
            ((@@values[6] == @@values[7]) && (@@values[6] == @@values[8]))
            
            return true
        else
            return false
        end
    end

    def self.draw?()
        if @@values.any?(Integer)
            return false
        else
            return true
        end
    end
end

class Player

    attr_reader :marker, :name

    def initialize(name, marker)
        @name = name
        @marker = marker
    end

end


def game()
    play = true

    puts "What is the name of player 1?"
    
    player_1 = Player.new(gets.chomp, "X")
    
    puts "What is the name of player 2?"

    player_2 = Player.new(gets.chomp, "O")

    # Gameboard.display_board()

    while play
        Gameboard.display_board()

        puts "#{player_1.name} pick a spot!"

        player_1_input = gets.chomp.to_i
        
        while Gameboard.check_spot?(player_1_input)
            puts "#{player_1.name}!, that spot is taken choose another :)"
            player_1_input = gets.chomp.to_i
        end
        
        Gameboard.update_board(player_1_input, player_1.marker)

        if Gameboard.winner?
            puts "#{player_1.name} is the winner!"
            Gameboard.display_board()
            break
        end

        if Gameboard.draw?
            puts "The game is a draw"
            Gameboard.display_board()
            break
        end

        Gameboard.display_board()

        puts "#{player_2.name} pick a spot!"

        player_2_input = gets.chomp.to_i

        while Gameboard.check_spot?(player_2_input)
            puts "#{player_2.name}!, that spot is taken choose another :)"
            player_2_input = gets.chomp.to_i
        end

        Gameboard.update_board(player_2_input, player_2.marker)

        if Gameboard.winner?
            puts "#{player_2.name} is the winner!"
            Gameboard.display_board()
            break
        end

        if Gameboard.draw?
            puts "The game is a draw"
            Gameboard.display_board()
            break
        end

        Gameboard.display_board()
    end
end

game()