class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def species
    @species = "human"
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end
  
  def walk_dogs
    d = dogs
    d.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    c = cats
    c.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = cats + dogs
    pets.each {|pet| pet.mood = "nervous"}
    pets.each {|pet| pet.owner = nil}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

end