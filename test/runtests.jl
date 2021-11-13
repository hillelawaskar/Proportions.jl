using Proportions
using Test

@testset "Proportions.jl" begin
    # Write your tests here.
    @test Proportions.get_proportion([1.0,1.0,1.0,1.0]) == [0.25,0.25,0.25,0.25]
    @test Proportions.get_proportion([1.0,1.0,1.0,2.5]) != [0.25,0.25,0.25,0.25]
    @test Proportions.get_proportion_round([1.33,1.33,1.23,1.1111],round_digits=2) ==[0.26, 0.27, 0.25, 0.22]
    @test Proportions.get_proportion_round([33,33,33.23,33.1111],round_digits=6) ==[0.249356, 0.249356, 0.251093, 0.250195]
    @test Proportions.get_proportion_round_add1251([33.009, 33.31223, 33.2113, 33.111122],round_digits=6) ==[0.24997, 0.250029, 0.25001, 0.24999]
    @test Proportions.get_proportion_2d([1.0 2.0 ; 4.0 5.0]) == [0.08333333333333333 0.16666666666666666; 0.3333333333333333 0.4166666666666667]
    @test Proportions.get_proportion_round_2d([1.1101 2.243 ; 4.9898 5.87],round_digits=5) == [0.07811 0.15781; 0.35108 0.413]
    @test Proportions.get_proportion_round_add1251_2d([1.1101 2.243 ; 4.9898 5.87 ; 34.333 6.78],round_digits=8) == [0.16559399 0.16574381; 0.16610708 0.16622349; 0.16998779 0.16634384]
end
