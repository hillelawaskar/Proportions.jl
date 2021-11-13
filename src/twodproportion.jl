"""
    get_proportion_2d(for_prop_arr::AbstractArray{Float64, 2})::AbstractArray{Float64, 2}
Compute the proportional values for each element in the 2d array.
returns a AbstractArray{Float64, 2}
# Example
```
julia> get_proportion_2d([1.0 2.0 ; 4.0 5.0])
[0.08333333333333333 0.16666666666666666; 0.3333333333333333 0.4166666666666667]
```
"""
function get_proportion_2d(for_prop_arr::AbstractArray{Float64,2})::AbstractArray{Float64,2}
    return for_prop_arr ./ sum(for_prop_arr)
end

"""
    get_proportion_round_2d(for_prop_arr::AbstractArray{Float64, 2};round_digits::Int64)::AbstractArray{Float64, 2}
Compute the proportional values for each element in the array and round to a specified decimal digits.
If the sum of all the elements is not 1 , then the adjustment is done in the 1st largest element
returns a AbstractArray{Float64, 1}
# Example
```
julia> get_proportion_round_2d([1.33,1.33,1.23,1.1111],round_digits = 2)
=[0.26, 0.27, 0.25, 0.22]
```
"""
function get_proportion_round_2d(for_prop_arr::AbstractArray{Float64,2};round_digits::Int64 = 2)::AbstractArray{Float64,2}
    temparr=  round.(for_prop_arr ./ sum(for_prop_arr), digits=round_digits, base = 10)
    diff = 1 - sum(temparr) #delta naming
    if diff != 0.0
        println(diff)
        max = argmax(temparr)
        print(max)
        temparr[max] =  round(temparr[max] + diff, digits=round_digits, base = 10)
    end
    return temparr
end

"""
    get_proportion_round_add1251(for_prop_arr::Array{Float64, 1};round_digits::Int64)::Array{Float64, 1}
Compute the proportional values for each element in the array and round to a specified decimal digits.
If the sum of all the elements is not 1 , then add 1251 to the array and try looking for proportional correctness
after 2 itterations , the adjustment is done in the 1st largest element
returns a Array{BigFloat, 1}
# Example
```
julia> get_proportion_round_add1251([1.33,1.33,1.23,1.1111],round_digits = 2)
=[0.26, 0.27, 0.25, 0.22]
```
"""
function get_proportion_round_add1251_2d(for_prop_arr::AbstractArray{Float64,2};round_digits::Int64 = 2)::AbstractArray{Float64,2}
    temparr=  round.(for_prop_arr ./ sum(for_prop_arr), digits=round_digits, base = 10)
    diff = 1 - sum(temparr)
    println(diff)
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
