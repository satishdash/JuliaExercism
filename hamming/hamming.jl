"Hamming distance between 2 strings"
function distance(a::String, b::String)
    if length(a) !== length(b)
        throw(ArgumentError("Strands are of unequal length"))
    end
    func(pair::Tuple{Char, Char}) = (pair[1] === pair[2]) ? 0 : 1
    map(func, zip(a, b)) |> sum
end

# println(distance("AGCT", "AGCT"))
# println(distance("AGCX", "AGCT"))
# println(distance("XXXX", "AGCT"))
