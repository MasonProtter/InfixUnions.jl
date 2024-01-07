using Test
using InfixUnions: |, ∪, (∨)

@testset "Forwarding" begin
    for x ∈ (1, 2, true, false, UInt8(3))
        for y ∈ (1, 2, true, false, UInt8(3))
    
            @test x | y == Base.:(|)(x, y)
            @test x ∪ y == Base.:(∪)(x, y)
            @test_throws MethodError x ∨ y
        end
    end
end



@testset "Type Unions" begin
    for op ∈ (|, ∪, ∨)
        for T ∈ (Int, Matrix, Complex{Rational{Int}}, Any, Union{})
            for U ∈ (Int, Complex{Rational{Int}}, Matrix{<:Number}, Any, Union{}, Type{Int}, Type, Type{Dict}, Type{Int})
                @test op(T, U) == Union{T, U}
                @test op(T) == T
                for V ∈ (Any, Union{}, Int, Rational)
                    @test op(T, U, V) == op(op(T, U), V) == Union{T, U, V}
                end
                
            end
        end
    end
end

struct MyType{T<:Number,AY<:(AbstractVector{T}|Nothing)}
    y::AY
    avg_y::(T|Nothing)
end

@testset "Typevars" begin
    @test MyType{Int, Nothing}(nothing, nothing) isa MyType
    @test MyType{Int, Vector{Int}}([1,2,3], 1) isa MyType
end
