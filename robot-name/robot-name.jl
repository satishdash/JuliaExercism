
using Random

# the logic for name generation is still not random it is sequential (need to change with random logic !)

# helper model
mutable struct NameModel
    firstLetter::Char
    secondLetter::Char
    suffix::Int

    function NameModel()
        return new('A', 'A', 0)
    end
end
# singleton instance
nameModel = NameModel()

mutable struct Robot
    name::String

    function Robot()
        str = getRandomName()
        new(str)
    end
end

function reset!(instance::Robot)::Robot
    newName = getRandomName()
    instance.name = newName
    return instance
end

function name(instance::Robot)::String
    return instance.name
end


# helpers
function getRandomName()::String
    global nameModel
    # check for increement
    if nameModel.suffix === 999
        # increement second letter but after a check
        if nameModel.secondLetter === 'Z'
            # increement name first letter but after a check
            if nameModel.firstLetter === 'Z'
                throw(DomainError("Initial letter for Robot names has been exhausted. Current initial: $(nameModel.firstLetter)"))
            else
                nameModel.firstLetter += 1
                nameModel.secondLetter = 'A'
                nameModel.suffix = 0
            end
        else
            nameModel.secondLetter += 1
            nameModel.suffix = 0
        end
    else
        nameModel.suffix += 1
    end

    return string(nameModel.firstLetter, nameModel.secondLetter, lpad(nameModel.suffix, 3, "0"))
end
