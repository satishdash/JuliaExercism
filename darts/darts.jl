
function inner(distanceFromOrigin)::Bool
    return distanceFromOrigin <= 1.0
end

function middle(distanceFromOrigin)::Bool
    return distanceFromOrigin <= 5.0
end

function outer(distanceFromOrigin)::Bool
    return distanceFromOrigin <= 10.0
end

function score(x, y)
    dist = sqrt(x^2 + y^2)
    inner(dist) ? 10 : (middle(dist) ? 5 : outer(dist) ? 1 : 0)
end
