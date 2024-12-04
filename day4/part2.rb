input = File.read('input.txt')

mapping_array = input.split(/\n/)
mapping_array.map!{|a| a.split('')}
xmas_count = 0

mapping_array.each_with_index do |row, y|
    row.each_with_index do |item, x|
        next if item != "A"

        if mapping_array[y-1] && mapping_array[y+1] && y-1 >= 0 && x-1 >= 0
            if (mapping_array[y-1][x-1] == "M" && mapping_array[y+1][x+1] == "S") || (mapping_array[y-1][x-1] == "S" && mapping_array[y+1][x+1] == "M")
                if (mapping_array[y-1][x+1] == "M" && mapping_array[y+1][x-1] == "S") || (mapping_array[y-1][x+1] == "S" && mapping_array[y+1][x-1] == "M")
                    xmas_count += 1
                    next
                end
            end
        end
    end
end

puts xmas_count