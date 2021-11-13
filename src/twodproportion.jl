"""
    get_proportion_2d(for_prop_arr::AbstractArray{Float64, 2})::AbstractArray{Float64, 2}
Compute the proportional values for each element in the 2d array.
returns a AbstractArray{Float64, 2}
# Example
```
julia> get_proportion_2d([1.0 2.0 ; 4.0 5.0])
=[0.08333333333333333 0.16666666666666666; 0.3333333333333333 0.4166666666666667]
```
"""
function get_proportion_2d(for_prop_arr::AbstractArray{Float64,2})::AbstractArray{Float64,2}
    return for_prop_arr ./ sum(for_prop_arr)
end

"""
    get_proportion_round_2d(for_prop_arr::AbstractArray{Float64, 2};round_digits::Int64)::AbstractArray{Float64, 2}
Compute the proportional values for each element in the 2d array and round to a specified decimal digits.
If the sum of all the elements is not 1 , then the adjustment is done in the 1st largest element
returns a AbstractArray{Float64, 1}
# Example
```
julia> get_proportion_round_2d([1.1101 2.243 ; 4.9898 5.87],round_digits=5)
=[0.07811 0.15781; 0.35108 0.413]
```
"""
function get_proportion_round_2d(for_prop_arr::AbstractArray{Float64,2};round_digits::Int64 = 2)::AbstractArray{Float64,2}
    temparr=  round.(for_prop_arr ./ sum(for_prop_arr), digits=round_digits, base = 10)
    diff = 1 - sum(temparr) #delta naming
    if diff != 0.0
        max = argmax(temparr)
        temparr[max] =  round(temparr[max] + diff, digits=round_digits, base = 10)
    end
    return temparr
end

"""
    get_proportion_round_add1251(for_prop_arr::AbstractArray{Float64, 2};round_digits::Int64)::AbstractArray{Float64, 2}
Compute the proportional values for each element in the 2d array and round to a specified decimal digits.
If the sum of all the elements is not 1 , then add 1251 to the array and try looking for proportional correctness
after 2 itterations , the adjustment is done in the 1st largest element
returns a AbstractArray{Float64, 2}
# Example
```
julia> get_proportion_round_add1251_2d([1.1101 2.243 ; 4.9898 5.87 ; 34.333 6.78],round_digits=8)
=[0.16559399 0.16574381; 0.16610708 0.16622349; 0.16998779 0.16634384]
```
"""
function get_proportion_round_add1251_2d(for_prop_arr::AbstractArray{Float64,2};round_digits::Int64 = 2)::AbstractArray{Float64,2}
    temparr=  round.(for_prop_arr ./ sum(for_prop_arr), digits=round_digits, base = 10)
    diff = 1 - sum(temparr)
    if diff != 0.0
        check = 1
        while check < 2
            sqarr= (for_prop_arr) .+1251
            temparr=  round.(sqarr ./ sum(sqarr), digits=round_digits, base = 10)
            diff = 1 - sum(temparr)
            if diff != 0.00
                check = check + 1
                if check == 2
                    max = argmax(temparr)
                    temparr[max] = round(temparr[max]+diff,digits=round_digits, base = 10)
                end
            else
                break
            end
        end
    end
    return temparr
end
