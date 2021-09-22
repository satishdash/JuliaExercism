dna_to_rna = Dict{String, String}(
     "A" => "U" , "T" => "A", "C" => "G", "G" => "C"
)

function to_rna(dna)
    arr = Vector{String}()
    for ch = dna
        str = string(ch)
        complement = get(dna_to_rna, str, nothing)
        if complement === nothing
            throw(ErrorException("Invalid strand key in dna $(ch)"))
        end
        push!(arr, complement)
    end
    res = join(arr, "")
    return res
end
