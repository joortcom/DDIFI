-- Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.
-- to build with SmartEiffel: compile  app.e -o app
class APP inherit INTERNAL

create {ANY}
   make

feature {ANY}
   ra: RESEARCH_ASSISTANT
   f:  FACULTY
   s:  STUDENT

   make_research_assistant() : RESEARCH_ASSISTANT is
     local
       rai: RESEARCH_ASSISTANT_IMPL
     do
       create rai.make
       Result := rai
     end

   make is
      do
	 ra := make_research_assistant()
	 f := ra
	 s := ra

	 ra.do_benchwork()  -- ResAssis do_benchwork in the: lab
	 ra.take_rest()     -- ResAssis take_rest in the: dorm
	 f.do_benchwork()   -- ResAssis do_benchwork in the: lab
	 s.take_rest()      -- ResAssis take_rest in the: dorm

      end
end
