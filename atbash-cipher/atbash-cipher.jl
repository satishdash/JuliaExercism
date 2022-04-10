mapping = Dict{Char, Char}()
upStart = 65
upEnd = 90
lowStart = 97
lowEnd = 122
# start mappig lower case alphabets
for i = 0:25
    mapping[Char(lowStart + i)] = Char(lowEnd - i)
end
# Extend the dictionary to have all reverse mappings too
merge!(mapping, Dict(v => k for (k,v) in mapping))
#@show mapping

function encode(input)
    sanitizedInput = replace(input, r"[ .,;']" => "")
    cipherArray = [get(mapping, lowercase(chr), chr) for chr = sanitizedInput]
    len = length(cipherArray)
    # Get groups of 5 chars in the array
    newCipherArray = [cipherArray[i: min(i+4, len)] for i in range(1, len, step=5)]
    cipher = join([join(ele) for ele in newCipherArray], " ")
    @show cipher
    
    return cipher
end

function decode(input)
    sanitizedInput = replace(input, r"[ .,;']" => "")
    textArray = [get(mapping, lowercase(chr), chr) for chr = sanitizedInput]
    text = join(textArray)
    @show text

    return text
end
