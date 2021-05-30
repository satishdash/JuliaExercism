
# define all the regex patterns here
regexes = [
    r"^1[2-9]\d{2}[2-9]\d{2}\d{4}$",
    r"^\+1( +|\-)\([2-9]\d{2}\)(\-| +)[2-9]\d{2}(\-| +)\d{4}$",
    r"^[2-9]\d{2}(\-| +)[2-9]\d{2}(\-| +)\d{4}$",
    r"^1( +|\-)[2-9]\d{2}( +|-)[2-9]\d{2}(\-| +)\d{4}$",
    r"^[2-9]\d{2}\.[2-9]\d{2}\.\d{4}$",
    r"^\([2-9]\d{2}\)( +|\-)[2-9]\d{2}(\-| +)\d{4}$",
]

"""
Returns a cleansed phone number
String -> String
"""
function clean(phone_number::String)::Union{String, Nothing}
    sanitized_phone_number = string(strip(phone_number))
    valid = isvalid(phone=sanitized_phone_number)
    println("valid: $valid")
    return (valid !== nothing) ? getActualNumber(phone=sanitized_phone_number) : nothing
end

function isvalid(; phone::String)::Union{RegexMatch, Nothing}
    reply = nothing
    for regex = regexes
        reply  = match(regex, phone)
        println("regex: $regex, reply: $reply")
        if reply !== nothing
            return reply
        end
    end

    return reply
end

function getActualNumber(; phone::String)::String
    cleansed_number = reverse(filter(isdigit, reverse(phone))[1:10])
    println("Cleansed number: $cleansed_number")

    return cleansed_number
end
