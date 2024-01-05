module InfixUnions

for op ∈ (:|, :∪)
    @eval $op(args...; kwargs...) = Base.$op(args...; kwargs...)
end

for op ∈ (:|, :∪, :∨)
    @eval $op(typs::Type...) = Union{typs...}
end

"""
    A | B

If `A` and `B` are types, return the `Union` of those types, otherwise return `Base.:(|)(A, B)`.
"""
(|)

"""
    A ∪ B

If `A` and `B` are types, return the `Union` of those types, otherwise return `Base.:(∪)(A, B)`.
"""
(∪)

"""
    A ∨ B

If `A` and `B` are types, return the `Union` of those types.
"""
(∨)

end # module InfixUnions
