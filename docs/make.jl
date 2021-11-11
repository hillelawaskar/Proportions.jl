# Inside make.jl
push!(LOAD_PATH,"../src/")
using Proportion
using Documenter
makedocs(
         sitename = "proportion.jl",
         modules  = [Proportion],
         pages=[
                "Home" => "index.md"
               ])
deploydocs(;
    repo="github.com/hillelawaskar/Proportion",
)
im
