require 'byebug'
require 'colorize'
class TowersOfHanoi
  attr_reader :towers, :name, :start_pos, :end_pos

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move(from_tower, to_tower)
    towers[to_tower] << towers[from_tower].pop
  end

  def valid_move?(from_tower, to_tower)
    return false if towers[from_tower].empty? || (!towers[to_tower].last.nil? && towers[from_tower].last > towers[to_tower].last )
    return true if towers[to_tower].empty? || towers[from_tower].last < towers[to_tower].last
  end

  def won?
    @towers[1].length == 3 || @towers[2].length == 3 ? true : false
  end

  def render
    @towers.each_with_index do |tower, i|
      puts "Tower#{i+1}:"
      if tower.empty?
        puts '    empty'
      else
        (0...tower.length).reverse_each do |i1|
          puts "    #{tower[i1]}"
        end

      end
    end
  end

  def get_name
    puts 'Hello user, whats your name?'.cyan
    @name = gets.chomp
  end

  def get_start_pos
    puts "Hey #{name} we have 3 towers, where do you want to move from? (input a number 1-3)".cyan
    @start_pos = gets.chomp.to_i
  end

  def get_end_pos
    puts "Nice choice #{name}! Where do you want to move to? Remember, you cannot move to the same tower you are coming from.".cyan
    @end_pos = gets.chomp.to_i
  end

  def play
    get_name
    render
    until won?
      get_start_pos
      get_end_pos
      until valid_move?(start_pos-1, end_pos-1)
        puts 'not a valid move, try again'.red
        get_start_pos
        get_end_pos
      end
      move(start_pos-1, end_pos-1)
      puts 'your move was succesful'.green
      render
    end
    puts "You won! You are awesome! :D".yellow
  end
end

game = TowersOfHanoi.new
game.play