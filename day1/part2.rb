input = File.read('input.txt')

right_list = input.scan(/ [\d]+/).map(&:to_i)
similarity_score = 0

left_list = input.scan(/[\d]+ /).map(&:to_i)

left_list.each do |li|
    similarity_score += right_list.count(li) * li
end

puts similarity_score