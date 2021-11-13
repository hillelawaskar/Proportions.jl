# Proportions

[![Build Status](https://travis-ci.com/hillelawaskar/Proportions.jl.svg?branch=main)](https://travis-ci.com/hillelawaskar/Proportions.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/hillelawaskar/Proportions.jl?svg=true)](https://ci.appveyor.com/project/hillelawaskar/Proportions-jl)
[![Coverage](https://codecov.io/gh/hillelawaskar/Proportions.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/hillelawaskar/Proportions.jl)
[![Coverage](https://coveralls.io/repos/github/hillelawaskar/Proportions.jl/badge.svg?branch=main)](https://coveralls.io/github/hillelawaskar/Proportions.jl?branch=main)



Proportions
The best Proportions package.

Package Features
Provides functions to provide proportionality for vector/matrix data
It can be used in various applications to split any values in a particular proportion
Examples:
1 Split a Number in proportions of a factor in vector/matrix
2 Split an payment schedule in various proportions
3 Split an payment based on the deliver of goods received
Documentation
Proportions.get_proportion
—
Method
get_proportion(for_prop_arr::AbstractVector{Float64})::AbstractVector{Float64}
Compute the proportional values for each element in the 1D array. returns a AbstractVector{Float64}

Example

julia> get_proportion([1.0,2.0,3.0,4.0,5.0,34.0000034,2423,5656.98988])
[0.00012301651427098885, 0.0002460330285419777, 0.00036904954281296654, 0.0004920660570839554, 0.0006150825713549442, 0.004182561903469769, 0.298069014078606, 0.6959031763038594]
Proportions.get_proportion_2d
—
Method
get_proportion_2d(for_prop_arr::AbstractArray{Float64, 2})::AbstractArray{Float64, 2}
Compute the proportional values for each element in the 2d array. returns a AbstractArray{Float64, 2}

Example

julia> get_proportion_2d([1.0 2.0 ; 4.0 5.0])
=[0.08333333333333333 0.16666666666666666; 0.3333333333333333 0.4166666666666667]
Proportions.get_proportion_round
—
Method
get_proportion_round(for_prop_arr::AbstractVector{Float64};round_digits::Int64)::AbstractVector{Float64}
Compute the proportional values for each element in the array and round to a specified decimal digits. If the sum of all the elements is not 1 , then the adjustment is done in the 1st largest element returns a AbstractVector{Float64}

Example

julia> get_proportion_round([1.33,1.33,1.23,1.1111],round_digits = 2)
=[0.26, 0.27, 0.25, 0.22]
Proportions.get_proportion_round_2d
—
Method
get_proportion_round_2d(for_prop_arr::AbstractArray{Float64, 2};round_digits::Int64)::AbstractArray{Float64, 2}
Compute the proportional values for each element in the 2d array and round to a specified decimal digits. If the sum of all the elements is not 1 , then the adjustment is done in the 1st largest element returns a AbstractArray{Float64, 1}

Example

julia> get_proportion_round_2d([1.1101 2.243 ; 4.9898 5.87],round_digits=5)
=[0.07811 0.15781; 0.35108 0.413]
Proportions.get_proportion_round_add1251
—
Method
get_proportion_round_add1251(for_prop_arr::AbstractVector{Float64};round_digits::Int64)::AbstractVector{Float64}
Compute the proportional values for each element in the array and round to a specified decimal digits. If the sum of all the elements is not 1 , then add 1251 to the array and try looking for proportional correctness after 2 itterations , the adjustment is done in the 1st largest element returns a AbstractVector{Float64}

Example

julia> get_proportion_round_add1251([1.33,1.33,1.23,1.1111],round_digits = 2)
=[0.26, 0.27, 0.25, 0.22]
Proportions.get_proportion_round_add1251_2d
—
Method
get_proportion_round_add1251(for_prop_arr::AbstractArray{Float64, 2};round_digits::Int64)::AbstractArray{Float64, 2}
Compute the proportional values for each element in the 2d array and round to a specified decimal digits. If the sum of all the elements is not 1 , then add 1251 to the array and try looking for proportional correctness after 2 itterations , the adjustment is done in the 1st largest element returns a AbstractArray{Float64, 2}

Example

julia> get_proportion_round_add1251_2d([1.1101 2.243 ; 4.9898 5.87 ; 34.333 6.78],round_digits=8)
=[0.16559399 0.16574381; 0.16610708 0.16622349; 0.16998779 0.16634384]
