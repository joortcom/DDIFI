# DDIFI
A new design pattern DDIFI: Decoupling Data Interface From data Implementation as a clean and general solution to multiple inheritance

### Abstract:

Traditionally in class based OOP languages, both the fields and methods from the super-classes are
inherited by the sub-classes. However this may cause some serious problems in multiple inheritance,
e.g. most notably the diamond problem. In this paper, we propose to stop inheriting data fields
as a clean and general solution to such problems. We first present a design pattern to cleanly
achieve multiple inheritance in C++, which can handle class fields of the diamond problem exactly
according to the programmers’ intended application semantics. It gives programmers flexibility when
dealing with the diamond problem for instance variables: each instance variable can be configured
either as one joined copy or as multiple independent copies in the implementation class. The key ideas are:
1) decouple data interface from data implementation, by stopping inheriting data fields;
2) in the regular methods implementation
use virtual property methods instead of direct raw fields; and
3) after each semantic branching add (and override) the new semantic assigning property.

Then we show our method is general enough,
and also applicable to any OOP languages that natively support multiple inheritance (e.g. C++,
Python, Eiffel, etc.), or single inheritance languages that support default interface methods (e.g.
Java, C# etc.), or single inheritance languages that support mixin (e.g. D).

### Keywords:

multiple inheritance, diamond problem, program to interfaces,
virtual property, data interface, data implementation, semantic branching site, reusability, modularity
