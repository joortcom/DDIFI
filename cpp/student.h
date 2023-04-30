class Student : public Person {
 public:
  virtual String dorm() {return addr();}  // new semantic assigning property

  // regular methods' implementation
  void takeRest() {
    printf("%s takeRest in the %s\n", name(), dorm());
  }
};


class StudentImpl : public Student, PersonImpl {
  // no new field
};
