function print_and_return(x)
    println("Sorted array: $(x)")
    return x
end

" Detect anagrams"
function detect_anagrams(subject, candidates)
    # get case-insensitive subject
    sorted_subject = subject |> lowercase |> collect |> sort |> print_and_return
    final = String[]

    # check for case insenitive candidates
    check(sorted_list) = (sorted_subject == sorted_list)
    f(str) = str |> lowercase |> collect |> sort |> print_and_return |> check

    # O(n) where n is number of candidates
    for str in candidates
        if f(str)
            push!(final, str)
        end
    end
    # remove exact matched words
    remove_exact_matches(x) = lowercase(x) !== lowercase(subject)
    return filter(remove_exact_matches, final)
end
