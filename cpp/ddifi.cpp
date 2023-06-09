// Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.

#include <iostream>
#include <string>
typedef std::string String;
using namespace std;

String NAME = "ResAssis";
String HOME = "home";
String DORM = "dorm";
String  LAB = "lab";

#include "person.h"
#include "student.h"
#include "faculty.h"
#include "ra.h"
#include "biora.h"

int main() {
  ResearchAssistant* ra = makeResearchAssistant();
  Faculty* f = ra;
  Student* s = ra;

  ra->doBenchwork();  // ResAssis doBenchwork in the lab
  ra->takeRest();     // ResAssis takeRest in the dorm

  f->doBenchwork();   // ResAssis doBenchwork in the lab
  s->takeRest();      // ResAssis takeRest in the dorm

  return 0;
}
