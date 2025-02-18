;; Function to insert an element into a sorted list at the correct position
(defun insert (elem sorted-list)
  (if (or (null sorted-list)  ;; If the sorted list is empty, insert the element
          (<= elem (car sorted-list)))  ;; If elem is smaller or equal to the first element, insert it at the front
      (cons elem sorted-list)  ;; Insert elem at the correct position
      (cons (car sorted-list) (insert elem (cdr sorted-list)))))  ;; Otherwise, recursively insert elem further down the list

;; Function to sort a list using insertion sort
(defun insertion-sort (lst)
  (if (null lst) nil  ;; Base case: if the list is empty, return nil
      (insert (car lst) (insertion-sort (cdr lst)))))  ;; Insert the first element into the sorted portion recursively
