import std;

interface Person {
  public string name();  // abstract property method, to be implemented
  public string addr();  // abstract property method, to be implemented
  // no actual field
}

class PersonImpl : Person {
  // only define fields and property methods in data implementation class
  string _name;
  string _addr;
  override public string name() { return _name; }
  override public string addr() { return _addr; }
}

interface Faculty : Person {
  string lab();        // new semantic assigning property
  void doBenchwork();  // regular methods
}

mixin template FacultyM(bool overrideProperty) {
 static if (overrideProperty) {
  override string lab() {return addr();}  // new semantic assigning property
 }

  override void doBenchwork() {
    writeln(name() ~ " doBenchwork in the " ~ lab());
  }
}

class FacultyImpl : PersonImpl, Faculty {
  // nothing new needed, so just extends PersonImpl
  mixin FacultyM!(true);
}

interface Student : Person {
  string dorm();    // new semantic assigning property
  void takeRest();  // regular methods
}

mixin template StudentM(bool overrideProperty) {
 static if (overrideProperty) {
  override string dorm() {return addr();}  // new semantic assigning property
 }

  override void takeRest() {
    writeln(name() ~ " takeRest in the " ~ dorm());
  }
}

class StudentImpl : PersonImpl, Student {
  // nothing new needed, so just extends PersonImpl
  mixin StudentM!(true);
}

interface ResearchAssistant : Student, Faculty {
  // factory method
  static ResearchAssistant make() {
    ResearchAssistant ra = new ResearchAssistantImpl();
    return ra;
  }
}

class ResearchAssistantImpl : ResearchAssistant {
  // define three fields: NOTE: totally independent to those fields in PersonImpl, StudentImpl, and FacultyImpl
  string _name;
  string _faculty_addr;
  string _student_addr;

  this() {   // constructor
    _name = "ResAssis";
    _faculty_addr = "lab";
    _student_addr = "dorm";
  }

  mixin FacultyM!(false);  // set overrideProperty=false, because we will override here in this impl!
  mixin StudentM!(false);  // set overrideProperty=false, because we will override here in this impl!

  // property methods
  override public string name() { return _name; }
  override public string addr() { return dorm(); }  // here we choos to use dorm as addr
  override public string dorm() { return _student_addr; }
  override public string  lab() { return _faculty_addr; }

  override string toString() {
    return (format("%s: <%s %s %s>", name(), addr(), dorm(), lab()));
  }
}


void main() {
  ResearchAssistant ra = ResearchAssistant.make();
  Faculty f = ra;
  Student s = ra;

  writeln(ra);
  writeln(f);
  writeln(s);

  ra.doBenchwork();  // ResAssis doBenchwork in the lab
  ra.takeRest();     // ResAssis takeRest in the dorm

  f.doBenchwork();   // ResAssis doBenchwork in the lab
  s.takeRest();      // ResAssis takeRest in the dorm
}
