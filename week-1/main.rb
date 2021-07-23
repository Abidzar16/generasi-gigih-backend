require_relative 'person'
require_relative 'ghost'
require_relative 'villain'
require_relative 'mongol'

jin = Ghost.new("Jin Sakai", 100, 50)
yuna = Person.new("Yuna", 100, 50)
sensei = Person.new("Sensei Ishihara", 100, 50)
ally = [yuna, sensei]

archer = MongolArcher.new("Mongol Archer", 80, 40)
spear = MongolSpearman.new("Mongol Spearman", 120, 60)
sword = MongolSwordsman.new("Mongol Swordsman", 100, 50)
enemy = [archer, spear, sword]

until jin.get_hitpoint <= 0 do
  puts "(1) Attack the enemy"
  puts "(2) Heal the ally"
  option = gets.chomp.to_i

  if option == 1 then
    puts "Which enemy you want to attack?"
    for i in 0..enemy.length()-1 do
      puts "(#{i+1}) #{enemy[i].get_name}"
    end

    target = gets.chomp.to_i
    jin.attack(enemy[target-1])
    
  else
    puts "Which ally you want to heal?"
    for i in 0..ally.length()-1 do
      puts "(#{i+1}) #{ally[i].get_name}"
    end
    target = gets.chomp.to_i
    ally[target-1].healed_by(jin)
  end
  
  puts enemy
  for i in 0..enemy.length()-1 do
    if enemy[i].get_hitpoint() <= 0 or enemy[i].flee? == true
      enemy.delete_at(i)
    end
  end
  puts enemy

  for i in 0..ally.length()-1 do
    target = rand(0..enemy.length()-1)
    ally[i].attack(enemy[target])
  end

  for i in 0..enemy.length()-1 do
    target = rand >= 0.5 ? ally : jin
    if target == ally
      number = rand(0..enemy.length()-1)
      enemy[i].attack(ally[number])
    else 
      enemy[i].attack(jin)
    end
  end
end