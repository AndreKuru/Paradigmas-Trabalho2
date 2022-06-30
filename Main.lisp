(load "./Matrix.lisp")

#| TODO: Inserir entradas para teste e testar as funções conforme for criando. |#
(defun main()
    (setq example  (list 00 01 02  03 04 05  06 07 08
                         09 10 11  12 13 14  15 16 17
                         18 19 20  21 22 23  24 25 26

                         27 28 29  30 31 32  33 34 35
                         36 37 38  39 40 41  42 43 44
                         45 46 47  48 49 50  51 52 53

                         54 55 56  57 58 59  60 61 62
                         63 64 65  66 67 68  69 70 71
                         72 73 74  75 76 77  78 79 80))

    (setq example6 (list 00 01  02 03  04 05
                         06 07  08 09  10 11
                         12 13  14 15  16 17
                         18 19  20 21  22 23
                         24 25  26 27  28 29
                         30 31  32 33  34 35))

    (printMatrix example)
    (setq example2 (generateMatrix 9 0))
    (printMatrix example2)

    (write-line (write-to-string(getElement example 56)))
    (setq example3 (setElement example 56 66))
    (write-line (write-to-string(getElement example3 56)))
    (print (getElement example3 56))
    (printMatrix example3)
    (write-line (write-to-string(getSize example3)))
    (write-line (write-to-string(getOrder example3)))
    (write-line "-- Column")
    (printColumn (getColumn example 2))

    (write-line "-- Example 9x9")
    (write-line "-- Region 0")
    (printRegion (getRegion example 0))
    (write-line "-- Region 1")
    (printRegion (getRegion example 1))
    (write-line "-- Region 2")
    (printRegion (getRegion example 2))
    (write-line "-- Region 3")
    (printRegion (getRegion example 3))
    (write-line "-- Region 4")
    (printRegion (getRegion example 4))
    (write-line "-- Region 5")
    (printRegion (getRegion example 5))
    (write-line "-- Region 6")
    (printRegion (getRegion example 6))
    (write-line "-- Region 7")
    (printRegion (getRegion example 7))
    (write-line "-- Region 8")
    (printRegion (getRegion example 8))


    (write-line "-- Example 6x6")
    (printMatrix example6)

    (write-line "-- Region 0")
    (printRegion (getRegion example6 0))
    (write-line "-- Region 1")     
    (printRegion (getRegion example6 1))
    (write-line "-- Region 2")     
    (printRegion (getRegion example6 2))
    (write-line "-- Region 3")     
    (printRegion (getRegion example6 3))
    (write-line "-- Region 4")     
    (printRegion (getRegion example6 4))
    (write-line "-- Region 5")     
    (printRegion (getRegion example6 5))
)

(main)
