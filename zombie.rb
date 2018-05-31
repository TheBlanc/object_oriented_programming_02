class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed, strength)
     if speed > @@max_speed
       @speed = @@default_speed
     else
       @speed = speed
     end

     if strength > @@max_strength
       @strength = @@default_strength
     else
       @strength = strength
     end
  end

  def strength
    @strength
  end

  def strength=(strength)
    @strength = strength
  end

  def speed
    @speed
  end

  def speed=(speed)
    @speed = speed
  end

  def self.all
    @@horde
  end

  def self.spawn
    rand(@@plague_level).times do
      new_zombie = self.new(rand(@@max_speed), rand(@@max_strength))
      @@horde.push(new_zombie)
    end
  end

  def self.increase_plague_level
    @@plague_level += rand(0..2)
  end

  def self.some_die_off
    rand(1..10).times do
      @@horde.pop
    end
  end

  def self.new_day
    self.some_die_off
    self.spawn
    self.increase_plague_level
  end

  def outrun_zombie?
    your_speed = rand(@@max_speed)
    zombie_speed = self.speed
    if  your_speed >= zombie_speed
      puts "Your speed = #{your_speed}. Zombie speed = #{zombie_speed}"
      return true
    else
       puts "Your speed = #{your_speed}. Zombie speed = #{zombie_speed}"
       return false
    end
  end

  def survive_attack?
    your_strength = rand(@@max_strength)
    zombie_strength = self.strength
    if  your_strength >= zombie_strength
      puts "Your strength = #{your_strength}. Zombie strength = #{zombie_strength}"
      # puts "You killed it! But got scratched..."
      # puts "Welcome to dat zombie life"

      return true
    else
      puts "Your strength = #{your_strength}. Zombie strength = #{zombie_strength}"
      # puts "You dead..."
      # puts "But at least you're not a zombie!"

      return false
    end
  end

  def encounter
    if self.outrun_zombie?
      return "You got away!"
    else
      puts "Zombie caught up..."
    end

    if self.survive_attack?
      puts "You killed it! But got scratched..."
      puts "Welcome to dat zombie life!"
      you_zombie = Zombie.new(rand(10), rand(10))
      @@horde.push(you_zombie)
      return you_zombie
    else
      return "You died...But at least you're not a zombie!"


    end
  end

end

p Zombie.new_day
p Zombie.all
p "------NEW DAY---------"
p Zombie.new_day
p Zombie.all
p "------NEW DAY---------"

# assign random zombie in the horde to "jojo"
p jojo = Zombie.all[rand(Zombie.all.length)]
# check if you out-ran jojo
puts jojo.encounter






# p zombie1 = Zombie.spawn
# p "speed:"
# p zombie1.speed
# p "strength:"
# p zombie1.strength
