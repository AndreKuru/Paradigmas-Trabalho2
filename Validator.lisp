(load "./Matrix.lisp")
(load "./OperatorMatrix.lisp")

#| TODO: Criar funções equivalentes aos validates do
   arquivo Backtracker do T1. Não criar validatetry
   e nem solve a principio. 
   TODO: Criar validador da região algebricamente.|#

; TODO: validar se o número passado não está no array
(defun validateArrayWithX (array value)
   (if (= (getSize array) 0)
      T
      (and (/= (car array) value) (validateArrayWithX (cdr array) value))
   )
)

; TODO: validar linha/coluna passada
(defun validateArray (array)
   (if (= (getSize array) 0)
      T
      (and (validateArray (cdr array))
           (or (= (car array) 0) (validateArrayWithX (cdr array) (car array))))
   )
)

; TODO: checar se linha tem elementos repetidos
(defun validateRow (numberMatrix index)
   (setq order    (getOrder numberMatrix))
   (setq row      (floor index order))
   (validateArray (getRow numberMatrix row))
)

; TODO: checar se coluna tem elementos repetidos
(defun validateColumn (numberMatrix index)
   (setq order    (getOrder numberMatrix))
   (setq column   (mod index order))
   (validateArray (getColumn numberMatrix column))
)

#| TODO: validar coerência entre dois elementos
         (sempre considerando da esquerda para
         a direita ou de cima para baixo) |#
(defun validateOperation (element1 element2 operator)
   (if (or (= element1 0) (= element2 0) (eq operator "|"))
      T
      (cond
         ((eq operator ">") (> element1 element2))
         ((eq operator "<") (< element1 element2))
         ((eq operator "v") (> element1 element2))
         ((eq operator "^") (< element1 element2))
      )
   )
)

; TODO: validar a coerência entre o elemento passado e aquele à sua direita
(defun validateRight (numberMatrix operatorMatrix index)
   (setq order   (getOrder numberMatrix))
   (setq column  (mod index order))
   (or (= column order) (validateOperation 
      (getElement numberMatrix index)
      (checkright operatorMatrix index)
      (getElement numberMatrix (+ index 1)))
   )
)

; TODO: validar a coerência entre o elemento passado e aquele à sua esquerda
(defun validateLeft (numberMatrix operatorMatrix index)
   (setq order  (getOrder numberMatrix))
   (setq column (mod index order))
   (or (= column 0) (validateOperation
      (getElement numberMatrix index)
      (checkleft operatorMatrix index)
      (getElement numberMatrix (- index 1)))
   )
)

; TODO: validar a coerência entre o elemento passado e aquele embaixo
(defun validateDown (numberMatrix operatorMatrix index)
   (setq order (getOrder numberMatrix))
   (setq row   (floor index order))
   (or (= row (- order 1)) (validateOperation
      (getElement numberMatrix index)
      (checkleft operatorMatrix index)
      (getElement numberMatrix (+ index order)))
   )
)

; TODO: validar a coerência entre o elemento passado e aquele acima
(defun validateUp (numberMatrix operatorMatrix index)
   (setq order (getOrder numberMatrix))
   (setq row   (floor index order))
   (or (= row 0) (validateOperation
      (getElement numberMatrix index)
      (checkleft operatorMatrix index)
      (getElement numberMatrix (- index order)))
   )
)

; TODO: validar a coerência entre o elemento passado e todos seus adjacentes
(defun validateAdjacents (numberMatrix operatorMatrix index)
   (and
      (validateRight numberMatrix operatorMatrix index)
      (validateLeft numberMatrix operatorMatrix index)
      (validateDown numberMatrix operatorMatrix index)
      (validateUp numberMatrix operatorMatrix index)
   )
)

; TODO: validar coerência de um elemento no puzzle
(defun validateElement (numberMatrix operatorMatrix index)
   (and
      (validateRow numberMatrix operatorMatrix index)
      (validateColumn numberMatrix operatorMatrix index)
      (validateAdjacents numberMatrix operatorMatrix index)
   )
)