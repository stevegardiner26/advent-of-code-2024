input = File.read('input.txt')

initial_grid = input.split(/\n/).map{|a| a.split('')}
initial_position = [0, 0]

initial_grid.each_with_index do |y, y_idx|
    y.each_with_index do |x, x_idx|
        if x == "^"
            initial_position = [y_idx, x_idx]
            break
        end
    end
end

def move(grid, current_position)
    current_value = grid[current_position[0]][current_position[1]]
    if current_value == '^'
        return grid if (current_position[0] - 1) < 0
        next_value = grid[current_position[0] - 1][current_position[1]]

        if next_value == '#'
            grid[current_position[0]][current_position[1]] = '>'
        else
            grid[current_position[0]][current_position[1]] = 'X'
            grid[current_position[0] - 1][current_position[1]] = current_value
            current_position = [current_position[0] - 1, current_position[1]]
        end
    elsif current_value == '>'
        return grid if current_position[1] + 1 > grid[0].length
        next_value = grid[current_position[0]][current_position[1] + 1]

        if next_value == '#'
            grid[current_position[0]][current_position[1]] = 'V'
        else
            grid[current_position[0]][current_position[1]] = 'X'
            grid[current_position[0]][current_position[1] + 1] = current_value
            current_position = [current_position[0], current_position[1] + 1]
        end
    elsif current_value == 'V'
        return grid if (current_position[0] + 1) >= grid.length
        next_value = grid[current_position[0] + 1][current_position[1]]

        if next_value == '#'
            grid[current_position[0]][current_position[1]] = '<'
        else
            grid[current_position[0]][current_position[1]] = 'X'
            grid[current_position[0] + 1][current_position[1]] = current_value
            current_position = [current_position[0] + 1, current_position[1]]
        end
    elsif current_value == '<'
        return grid if (current_position[1] - 1) < 0
        next_value = grid[current_position[0]][current_position[1] - 1]

        if next_value == '#'
            grid[current_position[0]][current_position[1]] = '^'
        else
            grid[current_position[0]][current_position[1]] = 'X'
            grid[current_position[0]][current_position[1] - 1] = current_value
            current_position = [current_position[0], current_position[1] - 1]
        end
    end

    move(grid, current_position)
end

final_grid = move(initial_grid, initial_position)
puts final_grid.join('').count('X') + 1