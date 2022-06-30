#| TODO: Funções genéricas para manipular as matrizes,
    caso esbarremos em algum problema criar as funções
    problemáticas pra cada tipo de matriz (INT, Char...)
    em um arquivo específico. |#

; Retorna o elemento da matriz passada
(defun getElement (matrix index)
    (if (= index 0)
        (car matrix)
        (getElement (cdr matrix) (- index 1))
    )
)

; Retorna "order" elementos a partir da posição "begin"
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
 
; Retorna a linha da matriz quadrada passada
(defun getRow (matrix row)
    (setq order (getOrder matrix))
    (getRowAux matrix (* row order) order)
)

; Retorna a coluna da matriz quadrada passada sem calcular order
(defun getColumnWithOrder (matrix column order)
    (if (null matrix)
        ()
        (if (= column (mod (car matrix) order))
            (cons (car matrix) (getColumnWithOrder (cdr matrix) column order))
            (getColumnWithOrder (cdr matrix) column order)
        )
    )
)

; Retorna a coluna da matriz quadrada passada
(defun getColumn (matrix column)
    (setq order (getOrder matrix))
    (getColumnWithOrder matrix column order)
)

; TODO: retornar região
(defun getRegion (matrix region)
    (setq order getOrder (matrix))
)

; Retorna a ordem da matriz
(defun getOrder (matrix)
    (sqrt (getSize matrix))
)

; Retorna o tamanho da matriz
(defun getSize (matrix)
    (if (null matrix)
        0
        (+ 1 (getSize (cdr matrix)))
    )
)

; Altera o elemento na posição do indíce com o valor informado
(defun setElement (matrix index value)
    (if (= index 0)
        (cons value (cdr matrix))
        (cons (car matrix) (setElement (cdr matrix) (- index 1) value))
    )
)

; Cria uma matrix de tamanho e valor informado
(defun generateMatrixAux (value size)
    (if (= size 0)
        ()
        (cons value (generateMatrixAux value (- size 1)))
    )
)

; Cria uma matriz com o valor informado
(defun generateMatrix (order value)
    (setq size (expt order 2))
    (generateMatrixAux value size)
)

(defun printColumn (column)
    (if (null column)
        (values)
        (progn
            (write-line (write-to-string(car column)))
            (printColumn (cdr column))
        )
    )
)

; Imprime uma matriz quadrada a partir da linha informada
(defun printMatrixFromRow (matrix row order)
  (write-line (write-to-string (getRow matrix row)))
  (if (= row (- order 1))
    (values)
    (printMatrixFromRow matrix (+ row 1) order)
  )
)

; Imprime uma matriz quadrada
(defun printMatrix (matrix)
    (setq order (getOrder matrix))
    (printMatrixFromRow matrix 0 order)
)

#| TODO: Funções para retornar os elementos de dada região
e retornar região de um dado elemento |#