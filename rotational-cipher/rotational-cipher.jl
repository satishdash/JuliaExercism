
# create a dictionary of 0-26 for each lower and upper alphabets
mapping = Dict{Int, Int}()
for (i, (l,u)) in enumerate(zip('a':'z', 'A':'Z'))
    mapping[Int(l)] = i-1
    mapping[Int(u)] = i-1
end

"Rotates the character if it is an alphabet else returns the same character"
function encrypt(ch::Char, offset::Int64)::Char
    # println("Encrypting $(ch) ...")
    val = Int(ch)
    res = ch
    if (97 <= val <= 122) || (65 <= val <= 90)
        index = (mapping[val] + offset) % 26
        lower = islowercase(ch)
        for pair in mapping
            if pair[2] == index
                final_ch = Char(pair[1])
                res = lower ? lowercase(final_ch) : uppercase(final_ch)
                break
            end
        end
    end
    # println("Encrypted value: $(res) ...")
    return  res
end

"Function to encrypt text alphabets only using caesar cipher
(String,Int) -> String"
rotate(str::String, key::Int64)::String = join([encrypt(ch, key) for ch in str], "")

"Function that rotates a string based on key
(Int, String) -> String"
rotate(key::Int, str::String) = rotate(str, key)

"Function that rotates a character literal based on key
(Int, Char) -> Char"
rotate(key::Int, ch::Char) = collect(rotate(string(ch), key))[1]

# create non string literals with macros
# i from 0 - 26
macro R1_str(str::String)
    rotate(str, 1)
end
macro R4_str(str::String)
    rotate(str, 4)
end
macro R5_str(str::String)
    rotate(str, 5)
end
macro R13_str(str::String)
    rotate(str, 13)
end
macro R21_str(str::String)
    rotate(str, 21)
end
