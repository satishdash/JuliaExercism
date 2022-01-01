function binarysearch(array, element; rev=false)
    start = 1
    last = lastindex(array)

    if last === 0
        return 1:0
    elseif  start === last
        return (array[start] == element) ? (start:last) : 1:0
    end

    while start <= last
        mid = start + Int(floor((last-start)/2))
        current = array[mid]
        @show start,last, mid, current
        if current === element
            return mid:mid
        elseif current > element
            if rev
                start = mid + 1
            else
                last = mid - 1
            end
        elseif current < element
            if rev
                last = mid - 1
            else
                start = mid + 1
            end
        end
    end

    return start:last
end
