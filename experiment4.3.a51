
//Experiment Name:- Serial communication using UART of 8051 Micro controller (recive)(C)


ORG 0000h               ; Set the origin of the program to address 0x0000
MOV TMOD, #20h          ; Configure Timer 1 in Mode 2 (8-bit auto-reload mode)
MOV TH1, -3             ; Set the high byte of Timer 1 for baud rate generation (0xFD)
MOV SCON, #50h          ; Configure UART mode: 8-bit variable baud rate, enable receiver (Mode 1)
SETB TR1                ; Start Timer 1 to generate the baud rate

again:                  ; Label for the main loop
    up:                 ; Label for the 'up' loop to wait for the receive interrupt flag (RI)
        JNB RI, up      ; Jump back to 'up' if the RI flag is not set (i.e., no data received)
    
    MOV A, SBUF         ; Move the received byte (from SBUF) into the accumulator (A)
    MOV P1, A           ; Output the received data to Port 1 (P1) for external display (e.g., LEDs or 7-segment)
    
    CLR RI              ; Clear the RI flag to acknowledge that the byte has been read
    SJMP again          ; Jump back to the 'again' label to continue checking for new data

end:                    ; End of the program (this label is not used but indicates the end of the program)
