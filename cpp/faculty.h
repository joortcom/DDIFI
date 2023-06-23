// Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.

class Faculty : public Person {
 public:
  // add new semantic assigning virtual property
  virtual String lab() {  // give it a new exact name matching its new semantics
    return addr();         // but the implementation here can be just super's addr()
  }

  // regular methods' implementation
  void doBenchwork() {
    cout << name() << " doBenchwork in the "
         << lab()  // MUST use the new property, not the inherited addr() whose semantics has branched!
         << endl;
  }
};

class FacultyImpl : public Faculty, PersonImpl {
  // no new field: be memory-wise efficient, while function-wise flexible
};
