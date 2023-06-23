/* ------------------------------------------------------------------------- *\
  Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.
\* ------------------------------------------------------------------------- */
interface Person {
  public String name();  // abstract property method, to be implemented
  public String addr();  // abstract property method, to be implemented
  // no actual field
}

class PersonImpl implements Person {
  // only define fields and property methods in data implementation class
  String _name;
  String _addr;
  @Override public String name() { return _name; }
  @Override public String addr() { return _addr; }
}

/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
interface Faculty extends Person {
  default String lab() {return addr();}  // new semantic assigning property

  // regular methods
  default void doBenchwork() {
    System.out.println(name() + " doBenchwork in the " + lab());
  }
}

class FacultyImpl extends PersonImpl implements Faculty {
  // nothing new needed, so just reuse PersonImpl
}

/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
interface Student extends Person {
  default String dorm() {return addr();}  // new semantic assigning property

  // regular methods
  default void takeRest() {
    System.out.println(name() + " takeRest in the " + dorm());
  }
}

class StudentImpl extends PersonImpl implements Student {
  // nothing new needed, so just reuse PersonImpl
}

/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
interface ResearchAssistant extends Student, Faculty {
  // factory method
  static ResearchAssistant make() {
    ResearchAssistant ra = new ResearchAssistantImpl();
    return ra;
  }
}

class ResearchAssistantImpl implements ResearchAssistant {
  // define three fields: NOTE: totally independent to those fields in PersonImpl, StudentImpl, and FacultyImpl
  String _name;
  String _faculty_addr;
  String _student_addr;

  ResearchAssistantImpl() {   // constructor
    _name = "ResAssis";
    _faculty_addr = "lab";
    _student_addr = "dorm";
  }

  // property methods
  @Override public String name() { return _name; }
  @Override public String addr() { return dorm(); }  // use dorm as addr
  @Override public String dorm() { return _student_addr; }
  @Override public String  lab() { return _faculty_addr; }
}


/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
public class MI {
  public static void main(String[] args) {
    ResearchAssistant ra = ResearchAssistant.make();
    Faculty f = ra;
    Student s = ra;

    ra.doBenchwork();  // ResAssis doBenchwork in the lab
    ra.takeRest();     // ResAssis takeRest in the dorm

    f.doBenchwork();   // ResAssis doBenchwork in the lab
    s.takeRest();      // ResAssis takeRest in the dorm
  }
}
