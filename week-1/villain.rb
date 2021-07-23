class Villain < Person 
  attr_reader :name, :hitpoint, :attack_damage

  def initialize(name, hitpoint, attack_damage)
    super(name, hitpoint, attack_damage)
    @flee_percentage = 0.5
    @fled = false
  end

  def take_damage(damage)
    super(damage)
    if @hitpoint <= 50 and @hitpoint > 0
      flee if rand < @flee_percentage
    end
  end

  def flee
    @fled = true
    puts "#{@name} has fled the battlefield with #{@hitpoint} hitpoint left"
  end

  def flee?
    @fled
  end
end