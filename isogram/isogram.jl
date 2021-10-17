function isisogram(s::String)::Bool
    # maintain a visited set
    visited = Set()
    # iterate
    for ch = lowercase(s)
        if islowercase(ch)
            if ch in visited
                return false
            else
                push!(visited, ch)
            end
        end
    end
    return true
end
