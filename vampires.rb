class Vampire
  @@coven = []

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = false
    @drank_blood_today = false
  end

# READERS
  def in_coffin?
    @in_coffin
  end

  def drank_blood_today?
    @drank_blood_today
  end

  def self.coven
    @@coven
  end

# WRITERS
  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end

  def sunset
    @drank_blood_today = false
    @in_coffin = false
  end


# CLASS METHODS
  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@coven.push(new_vampire)
    return new_vampire
  end

#Why did it not work with @@coven.delete(vampire) if drank_blood_today = false || in_coffin = false
  def self.sunrise
    new_coven = []
    @@coven.map do |vampire|
      if vampire.drank_blood_today? == true && vampire.in_coffin? == true
        new_coven.push(vampire)
      end
    end
    @@coven = new_coven
    return @@coven
  end

  def self.sunset
    new_coven = @@coven.map do |vampire|
      vampire.sunset
    end
    return @@coven
  end

end

p russ = Vampire.create("Russ", 202)
p kevin = Vampire.create("Kevin", 474)
p hamed = Vampire.create("Hamed", 455)
p adam = Vampire.create("Adam", 215)
p connor = Vampire.create("Connor", 155)
p ryan = Vampire.create("Ryan", 255)

p "---------------------------------"
p Vampire.coven
p "---------------------------------"

p russ.drink_blood
p russ.go_home
p hamed.drink_blood
p hamed.go_home
p connor.drink_blood
p connor.go_home
p kevin.drink_blood
p adam.drink_blood
p ryan.go_home
p "---------------------------------"
p Vampire.coven
p "---------------------------------"
p Vampire.sunrise
p "---------------------------------"
p Vampire.coven
p "---------------------------------"
p Vampire.sunset
p "---------------------------------"
p "---------------------------------"
p Vampire.coven
p "---------------------------------"
p russ
p kevin
p hamed
p adam
p connor
p ryan
