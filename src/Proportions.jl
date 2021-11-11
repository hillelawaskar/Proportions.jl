module Proportions

export get_proportion,get_proportion_round,get_proportion_round_sq

"""
    get_proportion(for_prop_arr::Array{Float64, 1})::Array{Float64, 1}
Compute the proportional values for each element in the array.
returns a Array{Float64, 1}
# Example
```
julia> get_proportion([1.0,2.0,3.0,4.0,5.0,34.0000034,2423,5656.98988])
[0.00012301651427098885, 0.0002460330285419777, 0.00036904954281296654, 0.0004920660570839554, 0.0006150825713549442, 0.004182561903469769, 0.298069014078606, 0.6959031763038594]
```
"""
#function for getting Proportions
function get_proportion(for_prop_arr::Array{Float64, 1})::Array{Float64, 1}
    return for_prop_arr ./ sum(for_prop_arr)
end

"""
    get_proportion_round(for_prop_arr::Array{Float64, 1};round_digits::Int64)::Array{Float64, 1}
Compute the proportional values for each element in the array and round to a specified decimal digits.
If the sum of all the elements is not 1 , then the adjustment is done in the 1st largest element
returns a Array{BigFloat, 1}
# Example
```
julia> get_proportion_round([1.33,1.33,1.23,1.1111],round_digits=2)
=[0.26, 0.27, 0.25, 0.22]
```
"""


function get_proportion_round(for_prop_arr::Array{Float64, 1};round_digits::Int64=2)::Array{Float64, 1}
    temparr=  round.(for_prop_arr ./ sum(for_prop_arr), digits=round_digits, base=10)
    diff = 1 - sum(temparr)
    #println(diff)
    if diff != 0.0
        max =  findmax(temparr)[2]
        temparr[max] = round(temparr[max]+diff, digits=round_digits, base=10)
    end
    #print(temparr)
    return temparr
end

"""
    get_proportion_round_sq(for_prop_arr::Array{Float64, 1};round_digits::Int64)::Array{Float64, 1}
Compute the proportional values for each element in the array and round to a specified decimal digits.
If the sum of all the elements is not 1 , then square the array and try looking for proportional correctness
after 2 itterations , the adjustment is done in the 1st largest element
returns a Array{BigFloat, 1}
# Example
```
julia> get_proportion_round([1.33,1.33,1.23,1.1111],round_digits=2)
=[0.26, 0.27, 0.25, 0.22]
```
"""
function get_proportion_round_sq(for_prop_arr::Array{Float64, 1};round_digits::Int64=2)::Array{Float64, 1}
    temparr=  round.(for_prop_arr ./ sum(for_prop_arr), digits=round_digits, base=10)
    diff = 1 - sum(temparr)
    #println(diff)
    if diff != 0.0
        check = 1
        while check<2
            sqarr= (for_prop_arr) .^(2*check)
            temparr=  round.(sqarr ./ sum(sqarr), digits=round_digits, base=10)
            diff = 1 - sum(temparr)
            if diff != 0.00
                check = check + 1
                if check > 2
                    max =  findmax(temparr)[2]
                    temparr[max] = round(temparr[max]+diff,digits=round_digits, base=10)
                end
            else
                break
            end
        end
    end
    #print(temparr)
    #println(check)
    return temparr
end

#module end
end