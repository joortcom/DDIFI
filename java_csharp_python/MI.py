#!/usr/bin/env python
import abc

# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
class Person:
  @abc.abstractmethod
  def name(self):  # abstract property method, to be implemented
    pass

  @abc.abstractmethod
  def addr(self):  # abstract property method, to be implemented
    pass

  # no actual field


class PersonImpl(Person):
  # only define fields and property methods in data implementation class
  def __init__(self):
    self._name = "name";
    self._addr = "addr";

  def name(self): return self._name;
  def addr(self): return self._addr;


# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
class Faculty(Person):
  def lab(self): return self.addr();  # new semantic assigning property

  # regular methods
  def doBenchwork(self):
    print(self.name() + " doBenchwork in the " + self.lab());


class FacultyImpl(PersonImpl, Faculty):
  # nothing new needed, so just reuse PersonImpl
  pass


# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
class Student(Person):
  def dorm(self): return self.addr();  # new semantic assigning property

  # regular methods
  def takeRest(self):
    print(self.name() + " takeRest in the " + self.dorm());


class StudentImpl(PersonImpl, Student):
  # nothing new needed, so just reuse PersonImpl
  pass


# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
class ResearchAssistant(Student, Faculty):
  # factory method
  @staticmethod
  def make():
    ra = ResearchAssistantImpl();
    return ra;


class ResearchAssistantImpl(ResearchAssistant):
  # define three fields: NOTE: totally independent to those fields in PersonImpl, StudentImpl, and FacultyImpl
  def __init__(self):   # constructor
    self._name = "ResAssis";
    self._faculty_addr = "lab";
    self._student_addr = "dorm";

  # property methods
  def name(self): return self._name;
  def addr(self): return self.dorm();  # use dorm as addr
  def dorm(self): return self._student_addr;
  def  lab(self): return self._faculty_addr;


# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
def main():
  ra:ResearchAssistant = ResearchAssistant.make();
  f:Faculty = ra;
  s:Student = ra;

  ra.doBenchwork();  # ResAssis doBenchwork in the lab
  ra.takeRest();     # ResAssis takeRest in the dorm

  f.doBenchwork();   # ResAssis doBenchwork in the lab
  s.takeRest();      # ResAssis takeRest in the dorm


if __name__ == '__main__':
  main()

