###
#
#  Sort integer arguments (ascending) 
#
###

result = []
# Keep track if the first integer has been inserted
first_integer_inserted = false

ARGV.each do |arg|
    # skip if not integer
    next if arg !~ /^-?\d+(\.\d+)?$/

    # convert to integer
    i_arg = arg.to_i

    # If result is empty or the first integer hasn't been inserted yet, insert directly
    if !first_integer_inserted || result.empty?
        result << i_arg
        first_integer_inserted = true
        next
    end
    
    # insert result at the right position
    is_inserted = false
    i = 0
    l = result.size
    while !is_inserted && i < l do
        if result[i] < i_arg
            i += 1
        else
            result.insert(i, i_arg)
            is_inserted = true
            break
        end
    end
    result << i_arg if !is_inserted
end

puts result
