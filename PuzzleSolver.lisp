; Verifica um número válido para o índice informado a partir do valor informado
(defun solveElement (operatorMatrix numberMatrix order value index)
    (if (> value order)                                             ; Checa se todos os valores já não foram tentados
        (-1)                                                            ; Erro1: Acabaram as tentativas nível 1
        (progn
            (setq try (setElement numberMatrix index value))            ; Prepara uma matriz de tentativa
            (if (validateElement try operatorMatrix index)              ; Testa a tentativa
                try                                                         ; Se funcionar devolve a atual tentativa
                operatorMatrix numberMatrix order (+ value 1) index         ; Se não faz uma nova tentativa
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
            (if (/= (-1) try)                                                                           ; Checa se não se esgotaram as tentativas do indíce atual
                (if (/= (-2) try)                                                                           ; Checa se não se esgotaram as tentativas do indíce seguinte
                    (solveMatrixAux operatorMatrix try order 1                              (+ index 1))        ; Tudo certo até então, tenta com o indíce seguinte
                    (solveMatrixAux operatorMatrix try order (+ (getElement try index) 1)   index)              ; Não dá pra seguir assim, tenta outros valores no indíce atual
                )
                (-2)                                                                                ; Erro2: Acabaram as tentativas nível 2
            )
        )
    )
)

; Encontra uma matriz solução (de números) para uma matriz de operadores informada
(defun solveMatrix (operatorMatrix)
    (setq order   (getOrderOperatorMatrix operatorMatrix))
    (setq numberMatrix (generateMatrix order 0))
    (solveMatrixAux operatorMatrix numberMatrix order 1 0)
)