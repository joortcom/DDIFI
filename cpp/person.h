class Person {  // define abstract property, as Person's (data) interface
 public:
  virtual String name() = 0;  // C++ abstract method
  virtual String addr() = 0;  // C++ abstract method

  // all_regular_methods()
};


class PersonImpl : Person {  // define fields and property method, as Person's (data) implementation
 protected:
  String _name;
  String _addr;
 public:
  virtual String addr() override { return _addr; }
  virtual String name() override { return _name; }
};
