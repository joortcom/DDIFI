/* ------------------------------------------------------------------------- *\
  Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.
\* ------------------------------------------------------------------------- */
trait Person {
  def name(): String;  // abstract property method, to be implemented
  def addr(): String;  // abstract property method, to be implemented
  // no actual field
}

class PersonImpl extends Person {
  // only define fields and property methods in data implementation class
  var _name: String = "";
  var _addr: String = "";
  override def name(): String = { return _name; }
  override def addr(): String = { return _addr; }
}

/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
trait Faculty extends Person {
  def lab(): String = {return addr();}  // new semantic assigning property

  // regular methods
  def doBenchwork(): Unit = {
    System.out.println(name() + " doBenchwork in the " + lab());
  }
}

class FacultyImpl extends PersonImpl with Faculty {
  // nothing new needed, so just reuse PersonImpl
}

/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
trait Student extends Person {
  def dorm(): String = {return addr();}  // new semantic assigning property

  // regular methods
  def takeRest(): Unit = {
    System.out.println(name() + " takeRest in the " + dorm());
  }
}

class StudentImpl extends PersonImpl with Student {
  // nothing new needed, so just reuse PersonImpl
}

/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
trait ResearchAssistant extends Student with Faculty {
}

object ResearchAssistant {
  // factory method
  def make(): ResearchAssistant = {
    var ra: ResearchAssistant = new ResearchAssistantImpl();
    return ra;
  }
}

class ResearchAssistantImpl extends ResearchAssistant {
  // define three fields: NOTE: totally independent to those fields in PersonImpl, StudentImpl, and FacultyImpl
  var _name: String = "";
  var _faculty_addr: String = "";
  var _student_addr: String = "";

  // the default primary constructor
  _name = "ResAssis";
  _faculty_addr = "lab";
  _student_addr = "dorm";

  // property methods
  override def name(): String = { return _name; }
  override def addr(): String = { return dorm(); }  // use dorm as addr
  override def dorm(): String = { return _student_addr; }
  override def  lab(): String = { return _faculty_addr; }
}


/* ------------------------------------------------------------------------- *\
\* ------------------------------------------------------------------------- */
object Main extends App {
  var ra: ResearchAssistant = ResearchAssistant.make();
  var f: Faculty = ra;
  var s: Student = ra;

  ra.doBenchwork();  // ResAssis doBenchwork in the lab
  ra.takeRest();     // ResAssis takeRest in the dorm

  f.doBenchwork();   // ResAssis doBenchwork in the lab
  s.takeRest();      // ResAssis takeRest in the dorm
}

