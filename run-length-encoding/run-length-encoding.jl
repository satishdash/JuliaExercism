function encode(s)
    str = ""
    prev = '-'
    count = 0
    # iterate to construct string
    for (i, ch) = enumerate(s)
        if i == 1
            prev = ch
            count = 1
            continue
        end
        if prev == ch
            count += 1
        else
            # first concatenate the RLE then reset
            str = str * (count > 1 ? "$(count)$(prev)" : "$(prev)")
            prev = ch
            count = 1
        end
    end
    # here prev will be the last character for encoding
    # or it'll be space if there were no characters in the original string
    # encode prev after converting it into a string
    last = (prev === '-') ? "" : string(prev)
    str = str * ((count > 1 ? "$(count)$(last)" : "$(last)"))

    # return the final resultant string
    return str

end



function decode(s)
    str = ""
    num = ""
    for ch = s
        if islowercase(ch) || isuppercase(ch) || isspace(ch)
            # construct the string from the present accumulated number
            # and the current character
            n = (num == "") ? 1 : parse(Int, num)
            str = str * (string(ch) ^ n)
            # reset num again
            num = ""
        elseif isdigit(ch)
            num = num * string(ch)
        else
            throw(DomainError("Invalid character found in encoded string: $(ch). Only alphabets and spaces allowed"))
        end
    end
    return str
end
