# helpers
function are_valid_sides(sides)
    all(side > 0.0 for side = sides)
end

function is_triangle(sides)
    a = (sides[1] + sides[2] > sides[3]) ?  true : false
    b = (sides[1] + sides[3] > sides[2]) ?  true : false
    c = (sides[2] + sides[3] > sides[1]) ?  true : false
    return a && b && c
end

function is_equilateral(sides)
    f = are_valid_sides(sides) && is_triangle(sides)
    s = sides[1] == sides[2] == sides[3]

    return f && s
end

function is_isosceles(sides)
    f = are_valid_sides(sides) && is_triangle(sides)
    s1 = sides[1] == sides[2]
    s2 = sides[1] == sides[3]
    s3 = sides[2] == sides[3]

    return f && (s1 || s2 || s3)
end

function is_scalene(sides)
    f = are_valid_sides(sides) && is_triangle(sides)
    s = (sides[1] != sides[2]) && (sides[1] != sides[3]) && (sides[2] != sides[3])

    return f && s
end
