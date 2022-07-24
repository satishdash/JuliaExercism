function isPrime(num)
    for n = 2:round(sqrt(num))
        if (num != n) && (divrem(num, n)[2] == 0)
            return false
        end
    end
    return true
end

function sieve(limit)
    return [n for n = 2:limit if isPrime(n)]
end
