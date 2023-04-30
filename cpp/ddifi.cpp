#include <stdio.h>
typedef char* String;

char NAME[] = "ResAssis";
char HOME[] = "home";
char DORM[] = "dorm";
char  LAB[] = "lab";

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
