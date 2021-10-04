function wordcount(sentence)
    freq = Dict{String, Int}()
    r1 = r"([a-zA-Z0-9]+['][a-zA-Z0-9]+)"
    r2 = r"([a-zA-Z0-9]+)"
    s = lowercase(sentence)
    # 1st regex
    for m = eachmatch(r1, s)
        count = get(freq, m.match, 0) + 1
        freq[m.match] = count
        s = replace(s, m.match => "")
    end
    # 2nd regex
    for m = eachmatch(r2, s)
        count = get(freq, m.match, 0) + 1
        freq[m.match] = count
        s = replace(s, m.match => "")
    end
    return freq
end
