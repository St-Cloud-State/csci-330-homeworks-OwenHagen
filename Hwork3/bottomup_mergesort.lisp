;; Function to merge two sorted lists into one sorted list
(defun my-merge (lst1 lst2)
  (cond ((null lst1) lst2)  ;; If lst1 is empty, return lst2
        ((null lst2) lst1)  ;; If lst2 is empty, return lst1
        ((<= (car lst1) (car lst2))  ;; Compare the first elements of both lists
         (cons (car lst1) (my-merge (cdr lst1) lst2)))  ;; Take the smaller element first
        (t (cons (car lst2) (my-merge lst1 (cdr lst2))))))  ;; Otherwise, take element from lst2

;; Function to merge adjacent lists in a list of lists
(defun pairwise-merge (lst)
  (cond ((null lst) nil)  ;; If the list is empty, return nil
        ((null (cdr lst)) (list (car lst)))  ;; If there's only one list left, wrap it in a list
        (t (cons (my-merge (car lst) (cadr lst))  ;; Merge the first two lists
                 (pairwise-merge (cddr lst))))))  ;; Recursively merge the rest

;; Bottom-up Mergesort implementation
(defun bottom-up-mergesort (lst)
  (setf lst (mapcar #'list lst))  ;; Convert each element into a single-element list
  (loop while (cdr lst) do
    (setf lst (pairwise-merge lst)))  ;; Merge pairs of lists iteratively
  (car lst))  ;; Return the fully sorted list

