(setq ext:*warn-on-redefinition* nil)

; Part 1: List Functions

(defun append (x y)
	(if (null x) y
		(cons (car x) (append (cdr x) y))
	)
)

(defun reverse (x)
	(if (null x) '()
		(append (reverse (cdr x)) (list (car x)))
	)
)

(defun add3 (x)
	(+ 3 x)
)

(defun map (x y)
	(if (null y) nil
		(append (list (funcall x (car y))) (map x (cdr y)))
	)
)

(defun nub (x)
	(reverse (nub-helper x nil))
)

(defun nub-helper (x out)
	(if (null x) out
		(if (member (car x) out) (nub-helper (cdr x) out)
			(nub-helper (cdr x) (cons (car x) out))
		)
	)
)

(defun fold (val func list)
	(if (null (cdr list)) (funcall func val (car list))
		(fold (funcall func val (car list)) func (cdr list))
	) 
)

(defun lessthan3 (x) 
	(< x 3)
)

(defun filter (func list)
	(if (null list) nil
		(if (funcall func (car list)) (append (list (car list)) (filter func (cdr list)))
			(filter func (cdr list))
		)
	)
)

(defun merge (x y)
	(if (and (null x) (null y)) nil
		(if (null x) y
			(if (null y) x
				(if (< (car x) (car y)) (append (list (car x)) (merge (cdr x) y))
					(if (> (car x) (car y)) (append (list (car y)) (merge x (cdr y)))
						(append (list (car x) (car y)) (merge (cdr x) (cdr y)))
					)
				)
			)
		)
	)
)

(defun addtoend (a x)
	(reverse (cons a (reverse x)))
)

(defun indexof (a x)
	(indexof-helper a x 0)
)

(defun indexof-helper (a x i)
	(if (null x) -1
		(if (eq a (car x)) i
			(indexof-helper a (cdr x) (+ i 1))	
		)
	)
)

(defun remove-all (a x)
        (if (null x) '()
                (if (eq a (car x)) (remove-all a (cdr x))
                        (cons (car x) (remove-all a (cdr x)))
                )
        )
)

; Part 2: Set Functions

(defun member (a x)
	(if (null x) nil
		(if (eq a (car x)) t
			(member a (cdr x))
		)
	)
)

(defun insert (a x)
	(if (eq (member a x) nil) (cons a x)
		x
	)
)

(defun intersection (x y)
	(if (null x) '()
                (if (member (car x) y) (append (list (car x)) (intersection (cdr x) y))
                	(intersection (cdr x) y)
                )
        )
)

(defun union (x y)
	(if (null y) x
		(if (member (car y) x) (union x (cdr y))
			(union (addtoend (car y) x) (cdr y))
		)
	)
)

(defun difference (x y)
	(if (null x) '()
		(if (member (car x) y) (difference (cdr x) y)
			(append (list (car x)) (difference (cdr x) y))
		)
	)
)

(defun symdiff (x y)
	(union (difference x y) (difference y x))
)

(defun subsetp (x y)
	(if (null x) t
		(if (member (car x) y) (subsetp (cdr x) y)
			nil
		)
	)
)

(defun supersetp (x y)
	(subsetp y x)
)

(defun cardinality (x)
	(if (null x) 0
		(+ 1 (cardinality (cdr x)))
	)
)

; Part 3: Math Functions

(defun abs (x)
	(if (< x 0) (* -1 x)
		x
	)
)

(defun factorial (x)
	(if (> x 1) (* x (factorial (- x 1)))
		1
	)
)

(defun right-tri (a b c)
	(eql (+ (* a a) (* b b)) (* c c))
)

(defun rem (a b)
	(if (< a b) a
		(rem (- a b) b)
	)
)

(defun gcd (a b)
	(if (< a b) (gcd b a)
		(if (eql (rem a b) 0) b
			(gcd b (rem a b))
		)
	)
)

(defun isMultiple (a b r)    ;if a is a multiple of b
	(if (< a b) nil
		(if (eql a b) t
			(isMultiple a (+ b r) r)
		)
	)
)

(defun lcm (a b)
	(lcm-helper a a b)
)

(defun lcm-helper (a r b)
	(if (> a (* r b)) (* r b)
		(if (isMultiple a b b) a
			(lcm-helper (+ a r) r b)
		)
	)
)

(defun nth-fibo (n)
	(if (< n 2) n
		(+ (nth-fibo (- n 1)) (nth-fibo (- n 2)))
	)
)

(defun primep (n)
	(prime-helper n 2)
)

(defun prime-helper (n i)
	(if (<= n 2) (if (eql n 2) t nil)
		(if (eql (rem n i) 0) nil
			(if (> (* i i) n) t
				(prime-helper n (+ 1 i))
			)
		)
	)
)

(defun nth-prime (n)
	(if (>= n 1) (nth-prime-helper 2 n 1)
		nil
	)
)

(defun nth-prime-helper (x n i)
	(if (primep x) 
		(if (eql n i) x 
			(nth-prime-helper (+ 1 x) n (+ 1 i))
		)
		(nth-prime-helper (+ 1 x) n i)
	)
)

; Part 4: Required Functions

(defun factors (n i)
	(if (eql i n) nil
		(if (eql (rem n i) 0) (append (list i) (factors n (+ 1 i)))
			(factors n (+ 1 i))
		)
	)
)

(defun list-sum (x)
	(if (null x) 0
		(+ (car x) (list-sum (cdr x)))
	)
)

