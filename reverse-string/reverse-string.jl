import Unicode as u

const TEST_GRAPHEMES = true

function myreverse(str::String)::String
    # for string operations use `Unicode.graphemes` , deals with all kinds of strings 
    vectorChars = collect(u.graphemes(str))
    return join(vectorChars[index] for index in lastindex(vectorChars):-1:1)
end