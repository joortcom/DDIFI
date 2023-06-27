-- Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.
class   RESEARCH_ASSISTANT_IMPL
inherit RESEARCH_ASSISTANT

create {ANY}
   make

feature {ANY}
   student_addr_ : STRING
   faculty_addr_ : STRING
   name_: STRING

   get_name():STRING  is do Result := name_ end
   set_name(n:STRING) is do name_ := n end

   get_student_addr():STRING  is do Result := student_addr_ end  -- override
   get_faculty_addr():STRING  is do Result := faculty_addr_ end  -- override
   set_student_addr(a:STRING) is do student_addr_ := a end       -- override
   set_faculty_addr(a:STRING) is do faculty_addr_ := a end       -- override

   make is
     do
       name_ := "ResAssis"
       student_addr_ := "dorm"  -- the dorm semantics
       faculty_addr_ := "lab"   -- the lab  semantics
     end
end
