class Faculty : public Person {
 public:
  virtual String lab() {return addr();}  // new semantic assigning property

  // regular methods' implementation
  void doBenchwork() {
    printf("%s doBenchwork in the %s\n", name(), lab());
  }
};

class FacultyImpl : public Faculty, PersonImpl {
  // no new field
};
