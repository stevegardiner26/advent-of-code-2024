input = File.read('test.txt')

reports = input.split(/\n/)
safe_reports = 0

reports.each do |report|
    unsafe_levels = 0
    levels = report.split
    levels.map!(&:to_i)
    prev = levels[0]
    is_safe = true
    increasing = prev < levels[1]
    increasing_count = 0
    decreasing_count = 0
    increasing_count += 1 if increasing
    decreasing_count += 1 if !increasing
    diff_too_big = false
    levels[1..].each_with_index do |l, idx|
        diff = (l - prev).abs
        if (diff >= 1 && diff <= 3)
            if (prev < l && increasing)
                is_safe = true
                increasing_count += 1
            elsif (prev > l && !increasing)
                is_safe = true
                decreasing_count += 1
            else
                is_safe = false
            end
        else
            is_safe = false
            if diff > 3
                diff_too_big = true
                break
            end
        end 
        prev = l
    end
    is_safe = true if (decreasing_count == 1 || increasing_count == 1) && !diff_too_big
    safe_reports += 1 if is_safe
end

puts safe_reports

