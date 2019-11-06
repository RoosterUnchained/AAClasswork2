require_relative "cards"
class Board

    attr_reader :size, :board

    def initialize(size = 4)
        @board = Array.new(size) { Array.new(size) }
        @size = size
    end 
    
    def populate
        num_pairs = (self.size * self.size) / 2
        alphabet = ("a".."z").to_a
        letters = ("a".."z").to_a.take(num_pairs)
        cards = (letters * 2).shuffle
        @board.each do |arr|
            arr.each_index do |i|
                arr[i] = Cards.new(cards.pop)
            end 
        end         
    end

    def render
        @board.each_with_index do |arr, i|
            puts "#{i} : #{arr}"
        end
    end

    def reveal(guess_position)

    end
end



    
    
board1 = Board.new
board1.populate
p board1.board