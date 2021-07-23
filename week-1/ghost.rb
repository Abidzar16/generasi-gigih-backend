class Ghost < Person 
  attr_reader :name, :hitpoint, :attack_damage

  def initialize(name, hitpoint, attack_damage)
    @name = name
    @hitpoint = hitpoint
    @attack_damage = attack_damage
  end

  def take_damage(damage)
    multiplier = rand <= 80/100.0 ? 0 : 1
    if multiplier == 0 then
      puts "#{@name} deflect the attack"
    end
    actual_damage = damage * multiplier
    @hitpoint -= actual_damage
  end
end