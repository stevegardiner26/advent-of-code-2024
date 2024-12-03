# input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
input = File.read('input.txt')

actions = input.scan(/(don't)\(\)|(do)\(\)|mul\(([\d]+),([\d]+)\)/)

sum = 0
allow = true
actions.each do |action|
    allow = false if action[0]
    allow = true if action[1]
    if allow && action[2] && action[3]    
        sum += action[2].to_i * action[3].to_i
    end
end

puts sum