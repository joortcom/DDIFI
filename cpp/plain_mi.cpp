#include <stdio.h>
typedef char* String;

#define VIRTUAL // virtual  // no matter we use virtual inheritance or not, it's problematic

class Person {
 protected:
  String _name;  // need to be joined into one single field in ResearchAssistant
  String _addr;  // need to be separated into two addresses in ResearchAssistant
 public:
  virtual String name() {return _name;}
  virtual String addr() {return _addr;}
};

class Student : public VIRTUAL Person {
 public:
  virtual String dorm() {return _addr;}  // assign dorm semantics to _addr
  void takeRest() {
    printf("%s takeRest in the %s\n", name(), dorm());
  }
};

class Faculty : public VIRTUAL Person {
 public:
  virtual String lab() {return _addr;}  // assign lab semantics to _addr
  void doBenchwork() {
    printf("%s doBenchwork in the %s\n", name(), lab());
  }
};

class ResearchAssistant : public VIRTUAL Student, public VIRTUAL Faculty {
};


int main() {
  printf("sizeof(Person)  = %ld\n", sizeof(Person));
  printf("sizeof(Student) = %ld\n", sizeof(Student));
  printf("sizeof(Faculty) = %ld\n", sizeof(Faculty));
  printf("sizeof(ResearchAssistant) = %ld\n", sizeof(ResearchAssistant));
}
