function extractAndTransform(score::Int, chars::Vector{Char})::Dict{Char, Int}
    return Dict(
        lowercase(ch) => score
        for ch = chars
    )
end

function load!(points::Dict{Char, Int}, currentScoringTable::Dict{Char, Int})::Dict{Char, Int}
    merge!(points, currentScoringTable)
end

function transform(input::AbstractDict)
    table = Dict{Char, Int}()
    for (k,list) = input
        currentScoringTable = extractAndTransform(k, list)
        load!(table, currentScoringTable)
    end

    return table
end

