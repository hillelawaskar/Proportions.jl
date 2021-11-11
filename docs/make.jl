# Inside make.jl
push!(LOAD_PATH,"../src/")
using Proportions
using Documenter
makedocs(
         sitename = "Proportions.jl",
         modules  = [Proportions],
         pages=[
                "Home" => "index.md"
               ])
deploydocs(;
    repo="github.com/hillelawaskar/Proportions",
)
im
