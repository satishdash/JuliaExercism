decimalToRomanMap = Dict(
1 => "I",
4 => "IV",
5 => "V",
9 => "IX",
10 => "X",
40 => "XL",
50 => "L",
90 => "XC",
100 => "C",
400 => "CD",
500 => "D",
900 => "CM",
1000 => "M",
)

keysInDescOrder = sort(collect(keys(decimalToRomanMap)), rev=true)

function getRomanNumeral(base, num)
    n, rem = divrem(num, base)
    return (decimalToRomanMap[base] ^ n) , rem
end

function convertToRoman(num)
    if num == 0
        return ""
    end
    for base = keysInDescOrder
        if num >= base
            s, rem = getRomanNumeral(base, num)
            return s * convertToRoman(rem)
        end
    end
end

function to_roman(number)
    if 0 < number <= 3999
        return convertToRoman(number)
    else
        throw(ErrorException("Invalid number: $(number)"))
    end
end
