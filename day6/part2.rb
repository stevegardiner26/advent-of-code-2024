input = File.read('input.txt')

initial_grid = input.split(/\n/).map{|a| a.split('')}
initial_position = [0, 0]
final_obstacle_count = 0

initial_grid.each_with_index do |y, y_idx|
    y.each_with_index do |x, x_idx|
        if x == "^"
            initial_position = [y_idx, x_idx]
            break
        end
    end
end

# Go through every position in the grid from initial position Y, starting at X 0 and replace each one 1 by 1 with a #
# Make a new grid var and pass it into the move. Check in the move function if it hits that specific coordinate as the "next item" more than once.
# break the recursion and add to the total count

initial_grid.each_with_index do |y, y_idx|
    if y_idx >= initial_position[0] || true
        y.each_with_index do |x, x_idx|
            next if x_idx == initial_position[1] && y_idx == initial_position[0]
            grid = initial_grid.map(&:dup)
            grid[y_idx][x_idx] = '#'
            current_position = initial_position.dup
            visited_array = {}
            while true do
                current_value = grid[current_position[0]][current_position[1]]
                if current_value == '^'
                    break if (current_position[0] - 1) < 0
                    next_value = grid[current_position[0] - 1][current_position[1]]

                    if next_value == '#'
                        grid[current_position[0]][current_position[1]] = '>'
                        arr_key = "#{current_position[0]},#{current_position[1]}"
                        if visited_array[arr_key] && visited_array[arr_key] >= 1
                            final_obstacle_count += 1
                            break
                        end
                        visited_array[arr_key] ? visited_array[arr_key] += 1 : visited_array[arr_key] = 0
                    else
                        grid[current_position[0]][current_position[1]] = 'X'
                        grid[current_position[0] - 1][current_position[1]] = current_value
                        current_position = [current_position[0] - 1, current_position[1]]
                    end
                elsif current_value == '>'
                    break if current_position[1] + 1 > grid[0].length
                    next_value = grid[current_position[0]][current_position[1] + 1]

                    if next_value == '#'
                        grid[current_position[0]][current_position[1]] = 'V'
                        arr_key = "#{current_position[0]},#{current_position[1]}"
                        if visited_array[arr_key] && visited_array[arr_key] >= 1
                            final_obstacle_count += 1
                            break
                        end
                        visited_array[arr_key] ? visited_array[arr_key] += 1 : visited_array[arr_key] = 0
                    else
                        grid[current_position[0]][current_position[1]] = 'X'
                        grid[current_position[0]][current_position[1] + 1] = current_value
                        current_position = [current_position[0], current_position[1] + 1]
                    end
                elsif current_value == 'V'
                    break if (current_position[0] + 1) >= grid.length
                    next_value = grid[current_position[0] + 1][current_position[1]]

                    if next_value == '#'
                        grid[current_position[0]][current_position[1]] = '<'
                        arr_key = "#{current_position[0]},#{current_position[1]}"
                        if visited_array[arr_key] && visited_array[arr_key] >= 1
                            final_obstacle_count += 1
                            break
                        end
                        visited_array[arr_key] ? visited_array[arr_key] += 1 : visited_array[arr_key] = 0
                    else
                        grid[current_position[0]][current_position[1]] = 'X'
                        grid[current_position[0] + 1][current_position[1]] = current_value
                        current_position = [current_position[0] + 1, current_position[1]]
                    end
                elsif current_value == '<'
                    break if (current_position[1] - 1) < 0
                    next_value = grid[current_position[0]][current_position[1] - 1]

                    if next_value == '#'
                        grid[current_position[0]][current_position[1]] = '^'
                        arr_key = "#{current_position[0]},#{current_position[1]}"
                        if visited_array[arr_key] && visited_array[arr_key] >= 1
                            final_obstacle_count += 1
                            break
                        end
                        visited_array[arr_key] ? visited_array[arr_key] += 1 : visited_array[arr_key] = 0
                    else
                        grid[current_position[0]][current_position[1]] = 'X'
                        grid[current_position[0]][current_position[1] - 1] = current_value
                        current_position = [current_position[0], current_position[1] - 1]
                    end
                end
            end
        end
    end
end

puts final_obstacle_count