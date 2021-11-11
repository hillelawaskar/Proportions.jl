# Inside make.jl
push!(LOAD_PATH,"../src/")
using Proportions
using Documenter
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
