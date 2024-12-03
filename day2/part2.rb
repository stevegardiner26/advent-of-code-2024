input = File.read('input.txt')

reports = input.split(/\n/)
safe_reports = 0

def verify(levels)
    prev = levels[0]
    is_safe = true
    increasing = prev < levels[1]
    levels[1..].each do |l|
        diff = (l - prev).abs
        if (diff >= 1 && diff <= 3)
            if (prev < l && increasing)
                is_safe = true
            elsif (prev > l && !increasing)
                is_safe = true
            else
                is_safe = false
                break
            end
        else
            is_safe = false
            break
        end 
        prev = l
    end
    return is_safe
end

reports.each do |report|
    levels = report.split
    levels.map!(&:to_i)
    is_safe = verify(levels)
    if is_safe
        safe_reports += 1
    else
        levels.each_with_index do |level, idx|
            valid = verify(levels.dup.tap{|i| i.delete_at(idx)})
            if valid
                safe_reports += 1
                break
            end
        end
    end
end

puts safe_reports

