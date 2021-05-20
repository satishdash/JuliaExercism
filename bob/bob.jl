# constants
const QUESTION_MARK = '?'

function answerQuestion()
    return "Sure."
end

function answerQuestion(yell::Bool)
    return "Calm down, I know what I'm doing!"
end

function answerYelling()
    return "Whoa, chill out!"
end

function answerSilence()
    return "Fine. Be that way!"
end

function classifyStatement(statement::String)
    sanitizedStatement = strip(statement)

    # check silence
    if length(sanitizedStatement) == 0
        return answerSilence()
    end

    # check question
    if (sanitizedStatement[end] === QUESTION_MARK)
        if any(isletter(chr) for chr = sanitizedStatement) && sanitizedStatement == uppercase(sanitizedStatement)
            return answerQuestion(true)
        end
        return answerQuestion()
    end

    # check yelling
    if any(isletter(chr) for chr = sanitizedStatement) && sanitizedStatement == uppercase(sanitizedStatement)
        return answerYelling()
    end

    return "Whatever."
end

function bob(stimulus)
    classifyStatement(stimulus)
end
