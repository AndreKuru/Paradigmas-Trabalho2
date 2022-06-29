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

; TODO: retornar linha
(defun getRow (matrix row)
    (setq order getOrder (matrix))
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
)

; TODO: retornar tamanho da matriz
(defun getSize (matrix)
)

; TODO: alterar elemento
(defun setElement (matrix index value)
    (setq order getOrder (matrix))
)

; TODO: função auxiliar de generateMatrix
(defun generateElements (matrix value remainingElements)
    (if (= 0 remainingElements)
        (matrix)
        (generateElements (cons value matrix) value (- 1 remainingElements)))
    )

; TODO: criar matriz de valor único
(defun generateMatrix (order value)
    (setq remainingElements (expt order 2))
    (generateElements () value remainingElements)
)

; TODO: printar matriz
(defun printMatrix (matrix)
)

#| TODO: Funções para retornar os elementos de dada região
    e retornar região de um dado elemento |#

