module Tprint

import Term: unescape_brackets, escape_brackets, has_markup
import Term: highlight as highlighter
import ..renderables: AbstractRenderable
import ..style: apply_style
import ..layout: hstack

export tprint, tprintln
"""
tprint

Similar to standard lib's `print` function but with added
styling functionality
"""
function tprint end

tprint(x; highlight = true) = tprint(stdout, x; highlight = highlight)

tprint(io::IO, x; highlight = true) = tprint(io, string(x); highlight = highlight)

function tprint(io::IO, ::MIME"text/html", x; highlight = true)
    return tprint(io, x; highlight = highlight)
end

"""
tprint(x::AbstractString)

Apply style to a string and print it
"""
function tprint(io::IO, x::AbstractString; highlight = true)
    return if highlight
        print(io, (apply_style ∘ highlighter)(x))
    else
        print(io, (apply_style)(x))
    end
end

"""
tprint(x::AbstractRenderable)

Print an `AbstractRenderable`.

Equivalent to `println(x)`
"""
function tprint(io::IO, x::AbstractRenderable; highlight = true)
    return print(io, x; highlight = highlight)
end

function tprint(io::IO, args...)
    for (n, arg) in enumerate(args)
        tprint(io, arg)

        if n < length(args)
            args[n + 1] isa AbstractRenderable || print(io, " ")
        end
    end
    return nothing
end

function tprint(args...; highlight = true)
    for (n, arg) in enumerate(args)
        tprint(arg; highlight = highlight)

        if n < length(args)
            args[n + 1] isa AbstractRenderable || print(" ")
        end
    end
    return nothing
end

"""
    tprintln

Similar to standard lib's `println` function but with added
styling functionality.
"""
# tprintln(x; highlight=true) = tprintln(stdout, x; highlight=true)
# tprintln(io::IO, x; highlight=true) = tprint(io, x, "\n"; highlight=highlight)
# tprintln(io::IO, args...; highlight=true) = tprint(io, args..., "\n"; highlight=highlight)
tprintln(args...; highlight = true) = tprint(args..., "\n"; highlight = highlight)

end
