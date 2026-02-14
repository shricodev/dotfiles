function skip --argument n --description "Skip the first N lines of input"
    if test -z "$n"
        echo "Usage: skip <number_of_lines>"
        return 1
    end
    tail +(math 1 + $n)
end
