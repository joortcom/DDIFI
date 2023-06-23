// Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.

using System;

/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
interface Person {
  public string name();  // abstract property method, to be implemented
  public string addr();  // abstract property method, to be implemented
  // no actual field
}

class PersonImpl : Person {
  // only define fields and property methods in data implementation class
  string _name = null;
  string _addr = null;
  public string name() { return _name; }
  public string addr() { return _addr; }
}

/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
interface Faculty : Person {
  string lab() {return addr();}  // new semantic assigning property

  // regular methods
  void doBenchwork() {
    Console.WriteLine(name() + " doBenchwork in the " + lab());
  }
}

class FacultyImpl : PersonImpl, Faculty {
  // nothing new needed, so just reuse PersonImpl
}

/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
interface Student : Person {
  string dorm() {return addr();}  // new semantic assigning property

  // regular methods
  void takeRest() {
    Console.WriteLine(name() + " takeRest in the " + dorm());
  }
}

class StudentImpl : PersonImpl, Student {
  // nothing new needed, so just reuse PersonImpl
}

/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
interface ResearchAssistant : Student, Faculty {
  // factory method
  public static ResearchAssistant make() {
    ResearchAssistant ra = new ResearchAssistantImpl();
    return ra;
  }
}

class ResearchAssistantImpl : ResearchAssistant {
  // define three fields: NOTE: totally independent to those fields in PersonImpl, StudentImpl, and FacultyImpl
  string _name;
  string _faculty_addr;
  string _student_addr;

  public ResearchAssistantImpl() {   // constructor
    _name = "ResAssis";
    _faculty_addr = "lab";
    _student_addr = "dorm";
  }

  // property methods
  public string name() { return _name; }
  public string addr() { return dorm(); }  // use dorm as addr
  public string dorm() { return _student_addr; }
  public string  lab() { return _faculty_addr; }
}


/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
public class MI {
  public static void Main(string[] args) {
    ResearchAssistant ra = ResearchAssistant.make();
    Faculty f = ra;
    Student s = ra;

    ra.doBenchwork();  // ResAssis doBenchwork in the lab
    ra.takeRest();     // ResAssis takeRest in the dorm

    f.doBenchwork();   // ResAssis doBenchwork in the lab
    s.takeRest();      // ResAssis takeRest in the dorm
  }
}
