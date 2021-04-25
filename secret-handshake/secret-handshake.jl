
checkLowerNBits(arr, nbits=5) = all(map((x) -> x === 0, arr[1:nbits]))

function decodeSecret(reverseBinary, codeMap)
    secret = Vector{String}()
    num = parse(Int, join(reverseBinary, ""))
    n = num
    futures = Vector()
    for (key, value) = codeMap
        q, r = divrem(n, key)
        n = r
        # if q > 0 then apply function immediately if value[2] true
        # else store it in futures to be applied sequentially
        (q > 0) ? ((value[1]) ? value[2](secret) : push!(futures, value[2])) : nothing
        # println("Applying $(key): $(q) and $(r). Result = $(secret)")
        if (n == 0)
            break
        end
    end

    for func = futures
        # println("Applying futures: $(func)")
        func(secret)
    end

return secret
end


function createCodeMap()
    codeMap = [
    (10000, (false, (secret) -> Iterators.reverse!(secret))),
    (1000, (true, (secret) -> insert!(secret, 1, "jump"))),
    (100, (true, (secret) -> insert!(secret, 1, "close your eyes"))),
    (10, (true, (secret) -> insert!(secret, 1, "double blink"))),
    (1, (true, (secret) -> insert!(secret, 1, "wink"))),
    ]
    return codeMap
end

"""
Returns an array of encoded strings based on the number provided
Int -> String[]
"""
function secret_handshake(code)
    codeMap = createCodeMap()
    binary = digits(code, base=2, pad=64)
    # println("here1 binary = $(binary)")
    return checkLowerNBits(binary) ? String[] : decodeSecret(Iterators.reverse(binary), codeMap)
end
