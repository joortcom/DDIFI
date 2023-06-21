// define abstract property, as Person's data-interface
class Person {
 public:
  virtual String name() = 0;  // C++ abstract method
  virtual String addr() = 0;  // C++ abstract method

  // all_public_or_protected_regular_methods() are defined in the data-interface
  // to be inherited and reused
};

// define fields and property method, as Person's data-implementation
class PersonImpl : Person {
 protected:
  String _name;
  String _addr;
 public:
  virtual String addr() override { return _addr; }
  virtual String name() override { return _name; }
};
