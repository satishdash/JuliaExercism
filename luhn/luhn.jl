

"""
Function returns true if it is a valid luhn string else false
String -> Boolean
"""
function luhn(str::String)::Bool
    # replace all spaces
    sanitized = replace(strip(str), " " => "")
    if length(sanitized) < 2
        return false
    end
    # compute from reverse direction for each character
    total = 0
    for (i, ch)  = enumerate(Iterators.reverse(sanitized))
        parsed_digit = (Int(ch) - Int('0'))
        digit = (i % 2 == 0) ? parsed_digit * 2 : parsed_digit
        q, r = divrem(digit, 10)
        total += (q + r)
    end
    return (total % 10) == 0
end
