-- Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.
deferred class PERSON

feature {ANY}
   get_name():STRING  deferred end
   set_name(n:STRING) deferred end

   get_addr():STRING  deferred end
   set_addr(a:STRING) deferred end
end
