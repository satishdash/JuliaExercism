"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    alpha_freq = Dict(e => 0 for e in 'a':'z')

    for ch in lowercase(input)
        if haskey(alpha_freq, ch)
            alpha_freq[ch] += 1
        end
    end

    for kv in alpha_freq
        if kv[2] === 0
            return false
        end
    end
    return true
end


# println(ispangram(""))
# println(ispangram("ADkashdkshA"))
# println(ispangram(join('a':'z')))
