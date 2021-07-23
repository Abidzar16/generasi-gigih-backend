class Person
  attr_reader :name, :hitpoint, :attack_damage

  def initialize(name, hitpoint, attack_damage)
    @name = name
    @hitpoint = hitpoint
    @attack_damage = attack_damage
  end

  def get_name
    return @name
  end

  def get_hitpoint
    return @hitpoint
  end

  def get_attack_damage
    return @attack_damage
  end

  def attack(other_person)
    puts "#{@name} attacks #{other_person.get_name} with #{@attack_damage} damage"
    other_person.take_damage(@attack_damage)
  end

  def take_damage(damage)
    @hitpoint -= damage
    self.is_dead(@hitpoint)
  end

  def is_dead(hitpoint)
    if hitpoint <= 0 then
      puts "#{@name} dead"
    end
  end

  def healed_by(ally)
    heal = 20
    @hitpoint += heal
    puts "#{ally.get_name} heals #{@name}, restoring #{heal} points"
  end
end