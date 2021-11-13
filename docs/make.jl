# Inside make.jl
using Documenter, Proportions
makedocs(
         sitename = "Proportions.jl",
         modules  = [Proportions],
         doctest = true,
         pages=[
                "Home" => "index.md"
               ])
deploydocs(;
    repo="github.com/hillelawaskar/Proportions.jl",
)
