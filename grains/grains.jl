total_dict = Dict()
two = Int128(2)

"""Validator function"""
function validate(num::Number)
    # validations
    if (num < 1) || (num > 64)
        throw(DomainError("Must be positive integer <= 64."))
    end
end

"""Calculate the number of grains on square `square`."""
function on_square(square::Number)
    validate(square)
    index = square - 1
    return two ^ index
end

"""Calculate the total number of grains after square `square`."""
function total_after(square::Number)
    validate(square)
    if (square === 1)
        total_dict[1] = on_square(1)
        return total_dict[1]
    end

    # use memoization
    if haskey(total_dict, square)
        return total_dict[square]
    end

    total = on_square(square) + total_after(square-1)
    total_dict[square] = total
    return total_dict[square]
end
