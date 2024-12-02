input = File.read('input.txt')

# input = "3   4
# 4   3
# 2   5
# 1   3
# 3   9
# 3   3"

sum = 0
left_list = input.scan(/[\d]+ /).sort
right_list = input.scan(/ [\d]+/).sort

right_list.each_with_index do |li, idx|
    sum += (li.to_i - left_list[idx].to_i).abs
end

puts sum