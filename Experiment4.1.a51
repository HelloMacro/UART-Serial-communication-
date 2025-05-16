 
//Experiment Name:- Serial communication using UART of 8051 Micro controller (A)
 

org 0000h         ; Origin at address 0x0000 (starting point of the program)
mov tmod, #20h    ; Configure Timer 1 in Mode 2 (8-bit auto-reload mode)
mov th1, #0fdh    ; Load Timer 1 high byte with value 0xFD for the baud rate generation
mov scon, #50h    ; Configure UART in Mode 1 (8-bit variable baud rate, enable receiver)
setb tr1          ; Start Timer 1 (enable timer for baud rate generation)

; Send the characters "WELCOME TO VIIT PRATHAM" over UART one by one
mov a, #'W'       ; Load the accumulator with ASCII value of 'W'
acall trance       ; Call 'trance' subroutine to send the character 'W' via UART
mov a, #'E'       ; Load the accumulator with ASCII value of 'E'
acall trance       ; Call 'trance' subroutine to send the character 'E' via UART
mov a, #'L'       ; Load the accumulator with ASCII value of 'L'
acall trance       ; Call 'trance' subroutine to send the character 'L' via UART
mov a, #'C'       ; Load the accumulator with ASCII value of 'C'
acall trance       ; Call 'trance' subroutine to send the character 'C' via UART
mov a, #'O'       ; Load the accumulator with ASCII value of 'O'
acall trance       ; Call 'trance' subroutine to send the character 'O' via UART
mov a, #'M'       ; Load the accumulator with ASCII value of 'M'
acall trance       ; Call 'trance' subroutine to send the character 'M' via UART
mov a, #'E'       ; Load the accumulator with ASCII value of 'E'
acall trance       ; Call 'trance' subroutine to send the character 'E' via UART
mov a, #' '       ; Load the accumulator with ASCII value of space (' ')
acall trance       ; Call 'trance' subroutine to send space via UART
mov a, #'T'       ; Load the accumulator with ASCII value of 'T'
acall trance       ; Call 'trance' subroutine to send the character 'T' via UART
mov a, #'O'       ; Load the accumulator with ASCII value of 'O'
acall trance       ; Call 'trance' subroutine to send the character 'O' via UART
mov a, #' '       ; Load the accumulator with ASCII value of space (' ')
acall trance       ; Call 'trance' subroutine to send space via UART
mov a, #'V'       ; Load the accumulator with ASCII value of 'V'
acall trance       ; Call 'trance' subroutine to send the character 'V' via UART
mov a, #'I'       ; Load the accumulator with ASCII value of 'I'
acall trance       ; Call 'trance' subroutine to send the character 'I' via UART
mov a, #'I'       ; Load the accumulator with ASCII value of 'I'
acall trance       ; Call 'trance' subroutine to send the character 'I' via UART
mov a, #'T'       ; Load the accumulator with ASCII value of 'T'
acall trance       ; Call 'trance' subroutine to send the character 'T' via UART
mov a, #' '       ; Load the accumulator with ASCII value of space (' ')
acall trance       ; Call 'trance' subroutine to send space via UART
mov a, #'r'       ; Load the accumulator with ASCII value of 'P'
acall trance       ; Call 'trance' subroutine to send the character 'P' via UART
mov a, #'f'       ; Load the accumulator with ASCII value of 'R'
acall trance       ; Call 'trance' subroutine to send the character 'R' via UART
mov a, #'d'       ; Load the accumulator with ASCII value of 'A'
acall trance       ; Call 'trance' subroutine to send the character 'A' via UART
mov a, #'v'       ; Load the accumulator with ASCII value of 'T'
acall trance       ; Call 'trance' subroutine to send the character 'T' via UART
mov a, #'b'       ; Load the accumulator with ASCII value of 'H'
acall trance       ; Call 'trance' subroutine to send the character 'H' via UART
mov a, #'g'       ; Load the accumulator with ASCII value of 'A'
acall trance       ; Call 'trance' subroutine to send the character 'A' via UART
mov a, #'g'       ; Load the accumulator with ASCII value of 'M'
acall trance       ; Call 'trance' subroutine to send the character 'M' via UART

again: 
sjmp again        ; Infinite loop, continuously repeating the transmission process

trance:           ; 'trance' subroutine to send a character via UART
mov sbuf, a       ; Move the character from the accumulator to the UART transmit buffer (sbuf)
up: 
jnb ti, up        ; Wait until the Transmit Interrupt (TI) flag is set (indicating data is transmitted)
clr ti            ; Clear the TI flag to acknowledge the transmission
ret               ; Return from the subroutine

end               ; End of program
