require_relative "villain"

class MongolArcher < Villain
   def attack(other_person)
    puts "#{@name} shoots an arrow at #{other_person.name} with #{@attack_damage} damage"
    other_person.take_damage(@attack_damage)
    other_person.is_dead(other_person.get_hitpoint)
  end
end

class MongolSpearman < Villain
   def attack(other_person)
    puts "#{@name} thrusts #{other_person.name} with #{@attack_damage} damage"
    other_person.take_damage(@attack_damage)
    other_person.is_dead(other_person.get_hitpoint)
  end
end

class MongolSwordsman < Villain
   def attack(other_person)
    puts "#{@name} slashes #{other_person.name} with #{@attack_damage} damage"
    other_person.take_damage(@attack_damage)
    other_person.is_dead(other_person.get_hitpoint)
  end
end