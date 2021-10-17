function getValues(i::Int, j::Int, board, mine='*')::String
    if board[i][j] === mine
        return string(board[i][j])
    end
    rows= length(board)
    cols = length(board[1])
    # get all valid positions thru comprehension
    positions = filter(pair -> 1<=pair[1]<=rows && 1<=pair[2]<=cols, [(i, j+1), (i, j-1), (i+1, j), (i-1,j),
            (i+1,j+1), (i-1,j-1), (i-1,j+1), (i+1, j-1)])
    # get the final value
    final = sum(map(pair -> board[pair[1]][pair[2]] === mine ? 1 : 0, positions))
    # if > 0 then value else return space
    return final > 0 ? string(final) : string(board[i][j])
end

function annotate(board)
    newBoard = []
    for (i, str) = enumerate(board)
        push!(newBoard, join(getValues(i, j, board) for (j, ch) = enumerate(str)))
    end
    return newBoard
end