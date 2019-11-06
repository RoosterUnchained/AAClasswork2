# PHASE 2
def convert_to_int(str)
  Integer(str)
  rescue ArgumentError
    puts "error cannot convert to integer"
  ensure
    nil 
end

# PHASE 3

class CoffeeError < StandardError
  def message
    puts "Coffee is good, but it's not fruit. Try one more time."
  end
end

class InvalidFruit < StandardError
  def message
    puts "Not coffee, not fruit. Go away."
  end
end

FRUITS = ["apple", "banana", "orange"]
COFFEE = 'coffee'

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == COFFEE
    raise CoffeeError 
  else 
    raise InvalidFruit
  end 
end

def feed_me_a_fruit
  begin
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
  rescue CoffeeError => e 
    puts e.message
    retry
  rescue InvalidFruit => i
    puts i.message
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise "You're not REALLY best friends, too little time" if yrs_known < 5 
    raise "You can't have any friends if you don't have any hobbies" unless fav_pastime.length > 0
    raise "Even imaginary friends have names, what's your friend's name?" unless name.length > 0
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


