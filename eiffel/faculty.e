-- Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.
deferred class FACULTY
inherit PERSON

feature {ANY}
   get_faculty_addr():STRING  is do Result := get_addr() end  -- assign lab semantics to addr
   set_faculty_addr(a:STRING) is do set_addr(a) end

   -- regular methods
   do_benchwork() is
     do
       io.put_string(get_name() + " do_benchwork in the: " + get_faculty_addr() + "%N");
     end
end
