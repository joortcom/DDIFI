-- Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.
deferred class STUDENT
inherit PERSON

feature {ANY}
   get_student_addr():STRING  is do Result := get_addr() end  -- assign dorm semantics to addr
   set_student_addr(a:STRING) is do set_addr(a) end

   -- regular methods
   take_rest() is
     do
       io.put_string(get_name() + " take_rest in the: " + get_student_addr() + "%N");
     end
end
