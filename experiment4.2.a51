 
//Experiment Name:- Serial communication using UART of 8051 Micro controller (B)
 
ORG 0000H               ; Set the origin (starting address) of the program to 0x0000
MOV SCON, #50H          ; Configure UART mode (Mode 1: 8-bit data, variable baud rate, enable receiver)
MOV TMOD, #20H          ; Set Timer 1 in Mode 2 (8-bit auto-reload mode)
MOV TH1, #-3            ; Set the high byte of Timer 1 to -3 (for baud rate generation; -3 is equivalent to 0xFD)
SETB TR1                ; Start Timer 1 to enable baud rate generation for UART

MOV DPTR, #MESS         ; Load the address of the message string (MESS) into the Data Pointer (DPTR)

SEND:
    CLR A               ; Clear the accumulator to prepare it for storing the character
    MOVC A, @A+DPTR     ; Move the byte pointed to by DPTR (message string) into accumulator A
    JZ SEND             ; If the value in A is 0 (null terminator), jump back to SEND (this ends the transmission)
    MOV SBUF, A         ; Move the character in the accumulator to the UART transmit buffer (SBUF) to send it
    JNB TI, $           ; Wait for the TI (Transmit Interrupt) flag to be set (indicating that data has been transmitted)
    CLR TI              ; Clear the TI flag (acknowledge transmission completion)
    INC DPTR            ; Increment the Data Pointer to point to the next character in the message string
    SJMP SEND           ; Jump back to the SEND label to transmit the next character

MESS:
    DB 'WELCOME TO VIIT', 0x0D, 0x0A  ; The message to be sent: "WELCOME TO VIIT" with carriage return (0x0D) and newline (0x0A)
    DB 'NAME:PRATHMESH R NAVALE', 0x0D, 0x0A  ; The next line: "NAME:PRATHMESH R NAVALE" with carriage return and newline
    DB 'PR.NO:22420235', 0x0D, 0x0A  ; The next line: "PR.NO:22420235" with carriage return and newline
    DB 'Roll No.:212075', 0x0D, 0x0A  ; The next line: "Roll No.:212075" with carriage return and newline
    DB 'Batch:B3', 0x0D, 0x0A      ; The next line: "Batch:B3" with carriage return and newline
    DB 0                          ; Null terminator to mark the end of the message string

END                      ; End of the program
