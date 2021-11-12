using Proportions
using Test

@testset "Proportions.jl" begin
    # Write your tests here.
    @test Proportions.get_proportion([1.0,1.0,1.0,1.0]) == [0.25,0.25,0.25,0.25]
    @test Proportions.get_proportion([1.0,1.0,1.0,2.5]) != [0.25,0.25,0.25,0.25]
    @test Proportions.get_proportion_round([1.33,1.33,1.23,1.1111],round_digits=2) ==[0.26, 0.27, 0.25, 0.22]
    @test Proportions.get_proportion_round([33,33,33.23,33.1111],round_digits=6) ==[0.249356, 0.249356, 0.251093, 0.250195]
    @test Proportions.get_proportion_round_add1251([33.009, 33.31223, 33.2113, 33.111122],round_digits=6) ==[0.24997, 0.250029, 0.25001, 0.24999]

end
