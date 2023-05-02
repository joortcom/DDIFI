#include <iostream>
#include <string>
typedef std::string String;

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
    std::cout << name() << " takeRest in the " << dorm() << std::endl;
  }
};

class Faculty : public VIRTUAL Person {
 public:
  virtual String lab() {return _addr;}  // assign lab semantics to _addr
  void doBenchwork() {
    std::cout << name() << " doBenchwork in the " << lab() << std::endl;
  }
};

class ResearchAssistant : public VIRTUAL Student, public VIRTUAL Faculty {
};


int main() {
  std::cout << "sizeof(Person)  = " << sizeof(Person)  << std::endl;
  std::cout << "sizeof(Student) = " << sizeof(Student) << std::endl;
  std::cout << "sizeof(Faculty) = " << sizeof(Faculty) << std::endl;
  std::cout << "sizeof(ResearchAssistant) = " << sizeof(ResearchAssistant) << std::endl;
}
