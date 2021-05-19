
using Base

# constants
const NORTH = "NORTH"
const SOUTH = "SOUTH"
const EAST = "EAST"
const WEST = "WEST"
const RIGHT = 'R'
const LEFT = 'L'
const ADVANCE = 'A'

# struct
mutable struct Point{Number}
    x::Real
    y::Real

    function Point{Real}(xcoord::Real, ycoord::Real)
        new{Real}(xcoord, ycoord)
    end

    function Point(xcoord::Real, ycoord::Real)
        new{Real}(xcoord, ycoord)
    end

    function Point(xcoord::Int, ycoord::Int)
        new{Int}(xcoord, ycoord)
    end

    function Point{Int}(xcoord::Int, ycoord::Int)
        new{Int}(xcoord, ycoord)
    end
end

mutable struct Robot
    coordinates::Point
    direction::String

    function Robot(pos::Tuple{Real, Real}, direction::String)
        new(Point(pos[1], pos[2]), direction)
    end
end

# Get direction based on turn input
function nextDirection(currentDirection::String, turn::Char)::String
    if !(in(turn, (RIGHT, LEFT)))
        throw(DomainError("Only L and R allowed for turns. Received: $(turn)"))
    end
    if !(in(currentDirection, (NORTH, SOUTH, EAST, WEST)))
        throw(DomainError("Only north, south, east, west are allowed for directions. Received: $(currentDirection)"))
    end
    if turn === RIGHT
        if currentDirection === NORTH
            return EAST
        elseif currentDirection === SOUTH
            return WEST
        elseif currentDirection === EAST
            return SOUTH
        elseif currentDirection === WEST
            return NORTH
        end
    else
        if currentDirection === NORTH
            return WEST
        elseif currentDirection === SOUTH
            return EAST
        elseif currentDirection === EAST
            return NORTH
        elseif currentDirection === WEST
            return SOUTH
        end
    end
end

function advance!(robot::Robot)
    if robot.direction === NORTH
        robot.coordinates.y += 1
        return robot

    elseif robot.direction === SOUTH
        robot.coordinates.y -= 1

    elseif robot.direction === EAST
        robot.coordinates.x += 1

    elseif robot.direction === WEST
        robot.coordinates.x -= 1
    end

    return robot
end

function turn_right!(robot::Robot)
    robot.direction = nextDirection(robot.direction, RIGHT)
    return robot
end

function turn_left!(robot::Robot)
    robot.direction = nextDirection(robot.direction, LEFT)
    return robot
end

function move!(robot::Robot, instructions::String)
    for instruction = instructions
        (instruction === RIGHT) ? turn_right!(robot) : nothing
        (instruction === LEFT) ? turn_left!(robot) : nothing
        (instruction === ADVANCE) ? advance!(robot) : nothing
    end
    return robot
end

function position(robot::Robot)
    return robot.coordinates
end

function heading(robot::Robot)
    return robot.direction
end

# helpers
function Base.:(==)(first::Point, second::Point)
    return first.x == second.x && first.y == second.y
end

function Base.:(==)(first::Robot, second::Robot)
    return first.coordinates == second.coordinates && first.direction == second.direction
end
