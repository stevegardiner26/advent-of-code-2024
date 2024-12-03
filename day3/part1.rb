input = File.read('input.txt')

puts input.scan(/mul\(([\d]+),([\d]+)\)/).sum{|action| action[0].to_i * action[1].to_i}