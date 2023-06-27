-- Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.
class   PERSON_IMPL
inherit PERSON

feature {ANY}
   -- only define fields and property methods in data implementation class
   name_: STRING
   addr_: STRING

   get_name():STRING  is do Result := name_ end
   get_addr():STRING  is do Result := addr_ end

   set_name(n:STRING) is do name_ := n end
   set_addr(a:STRING) is do addr_ := a end
end
