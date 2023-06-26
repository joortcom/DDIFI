(* Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf. *)

class virtual person =
  object (self)
    method virtual name : unit -> string  (* abstract property method, to be implemented *)
    method virtual addr : unit -> string  (* abstract property method, to be implemented *)
    (* no actual field *)
    (* can contain regular methods *)
  end

class person_impl =
  object (self)
    (* only define fields and property methods in data implementation class *)
    val mutable _name = "name"
    val mutable _addr = "addr"
    method name() = _name
    method addr() = _addr
  end

(* ------------------------------------------------------------------------- *)
(* ------------------------------------------------------------------------- *)
class virtual student =
  object (self)
    inherit person
    method dorm = self#addr        (* new semantic assigning property *)

    (* regular methods *)
    method takeRest() =
            let n = self#name() in
            let d = self#dorm() in
            Printf.printf "%s takeRest in the %s\n" n d
  end

class student_impl =
  object (self)
    inherit student      (* the data-interface *)
    inherit person_impl  (* implementation inheritance is still an option *)
  end

(* ------------------------------------------------------------------------- *)
(* ------------------------------------------------------------------------- *)
class virtual faculty =
  object (self)
    inherit person
    method lab = self#addr        (* new semantic assigning property *)

    (* regular methods *)
    method doBenchWork() =
            let n = self#name() in
            let l = self#lab() in
            Printf.printf "%s doBenchWork in the %s\n" n l
  end

class faculty_impl =
  object (self)
    inherit faculty      (* the data-interface *)
    inherit person_impl  (* implementation inheritance is still an option *)
  end

(* ------------------------------------------------------------------------- *)
(* ------------------------------------------------------------------------- *)
class virtual research_assistant =
  object (self)
    inherit student
    inherit faculty
  end

class research_assistant_impl =
  object (self)
    inherit research_assistant      (* only inherit the data-interface *)

    (* define three fields: NOTE: totally independent to those fields in PersonImpl, StudentImpl, and FacultyImpl *)
    val mutable _name = "ResAssis"
    val mutable _faculty_addr = "lab"
    val mutable _student_addr = "dorm"

    (* property methods *)
    method name() = _name
    method addr() = _student_addr
    method dorm() = _student_addr
    method lab()  = _faculty_addr
  end

let make_research_assistant = new research_assistant_impl

(* ------------------------------------------------------------------------- *)
(* ------------------------------------------------------------------------- *)
let ra : research_assistant = make_research_assistant;;
ra#takeRest();;
ra#doBenchWork();;
