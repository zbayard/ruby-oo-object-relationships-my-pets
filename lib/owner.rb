class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self

  end 

  def say_species 
    return "I am a #{@species}." 
  end 

  def self.all 
    @@all 
  end 

  def self.count 
    return @@all.length 
  end
  
  def self.reset_all
    @@all.clear 
  end

  def cats
    Cat.all.select {|cats| cats.owner==self}
  end

  def dogs 
    Dog.all.select {|dogs| dogs.owner==self}
  end 

  def buy_cat(name)
    Cat.new(name, self)
  end 

  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    pets = dogs + cats

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets 
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."

  end 


end