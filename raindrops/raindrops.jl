factor_sound_map = Array{Tuple{Int,String}}(
    [
        (3, "Pling"),
        (5, "Plang"),
        (7, "Plong"),
    ]
)

"""
Returns a string based on factors decided for rain drop sounds
Int64 -> String
"""
function raindrops(number::Int128)::String
    sounds = []
    for factor in factor_sound_map
        (number % factor[1] == 0) ? append!(sounds, factor[2]) : nothing
    end
    return (length(sounds) > 0) ? join(sounds, "") : string(number)
end

raindrops(number::Int64) = raindrops(Int128(number))
raindrops(number::Int32) = raindrops(Int128(number))
