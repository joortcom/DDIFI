// Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.

// define abstract virtual property, in Person's data-interface
class Person {
 public:
  virtual String name() = 0;  // C++ abstract virtual method
  virtual String addr() = 0;  // C++ abstract virtual method

  // all_public_or_protected_regular_methods() are defined in the data-interface
  // to be inherited and code-reused
};

// define fields and property method, in Person's data-implementation
class PersonImpl : Person {
 protected:
  String _name;
  String _addr;
 public:
  virtual String addr() override { return _addr; }
  virtual String name() override { return _name; }
};

