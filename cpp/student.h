class Student : public Person {
 public:
  virtual String dorm() {return addr();}  // new semantic assigning property

  // regular methods' implementation
  void takeRest() {
    std::cout << name() << " takeRest in the " << dorm() << std::endl;
  }
};


class StudentImpl : public Student, PersonImpl {
  // no new field
};