(defun perfectp (n)
	(eql n (list-sum (factors n 1)))
)

(defun abundantp (n)
	(< n (list-sum (factors n 1)))
)

(defun deficientp (n)
	(> n (list-sum (factors n 1)))
)

(defun print-function (func input1 input2 input3 num)
	(if (eql num 0) nil
		(if (eql num 1) (format t "(~a ~a) => ~a~%" func input1 (funcall func input1))
			(if (eql num 2) (format t "(~a ~a ~a) => ~a~%" func input1 input2 (funcall func input1 input2))
				(format t "(~a ~a ~a ~a) = ~a~%" func input1 input2 input3 (funcall func input1 input2 input3))
			)	
		)
	)
)

(defun test (func) 
	(format t "~&Testing function ~a~%" func)
	(repl func)
	"Stopped REPL"
)

(defun repl (func)
	(flet ((prompt ()
			(format t "Enter a list of arguments for ~a (NIL to stop): " func)
			(finish-output)
			(read nil 'eof nil)
		))
		(let ((*user-list* (prompt)))
			(print-function func (car *user-list*) (cadr *user-list*) (caddr *user-list*) (cardinality *user-list*))
			(if (null *user-list*) nil
				(repl func)
			)
		)
	)
)

(defun initial-print ()
	(format t "***~%*** CSC173~%*** Project 3: Functional Programming in Lisp~%*** Yoo (Daniel) Choi~%***~2&")
	(format t "*** List functions~2&")
	(print-function 'append '(1 3 X A) '(4 2 B) nil 2)
	(print-function 'reverse '(a b c d) nil nil 1)
	(print-function 'map 'add3 '(1 2 3 4) nil 2)
	(print-function 'nub '(1 1 2 4 1 2 5) nil nil 1)
	(print-function 'fold '10 '- '(1 3 2) 3)
	(print-function 'filter 'lessthan3 '(1 3 4 2 1 6) nil 2)
	(print-function 'merge '(1 3 4 7) '(2 3 6) nil 2)
	(print-function 'addtoend 'd '(a b c) nil 2)
	(print-function 'indexof 'a '(b c a d) nil 2)
	(print-function 'indexof 'a '(b c d f) nil 2)
	(print-function 'remove-all 'a '(b a c a a d a) nil 2)
	(format t "~2&*** Set functions~2&")
	(print-function 'member 'a '(b c a d) nil 2)
	(print-function 'insert 'a '(b c d) nil 2)
	(print-function 'insert 'a '(a b c d) nil 2)
	(print-function 'intersection '(a b c) '(a c d) nil 2)
	(print-function 'union '(a b c) '(a c d) nil 2)
	(print-function 'difference '(a b c) '(a c d) nil 2)
	(print-function 'difference '(a c d) '(a b c) nil 2)
	(print-function 'symdiff '(a b c) '(a c d) nil 2)
	(print-function 'subsetp '(a b) '(a b c d) nil 2)
	(print-function 'subsetp '(a b q) '(a b c d) nil 2)
	(print-function 'supersetp '(a b c d) '(a b) nil 2)
	(print-function 'supersetp '(a b c d) '(a q b) nil 2)
	(print-function 'cardinality '(a b c) nil nil 1)
	(format t "~2&*** Math functions~2&")
	(print-function 'abs 7 nil nil 1)
	(print-function 'abs -7 nil nil 1)
	(print-function 'factorial 5 nil nil 1)
	(print-function 'right-tri 3 4 5 3)
	(print-function 'right-tri 1 2 3 3)
	(print-function 'gcd 8 12 nil 2)
	(print-function 'lcm 4 6 nil 2)
	(print-function 'nth-fibo 6 nil nil 1)
	(print-function 'nth-fibo 10 nil nil 1)
	(print-function 'primep 1 nil nil 1)
	(print-function 'primep 2 nil nil 1)
	(print-function 'primep 4 nil nil 1)
	(print-function 'primep 5 nil nil 1)
	(print-function 'primep 10 nil nil 1)
	(print-function 'primep 11 nil nil 1)
	(print-function 'primep 101 nil nil 1)
	(print-function 'nth-prime 1 nil nil 1)
	(print-function 'nth-prime 2 nil nil 1)
	(print-function 'nth-prime 3 nil nil 1)
	(print-function 'nth-prime 4 nil nil 1)
	(print-function 'nth-prime 5 nil nil 1)
	(print-function 'nth-prime 6 nil nil 1)
	(print-function 'nth-prime 26 nil nil 1)
	(format t "~2&*** Required functions~2&")
	(print-function 'perfectp 5 nil nil 1)
	(print-function 'perfectp 6 nil nil 1)
	(print-function 'perfectp 36 nil nil 1)
	(print-function 'perfectp 496 nil nil 1)
	(print-function 'abundantp 5 nil nil 1)
	(print-function 'abundantp 12 nil nil 1)
	(print-function 'deficientp 5 nil nil 1)
	(print-function 'deficientp 12 nil nil 1)
	(format t "~2&*** END OF FUNCTIONS DEMO ***~2&To test one the functions in a REPL loop, run: (test 'FUNCTION_NAME)~&")
	(format t "Example user inputs in list form: ~%(1) ~%(1 2) ~%((a b c) (c d)) ~%((a b c d)) ~%(a (a b c a)) ~%(10 - (1 3 2))~2&")
)

(initial-print)
