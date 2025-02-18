;; Function to partition a list into two nearly equal halves
(defun partition-list (lst left right)
  (cond ((null lst) (values (reverse left) (reverse right)))  ;; Base case: return reversed partitions when list is empty
        ((null (cdr lst))  ;; If only one element remains, add it to left partition and return both
         (values (reverse (cons (car lst) left)) (reverse right)))
        (t (partition-list (cddr lst)  ;; Recursively take two elements at a time
                           (cons (car lst) left)  ;; Add first element to left partition
                           (cons (cadr lst) right)))))  ;; Add second element to right partition

;; Function to merge two sorted lists into one sorted list
(defun my-merge (lst1 lst2)
  (cond ((null lst1) lst2)  ;; If lst1 is empty, return lst2
        ((null lst2) lst1)  ;; If lst2 is empty, return lst1
        ((<= (car lst1) (car lst2))  ;; Compare first elements of both lists
         (cons (car lst1) (my-merge (cdr lst1) lst2)))  ;; Take the smaller element first
        (t (cons (car lst2) (my-merge lst1 (cdr lst2))))))  ;; Otherwise, take element from lst2

;; Function to perform recursive Mergesort on a list
(defun mergesort (lst)
  (if (or (null lst) (null (cdr lst))) lst  ;; Base case: return the list if empty or contains one element
    (multiple-value-bind (left right) (partition-list lst nil nil)  ;; Split list into two halves
      (my-merge (mergesort left) (mergesort right)))))  ;; Recursively sort and merge both halves

