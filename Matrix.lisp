#| TODO: Funções genéricas para manipular as matrizes,
    caso esbarremos em algum problema criar as funções
    problemáticas pra cada tipo de matriz (INT, Char...)
    em um arquivo específico. |#

; TODO: retornar elemento
(defun getElement (matrix index)
    (if (= 0 index)
        (car matrix)
        (getElement (cdr matrix) (- 1 index))
    )
)

(defun getRowAux (matrix begin order)
    (setq head (car matrix))
    (if (= begin 0)
        (if (= order 0)
            ()
            (cons (car matrix) (getRowAux (cdr matrix) 0 (- order 1)))
        )
        (getRowAux (cdr matrix) (- begin 1) order)
    )
)
 
; TODO: retornar linha
(defun getRow (matrix row)
    (setq order (getOrder matrix))
    (getRowAux matrix (* row order) order)
)

; TODO: retornar coluna
(defun getColumn (matrix column)
    (setq order getOrder (matrix))
)

; TODO: retornar região
(defun getRegion (matrix region)
    (setq order getOrder (matrix))
)

; TODO: retornar ordem da matriz
(defun getOrder (matrix)
    (sqrt (getSize matrix))
)

; TODO: retornar tamanho da matriz
(defun getSize (matrix)
    (if (null matrix)
        0
        (+ 1 (getSize (cdr matrix)))
    )
)

; TODO: alterar elemento
(defun setElementWithOrder (matrix index value order)
    (if (= index 0)
        (list (value) (cdr matrix))
        (list (car matrix) (setElementWithOrder (cdr matrix (- index 1) value order)))
    )
)

; TODO: alterar elemento
(defun setElement (matrix index value)
    (setq order getOrder (matrix))
    (setElementWithOrder matrix index value order)
)

; TODO: função auxiliar de generateMatrix
(defun generateElements (matrix value remainingElements)
    (if (= 0 remainingElements)
        (matrix)
        (generateElements (cons value matrix) value (- 1 remainingElements))
    )
)

; TODO: criar matriz de valor único
(defun generateMatrix (order value)
    (setq remainingElements (expt order 2))
    (generateElements () value remainingElements)
)

(defun printMatrixFromRow (matrix row order)
  (write-line (write-to-string (getRow matrix row)))
  (if (= row (- order 1))
    (write-line (write-to-string (getRow matrix row)))
    (printMatrixFromRow matrix (+ row 1) order)
  )
)

; TODO: printar matriz
(defun printMatrix (matrix)
    (setq order (getOrder matrix))
    (printMatrixFromRow matrix 0 order)
)

#| TODO: Funções para retornar os elementos de dada região
e retornar região de um dado elemento |#