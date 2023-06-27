-- Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.
deferred class RESEARCH_ASSISTANT
inherit
	STUDENT undefine get_student_addr, set_student_addr end
	FACULTY undefine get_faculty_addr, set_faculty_addr end

feature {ANY}
   get_addr():STRING  is do Result := get_student_addr() end
   set_addr(a:STRING) is do set_student_addr(a) end

   get_student_addr():STRING  deferred end  -- override in research_assistant_impl
   get_faculty_addr():STRING  deferred end  -- override in research_assistant_impl
   set_student_addr(a:STRING) deferred end  -- override in research_assistant_impl
   set_faculty_addr(a:STRING) deferred end  -- override in research_assistant_impl

   -- regular methods
   print_ra() is  -- print out all 2 addresses
     do
       io.put_string(get_name() +" has 2 addresses: <"+ get_student_addr() +", "+ get_faculty_addr() + ">%N")
     end

end
