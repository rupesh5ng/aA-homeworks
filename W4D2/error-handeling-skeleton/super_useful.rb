# PHASE 2
# def convert_to_int(str)
  
#   puts "Please pass an string of numbers"
#   str = gets.chomp
#    unless "0123456789".include?(str)
#     raise "Please pass an string of numbers"
#    end


#   Integer(str)

# end

# PHASE 3
FRUITS = ["apple", "banana", "orange"].freeze

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

begin
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 

rescue CoffeeError => e 
  puts e.message
  retry
rescue NotFruitMethos => e
  puts e.message
end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new("'name' can't be empty") if name.empty?
    raise ArgumentError.new("'yrs_known' >= 5 for best friendship bracelet receiver (best friendships take time)") if yrs_known.to_i < 5
    raise ArgumentError.new("Need somekind of memory") if fav_pastime.empty?

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


