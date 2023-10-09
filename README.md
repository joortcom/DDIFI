# DDIFI: a new design pattern that solved the diamond problem of multiple inheritance
**The diamond problem solved**! Using virtual property to
decouple the **data** dependency of the subclass on the
superclass, as a **clean** and **general** solution to multiple
inheritance

### Abstract:

Traditionally in class based OOP languages, both the fields and methods from the super-classes are
inherited by the sub-classes. However this may cause some serious problems in multiple inheritance,
e.g. most notably the diamond problem. In this paper, we propose to stop inheriting data fields
as a clean and general solution to such problems.

We first present a design pattern to **cleanly**
achieve multiple inheritance in C++, which can handle class fields of the diamond problem exactly
according to the programmers’ intended application semantics. It gives programmers flexibility when
dealing with the diamond problem for instance variables: each instance variable can be configured
either as one joined copy or as multiple independent copies in the implementation class. The key ideas are:
1) decouple data interface from data implementation, by stopping inheriting data fields;
2) in the regular methods implementation
use virtual property methods instead of direct raw fields; and
3) after each semantic branching add (and override) the new semantic assigning property.

Then we show our method is **general** enough,
and also applicable to any OOP languages:
1) that natively support multiple inheritance (e.g. C++, Python, OCaml, Lisp, Eiffel, etc.), or
2) single inheritance languages that support default interface methods (e.g. Java, C# etc.), or
3) single inheritance languages that support mixin, and conditional compilation (e.g. `static if` in D),
or traits (e.g. Scala).

### Demo:
As an example, in the diamond inheritance problem of <`Person, Student, Faculty, and ResearchAssistant`>, 
we want to achieve the ideal application semantics: each ResearchAssistant should **only have 3 fields**:
* **one joined** copy of `_name` field, but
* **two separated** different address fields:
  * one `_student_addr` ("dorm") as Student to takeRest(), and
  * one `_faculty_addr` ("lab") as Faculty to doBenchwork()

DDIFI can achieve this **ideal** application semantics, which is not possible with C++'s plain MI:

![ideal application semantics](https://github.com/joortcom/DDIFI/blob/main/talk/diamond_univ.png)

### Keywords:

multiple inheritance, diamond problem, program to (data-)interfaces,
virtual property, data interface, data implementation, semantic branching site, reusability, modularity


### Disclosure:

This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.
