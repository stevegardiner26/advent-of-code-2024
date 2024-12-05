input = File.read('input.txt')

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
    before_visited = []
    failed = false

    update_pages.each do |page|
        if rule_hash[page]
            failed = rule_hash[page].any?{|i| before_visited.include?(i)}
            before_visited << page
            break if failed
        else
            before_visited << page
        end
    end

    unless failed
        l = update_pages.length
        middle_pages << update_pages[l / 2].to_i
    end
end

puts middle_pages.sum