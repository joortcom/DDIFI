// Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.

class ResearchAssistant : public Student, public Faculty {  // MI with regular-methods code reuse!
};

class ResearchAssistantImpl : public ResearchAssistant {  // only inherit from ResearchAssistant interface
 protected:
  // define three fields: NOTE: totally independent to those fields in PersonImpl, StudentImpl, and FacultyImpl
  String _name;
  String _faculty_addr;
  String _student_addr;
 public:
  ResearchAssistantImpl() {  // the constructor
    _name = NAME;
    _faculty_addr = LAB;
    _student_addr = DORM;
  }

  // override the property methods
  virtual String name() override { return _name; }
  virtual String addr() override { return dorm(); }  // use dorm as ResearchAssistant's main addr
  virtual String dorm() override { return _student_addr; }
  virtual String  lab() override { return _faculty_addr; }
};

ResearchAssistant* makeResearchAssistant() {  // the factory method
  ResearchAssistant* ra = new ResearchAssistantImpl();
  return ra;
}
