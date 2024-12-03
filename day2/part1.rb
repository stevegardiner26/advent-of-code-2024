input = File.read('input.txt')

reports = input.split(/\n/)
safe_reports = 0

reports.each do |report|
    levels = report.split
    levels.map!(&:to_i)
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
    safe_reports += 1 if is_safe
end

puts safe_reports