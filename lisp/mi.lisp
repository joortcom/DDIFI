;; Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.

;; -----------------------------------------------------------------------------
;; cannot use ADDR as a function in SBCL, so we use `adrs` instead of `addr`
;; -----------------------------------------------------------------------------
(defclass Person ()
  ())  ; NO slot (i.e data field) defined here

(defgeneric name (self))
(defgeneric adrs (self))

(defmethod name ((self Person))
  (error "name need to be implemented in the data-implementation class!"))
(defmethod adrs ((self Person))
  (error "adrs need to be implemented in the data-implementation class!"))

(defclass PersonImpl (Person)
  ; slots (i.e data fields) are defined here
  ((name :initarg :name :accessor name)
   (adrs :initarg :adrs :accessor adrs)))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------
(defclass Student (Person)
  ())

(defgeneric dorm  (self))
(defmethod  dorm ((self Student))  ; new semantic assigning property
  (adrs self))

(defmethod takeRest ((self Person))
  ; use the new semantic assigning property
  (format T "~a takeRest int the ~a~%" (name self) (dorm self) ))

; implementation inheritance is still an option
(defclass StudentImpl (Student PersonImpl)  ; inherit from PersonImpl for code reuse
  ())

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------
(defclass Faculty (Person)
  ())

(defgeneric lab  (self))
(defmethod  lab ((self Faculty))  ; new semantic assigning property
  (adrs self))

(defmethod doBenchwork ((self Person))
  ; use the new semantic assigning property
  (format T "~a doBenchwork in the ~a~%" (name self) (lab self) ))

; implementation inheritance is still an option
(defclass FacultyImpl (Faculty PersonImpl)  ; inherit from PersonImpl for code reuse
  ())

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------
(defclass ResearchAssistant (Student Faculty)
  ())

(defclass ResearchAssistantImpl (ResearchAssistant)  ; only inherit the data-interface
  ; define three fields: NOTE: totally independent to those fields in PersonImpl, StudentImpl, and FacultyImpl
  ((name :initarg :name :accessor name)
   (dorm :initarg :dorm :accessor dorm)
   (lab  :initarg :lab  :accessor lab )))

(defmethod adrs ((self ResearchAssistantImpl))
  (dorm self))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------
(let ((ra (make-instance 'ResearchAssistantImpl :name "ResAssis" :dorm "dorm" :lab "lab"))) ;
  (doBenchwork ra)
  (takeRest ra))

