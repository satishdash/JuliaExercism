allergic_list_with_scores = Dict{Int, String}(
    32  => "chocolate",
    4   => "shellfish",
    16  => "tomatoes",
    2   => "peanuts",
    8   => "strawberries",
    64 => "pollen",
    1   => "eggs",
    128 => "cats",
)

function deduceAllergies(score::Int)::Set{String}
    # return eggs if score is > 128
    if score <= 0
        return Set([])
    elseif score == 1
        return Set(["eggs"])
    end

    a = Int(floor(log(2, score)))
    s = Set{String}([])
    if score >= (2^8)
        # check if its a proper base of 2, if yes ignore
        score -= 2^a
        if score === 0
            return Set([])
        elseif score === 1
            return Set(["eggs"])
        end
        # proceed with by subtracting "ignoreable" part from "a"
        a = Int(floor(log(2, score)))
    end

    # get floor of log base 2 score

    while (a > 0)
        # global a , s
        sc = 2^a
        allergy = get(allergic_list_with_scores, sc, nothing)
        if allergy !== nothing
            push!(s, allergy)
        end
        @show a, s, allergy, score
        score -= sc
        if score == 1
            push!(s, "eggs")
        elseif score < 1
            break
        end
        a = Int(floor(log(2, score)))
    end
    return s
end

function allergic_to(score, allergen)
    allergies = deduceAllergies(score)
    @show allergies
    return (allergen in allergies)
end

function allergy_list(score)
    return deduceAllergies(score)
end
