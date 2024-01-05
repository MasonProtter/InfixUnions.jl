# InfixUnions.jl

InfixUnions defines 3 separate infix operators that can be used to define `Union` types, `|`, `∪`, and `∨`. 
Since `|` and `∪` are defined and exported by `Base`, `InfixUnions` also defines a fallback method which forwards non-type
arguments to the functions in `Base`. InfixUnions.jl does *not* 

In order to use `InfixUnions`, simply choose which operator you want with a `using` statement, and go:
``` julia
using InfixUnions: |

struct Foo
    data::(Int|Nothing)
end
```
``` julia
julia> Foo(1)
Foo(1)

julia> Foo(nothing)
Foo(nothing)

julia> true | false # Fallback to the Base method
true
```

____________

``` julia
using InfixUnions: ∪

f(x::(Number ∪ Missing)) = 2x + 1
```
``` julia
julia> f(1)
3

julia> f(missing)
missing
```

_____________

``` julia
using InfixUnions: ∨

g(x::(Number ∨ Missing)) = (x - 1)/2
```
``` julia
julia> g(1)
0.0

julia> g(missing)
missing
```
