(load "./Matrix.lisp")

; Verifica um número válido para o índice informado a partir do valor informado
(defun solveElement (operatorMatrix numberMatrix order value index)
    (if (> value order)                                             ; Checa se todos os valores já não foram tentados
        (list (- 1))                                                            ; Erro1: Acabaram as tentativas nível 1
        (progn
            (setq try (setElement numberMatrix index value))            ; Prepara uma matriz de tentativa
            (if (validateElement try operatorMatrix index)              ; Testa a tentativa
                try                                                         ; Se funcionar devolve a atual tentativa
                (operatorMatrix numberMatrix order (+ value 1) index)         ; Se não faz uma nova tentativa
            )
        )
    )
)

; Tenta todos os valores possíveis na Matriz de números passada a partir do indíce informado
; (serão tentados todos os valores nos indíces seguintes e no atual será tentado valores a partir do valor informado)
(defun solveMatrixAux (operatorMatrix numberMatrix order value index)
    (if (>= index (* index index))                                                              ; Checa se toda a matriz de números foi preenchida
        numberMatrix                                                                                ; Se sim retorna a resposta
        (progn                                                                                      ; Se não
            (setq try (solveElement operatorMatrix numberMatrix order value index))                     ; Procura uma tentativa válida para o índice atual
            (if (/= (list (- 1)) try)                                                                           ; Checa se não se esgotaram as tentativas do indíce atual
                (if (/= (list (- 2)) try)                                                                           ; Checa se não se esgotaram as tentativas do indíce seguinte
                    (solveMatrixAux operatorMatrix try order 1                              (+ index 1))        ; Tudo certo até então, tenta com o indíce seguinte
                    (solveMatrixAux operatorMatrix try order (+ (getElement try index) 1)   index)              ; Não dá pra seguir assim, tenta outros valores no indíce atual
                )
                (list (- 2))                                                                               ; Erro2: Acabaram as tentativas nível 2
            )
        )
    )
)

#|(defun solveElement (operatorMatrix numberMatrix order value index)
    (if (> value order)
        (progn
            (write-line "Max value reached")
            '(- 1)
        )
        (progn
            (setq attempt (setElement numberMatrix index value))            ; Prepara uma matriz de tentativa
            (if (validateElement attempt operatorMatrix index)              ; Testa a tentativa
                attempt                                                         ; Se funcionar devolve a atual tentativa
                (solveElement operatorMatrix numberMatrix order (+ value 1) index)         ; Se não faz uma nova tentativa
            )
        )
    )
)

(defun solveMatrixAux (operatorMatrix numberMatrix order value index)
    (if (>= index (* order order))
        numbermatrix
        (setq attempt (solveElement operatorMatrix numberMatrix order value index))
    )
    (if (typep attempt 'number)
        (progn
            (setq lastvalue (getElement numberMatrix (- index 1)))
            (if (= lastvalue order)
                (progn
                    (write-line "Value reseted")
                    (setq value 1)
                    (write-line (write-to-string value))
                )
                (setq value (+ lastvalue 1))    
            )
            (solveMatrixAux operatorMatrix numberMatrix order value (- index 1))
        )
        (progn
            (write-line (write-to-string index))
            (printMatrix attempt)
            (solveMatrixAux operatorMatrix attempt order 1 (+ index 1)) ; Tudo certo até então, tenta com o indíce seguinte
        )
    )
)|#

; Encontra uma matriz solução (de números) para uma matriz de operadores informada
(defun solveMatrix (operatorMatrix)
    (setq order   (getOrderOperatorMatrix operatorMatrix))
    (setq numberMatrix (generateMatrix order 0))
    (solveMatrixAux operatorMatrix numberMatrix order 1 0)
)