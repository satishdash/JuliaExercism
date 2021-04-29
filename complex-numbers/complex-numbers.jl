
mutable struct ComplexNumber{T <: Real} <: Number
    real::T
    img::T
end

ComplexNumber(a::Real, b::Real) = ComplexNumber(promote(a, b)...)
ComplexNumber(a::Real) = ComplexNumber(a, zero(a))


function Base.:(==)(first::ComplexNumber, second::ComplexNumber)::Bool
    return first.real == second.real && first.img == second.img
end

function Base.:(isapprox)(first::ComplexNumber, second::ComplexNumber)::Bool
    return isapprox(first.real, second.real) && isapprox(first.img, second.img)
end

function Base.:(^)(complexNumber::ComplexNumber, exp::Integer)::ComplexNumber
    if exp == 2
        r = (complexNumber.real^2 - complexNumber.img^2)
        img = 2 * complexNumber.real * complexNumber.img
        return ComplexNumber(r, img)
    end
    throw(DomainError("Exponent to the power $(exp) not yet implemented."))
end

function Base.:(+)(first::ComplexNumber, second::ComplexNumber)::ComplexNumber
    return ComplexNumber(first.real + second.real, first.img + second.img)
end

function Base.:(-)(first::ComplexNumber, second::ComplexNumber)::ComplexNumber
    return ComplexNumber(first.real - second.real, first.img - second.img)
end

function Base.:(*)(first::ComplexNumber, second::ComplexNumber)::ComplexNumber
    return ComplexNumber((first.real * second.real) - (first.img * second.img), (first.real * second.img + first.img * second.real))
end

function Base.:(/)(first::ComplexNumber, second::ComplexNumber)::ComplexNumber
    return ComplexNumber((first.real * second.real + first.img * second.img)/(second.real ^ 2 + second.img ^ 2),
     (first.img * second.real - first.real * second.img) / (second.real ^ 2 + second.img ^ 2))
end

function Base.:(abs)(complexNumber::ComplexNumber)::Number
    return sqrt(complexNumber.real ^ 2 + complexNumber.img ^ 2)
end

function Base.:(conj)(complexNumber::ComplexNumber)::ComplexNumber
    return ComplexNumber(complexNumber.real, -complexNumber.img)
end

function Base.:(real)(complexNumber::ComplexNumber)::Number
    return complexNumber.real
end

function Base.:(imag)(complexNumber::ComplexNumber)::Number
    return complexNumber.img
end

function Base.:(exp)(complexNumber::ComplexNumber)::ComplexNumber
    return ComplexNumber(exp(complexNumber.real) * cos(complexNumber.img), exp(complexNumber.real) * sin(complexNumber.img))
end

# Define jm
const jm = ComplexNumber(0, 1)
function Base.:(+)(num::Number, cmpNum::ComplexNumber)::ComplexNumber
    return ComplexNumber(num + cmpNum.real, cmpNum.img)
end

function Base.:(-)(num::Number, cmpNum::ComplexNumber)::ComplexNumber
    return ComplexNumber(num - cmpNum.real, -cmpNum.img)
end

function Base.:(*)(num::Number, cmpNum::ComplexNumber)::ComplexNumber
    return ComplexNumber(num * cmpNum.real, num * cmpNum.img)
end
