input = File.read('input.txt') # 85 lines

mapping_array = input.split(/\n/).map{|a| a.split('')}
xmas_count = 0

mapping_array.each_with_index do |row, y|
    row.each_with_index do |item, x|
        next if item != "X"
        
        if y-3 >= 0 && x-3 >= 0
            # TOP LEFT
            if mapping_array[y-1][x-1] == "M" && mapping_array[y-2][x-2] == "A" && mapping_array[y-3][x-3] == "S"
                xmas_count += 1
            end

            # TOP MIDDLE
            if mapping_array[y-1][x] == "M" && mapping_array[y-2][x] == "A" && mapping_array[y-3] && mapping_array[y-3][x] == "S"
                xmas_count += 1
            end

            # TOP RIGHT
            if mapping_array[y-1][x+1] == "M" && mapping_array[y-2][x+2] == "A" && mapping_array[y-3][x+3] == "S"
                xmas_count += 1
            end
            
            # LEFT
            if mapping_array[y][x-1] == "M" && mapping_array[y][x-2] == "A" && mapping_array[y][x-3] == "S"
                xmas_count += 1
            end

            # RIGHT
            if mapping_array[y][x+1] == "M" && mapping_array[y][x+2] == "A" && mapping_array[y][x+3] == "S"
                xmas_count += 1
            end

            # BOTTOM LEFT
            if mapping_array[y+1][x-1] == "M" && mapping_array[y+2][x-2] == "A" && mapping_array[y+3][x-3] == "S"
                xmas_count += 1
            end
        
            # BOTTOM MIDDLE
            if mapping_array[y+1][x] == "M" && mapping_array[y+2][x] == "A" && mapping_array[y+3][x] == "S"
                xmas_count += 1
            end

            # BOTTOM RIGHT
            if mapping_array[y+1][x+1] == "M" && mapping_array[y+2][x+2] == "A" && mapping_array[y+3][x+3] == "S"
                xmas_count += 1
            end
        end
    end
end

puts xmas_count