input = File.read('test.txt')

sections = input.split(/\n\n/)
rules = sections[0].split(/\n/)
updates = sections[1].split(/\n/)

rule_hash = {}

rules.each do |rule|
    key = rule.split(/\|/)[0]
    value = rule.split(/\|/)[1]
    # Key of values that have to be after, if before we fail.
    if rule_hash[key]
        rule_hash[key] << value
    else
        rule_hash[key] = [value]
    end
end

middle_pages = []
updates.each do |update|
    update_pages = update.split(/\,/)
    proper_order = []
    failed_at_some_point = false

    update_pages.each do |page|
        if rule_hash[page]
            failed = rule_hash[page].any?{|i| proper_order.include?(i)}
            if failed
                failed_at_some_point = true
                indexes = rule_hash[page].map{|rule| proper_order.index(rule)}.reject{|a| a.nil?}.map(&:to_i)
                if !indexes || indexes.min == 0 && false
                    proper_order.unshift(page)
                else
                    proper_order.insert(indexes.min, page)
                end
            else
                proper_order << page
            end
        else
            proper_order << page
        end
    end

    if failed_at_some_point
        l = proper_order.length
        middle_pages << proper_order[l / 2].to_i
    end
end

puts middle_pages.sum