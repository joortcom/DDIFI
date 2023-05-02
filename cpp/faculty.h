class Faculty : public Person {
 public:
  virtual String lab() {return addr();}  // new semantic assigning property

  // regular methods' implementation
  void doBenchwork() {
    std::cout << name() << " doBenchwork in the " << lab() << std::endl;
  }
};

class FacultyImpl : public Faculty, PersonImpl {
  // no new field
};
