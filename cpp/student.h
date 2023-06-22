class Student : public Person {
 public:
  // add new semantic assigning virtual property
  virtual String dorm() {  // give it a new exact name matching its new semantics
    return addr();         // but the implementation here can be just super's addr()
  }

  // regular methods' implementation
  void takeRest() {
    cout << name() << " takeRest in the "
         << dorm()  // MUST use the new property, not the inherited addr() whose semantics has branched!
         << endl;
  }
};


class StudentImpl : public Student, PersonImpl {
  // no new field: be memory-wise efficient, while function-wise flexible
};
