import Dates

function computeHour(hour::Int)::Int
    _, hr = divrem(hour, 24)
    hr = (hr >= 0) ? (hr+0) : (24+hr)
    # println("Hour computed: $(hr)")

    return hr
end

function computeMinutes(minutes::Int)::Tuple{Int, Int}
    hrs, mins = divrem(minutes, 60)
    # println("Minutes Interim: $(hrs), $(mins)")
    (hrs, mins) = (mins >= 0) ? (hrs, 0+mins) : (hrs-1, 60+mins)
    # println("Hours and minutes: $(hrs), $(mins)")

    return (hrs, mins)
end

mutable struct Clock
    hour::Int
    minutes::Int

    function Clock(hour::Int, minutes::Int)
        # compute hours
        hr = computeHour(hour)
        # compute minutes
        h, mins = computeMinutes(minutes)
        # again compute hour as minutes might have given some -/+ ve hours
        hr = computeHour(hr + h)

        new(hr, mins)
    end
end

function Base.:(+)(clock::Clock, minutes::Dates.Minute)
    m = clock.minutes + minutes.value
    return Clock(clock.hour, m)
end

function Base.:(-)(clock::Clock, minutes::Dates.Minute)
    m = clock.minutes - minutes.value
    return Clock(clock.hour, m)
end

# overload equals-to operator
function Base.:(==)(first::Clock, second::Clock)
    return (first.hour === second.hour) && (first.minutes === second.minutes)
end

function Base.:(string)(clock::Clock)
    lpad(clock.hour, 2, "0") * ":" * lpad(clock.minutes, 2, "0")
 end

 function Base.:(show)(io::IO, clock::Clock)
    write(io, string(clock))
 end
