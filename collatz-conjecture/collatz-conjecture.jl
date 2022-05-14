cache = Dict()

function count_steps(n, cache, level=0)
    if n == 1
        # Just ignore the start key with which the number started out
        # total keys - 1
        return level
    end

    if haskey(cache, n)
        return count_steps(cache[n], cache, level+1)
    end

    if (n % 2 == 0)
        quo = divrem(n, 2)[1]
        cache[n] = quo
        return count_steps(quo, cache, level+1)
    else
        quo = (3*n + 1)
        cache[n] = quo
        return count_steps(quo, cache, level+1)
    end
end

function collatz_steps(n)
    if (n <= 0)
        throw(DomainError("Number needs to > 0"))
    else
        res = count_steps(n, cache)
        # @show cache
        return res
    end
end

