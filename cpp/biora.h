// Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.

#include "util.h"

String LAB_A = "labA";
String LAB_B = "labB";

// only inherit from ResearchAssistant, but not from any other xxxImpl class
class BioResearchAssistantImpl : public ResearchAssistant {
 protected:
  // define two fields: NOTE: totally independent to those fields in PersonImpl, StudentImpl, and FacultyImpl
  String _name;
  String _student_addr;
 public:
  BioResearchAssistantImpl() {  // the constructor
    _name = NAME;
    _student_addr = DORM;
  }

  // override the property methods
  virtual String name() override { return _name; }
  virtual String addr() override { return dorm(); }  // use dorm as ResearchAssistant's main addr
  virtual String dorm() override { return _student_addr; }
  virtual String  lab() override {
    int weekday = get_week_day();
    return (weekday % 2) ? LAB_A : LAB_B;  // alternate between two labs
  }
};

ResearchAssistant* makeBioResearchAssistant() {  // the factory method
  ResearchAssistant* ra = new BioResearchAssistantImpl();
  return ra;
}
