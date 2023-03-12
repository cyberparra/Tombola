CLS
SCREEN 9, 0, 0

REM ****************INIZIALIZZAZIONE VARIABILI***********************
        V = 200
        col = 6
        DIM NUM(90): DIM DONE(90): DIM XC(90): DIM XR(90)

        REM segmenti
                UNO$ = "0110000"
                DUE$ = "1011011"
                TRE$ = "1111001"
                QUATTRO$ = "0110101"
                CINQUE$ = "1101101"
                SEI$ = "1101111"
                SETTE$ = "0111000"
                OTTO$ = "1111111"
                NOVE$ = "1111101"
                ZERO$ = "1111110"

REM **********************COSTRUZIONE TABELLONE***********************

LOCATE 17, 1
PRINT " ----------------------------------- TABELLONE --------------------------------"

REM caricamento vettore
        COLOR 5, 1
        R = 19: c = 1
        FOR n = 1 TO 90
        NUM(n) = n
        LOCATE R, c
        XR(n) = R
        XC(n) = c
        PRINT n
        c = c + 4
        IF c >= 80 THEN c = 1: R = R + 1
        NEXT n

LOCATE 1, 1

REM ********************ESTRAZIONE NUMERO*******************************

50 K$ = INKEY$
IF K$ = "" THEN 50

        c = 90
        FOR L = 1 TO 90
        col = 10
        RANDOMIZE TIMER MOD 32767
           B = INT(RND * c) + 1
           c = 90 - L
        DONE(L) = NUM(B)

        REM RIPRISTINO VETTORE
        FOR X = B TO 90 - L
        NUM(X) = NUM(X + 1)
        NEXT X
        GOSUB 1500
        y = DONE(L)
        LOCATE XR(y), XC(y)
        COLOR 10, 1

        PRINT DONE(L)

REM attesa per nuovo numero


100 K$ = INKEY$

IF K$ = "" THEN 100


w = 88
col = 1
GOSUB 1500
GOSUB 3000
NEXT L
END

1500 REM ROUTINE NUMERI GRAFICI
        w = DONE(L)
        NUM$ = STR$(w)
        LUN = LEN(NUM$) - 1
        FOR M = 1 TO LUN
        DIGIT$(M) = MID$(NUM$, M + 1, 1)
        IF DIGIT$(M) = "1" THEN VETT$ = UNO$
        IF DIGIT$(M) = "2" THEN VETT$ = DUE$
        IF DIGIT$(M) = "3" THEN VETT$ = TRE$
        IF DIGIT$(M) = "4" THEN VETT$ = QUATTRO$
        IF DIGIT$(M) = "5" THEN VETT$ = CINQUE$
        IF DIGIT$(M) = "6" THEN VETT$ = SEI$
        IF DIGIT$(M) = "7" THEN VETT$ = SETTE$
        IF DIGIT$(M) = "8" THEN VETT$ = OTTO$
        IF DIGIT$(M) = "9" THEN VETT$ = NOVE$
        IF DIGIT$(M) = "0" THEN VETT$ = ZERO$

1900
FOR n = 1 TO 7
SEGM$(n) = MID$(VETT$, n, 1)
NEXT n
IF SEGM$(1) = "1" THEN GOSUB 2100
IF SEGM$(2) = "1" THEN GOSUB 2200
IF SEGM$(3) = "1" THEN GOSUB 2300
IF SEGM$(4) = "1" THEN GOSUB 2400
IF SEGM$(5) = "1" THEN GOSUB 2500
IF SEGM$(6) = "1" THEN GOSUB 2600
IF SEGM$(7) = "1" THEN GOSUB 2700

IF LUN = 2 THEN V = 350
NEXT M
V = 200
RETURN



2000 REM
2100 REM A
        FOR n = 1 TO 100
        CIRCLE (V + n, 160), 10, col
        NEXT n
        RETURN

2200 REM B
        FOR n = 1 TO 55
        CIRCLE (V + 100, 105 + n), 10, col
        NEXT n
        RETURN

2300 REM C
        FOR n = 1 TO 55
        CIRCLE (V + 100, 50 + n), 10, col
        NEXT n
        RETURN

2400 REM D
        FOR n = 1 TO 100
        CIRCLE (V + n, 50), 10, col
        NEXT n
        RETURN

2500 REM E
        FOR n = 1 TO 55
        CIRCLE (V, 50 + n), 10, col
        NEXT n
        RETURN

2600 REM F
        FOR n = 1 TO 55
        CIRCLE (V, 105 + n), 10, col
        NEXT n
        RETURN

2700 REM G
        FOR n = 1 TO 100
        CIRCLE (V + n, 105), 10, col
        NEXT n
        RETURN

3000 REM CENTRO

FOR y = 1 TO 10
    A = 300
    O = 100
        RANDOMIZE TIMER MOD 32767
           CLR = INT(RND * 16) + 2
    
    FOR X = 1 TO 100
    CIRCLE (A, O), X, CLR
    NEXT X
    
    FOR X = 100 TO 1 STEP -1
    CIRCLE (A, O), X, 1
    NEXT X
    
    SOUND (1000 + 100 * PI * y), 1
NEXT y
SOUND 400, 2
    RETURN

4000 REM SCHERMATA INIZIALE


