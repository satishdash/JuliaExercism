"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""

function count_nucleotides(strand::String)
    frequency = Dict{Char, Int64}('A'=>0, 'G'=>0, 'C' => 0, 'T'=> 0)
    for nucleotide in strand
        if haskey(frequency, nucleotide)
            frequency[nucleotide] += 1
        else
            throw(DomainError(nucleotide, "Invalid nucleotide!"))
        end
    end
    return frequency
end

# println(count_nucleotides("AGCT"))
