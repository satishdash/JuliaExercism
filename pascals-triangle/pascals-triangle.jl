
function computelevel(n, pascals_triangle)::Vector{Int}
    prev = last(pascals_triangle)
    temp = Vector{Int}()
    for i in 1:n
        if i==1 || i == n
            push!(temp, 1)
        else
            push!(temp, (prev[i] + prev[i-1]))
        end
    end
    return temp
end

function compute(n)
    pascals_triangle = Vector{Vector{Int}}()
    if (n >= 1)
        push!(pascals_triangle, [1])
    end
    if (n >= 2)
        push!(pascals_triangle, [1, 1])
    end
    if ( n > 2)
        for level in 3:n
            push!(pascals_triangle, computelevel(level, pascals_triangle))
        end
    end
    println("Final pascals triangle computed: $(pascals_triangle)")
    return pascals_triangle
end

function triangle(n)
    (n < 0) ? throw(DomainError(n)) : compute(n)
end
