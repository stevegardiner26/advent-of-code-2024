input = File.read('input.txt')

mapping_array = input.split(/\n/)
mapping_array.map!{|a| a.split('')}
xmas_count = 0

mapping_array.each_with_index do |row, y|
    row.each_with_index do |item, x|
        next if item != "X"
        # We need to check all directions for an "M" and 
        # TOP LEFT
        if mapping_array[y-1] && mapping_array[y-1][x-1] == "M" && (y-3 >= 0) && (x-3 >= 0)
            if mapping_array[y-2] && mapping_array[y-2][x-2] == "A"
                if mapping_array[y-3] && mapping_array[y-3][x-3] == "S"
                    xmas_count += 1
                end
            end
        end

        # TOP MIDDLE
        if mapping_array[y-1] && mapping_array[y-1][x] == "M" && (y - 3 >= 0)
            if mapping_array[y-2] && mapping_array[y-2][x] == "A"
                if mapping_array[y-3] && mapping_array[y-3][x] == "S"
                    xmas_count += 1
                end
            end
        end

        # TOP RIGHT
        if mapping_array[y-1] && mapping_array[y-1][x+1] == "M" && (y - 3 >= 0)
            if mapping_array[y-2] && mapping_array[y-2][x+2] == "A"
                if mapping_array[y-3] && mapping_array[y-3][x+3] == "S"
                    xmas_count += 1
                end
            end
        end

        # LEFT
        if mapping_array[y][x-1] == "M" && (x-3 >= 0)
            if mapping_array[y][x-2] == "A"
                if mapping_array[y][x-3] == "S"
                    xmas_count += 1
                end
            end
        end

        # RIGHT
        if mapping_array[y][x+1] == "M"
            if mapping_array[y][x+2] == "A"
                if mapping_array[y][x+3] == "S"
                    xmas_count += 1
                end
            end
        end

        # BOTTOM LEFT
        if mapping_array[y+1] && mapping_array[y+1][x-1] == "M" && (x-3 >= 0)
            if mapping_array[y+2] && mapping_array[y+2][x-2] == "A"
                if mapping_array[y+3] && mapping_array[y+3][x-3] == "S"
                    xmas_count += 1
                end
            end
        end
        
        # BOTTOM MIDDLE
        if mapping_array[y+1] && mapping_array[y+1][x] == "M"
            if mapping_array[y+2] && mapping_array[y+2][x] == "A"
                if mapping_array[y+3][x] == "S"
                    xmas_count += 1
                end
            end
        end

        # BOTTOM RIGHT
        if mapping_array[y+1] && mapping_array[y+1][x+1] == "M"
            if mapping_array[y+2] && mapping_array[y+2][x+2] == "A"
                if mapping_array[y+3] && mapping_array[y+3][x+3] == "S"
                    xmas_count += 1
                end
            end
        end
    end
end

puts xmas_count