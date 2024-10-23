; Macro to display a string
display macro var
     lea dx, var
     mov ah, 9
     int 21h
endm
.model small
.stack 100h

.data
    variable1 DB 23         ; Variable 1 contains 23
    variable2 DB 65         ; Variable 2 contains 65
    msg1 db 'After swapping:', 13, 10, '$'  ; Message to display after swapping
    msg_var1 db 'Variable1: $'
    msg_var2 db 'Variable2: $'

.code

main proc
    ; Initialize the data segment
    mov ax, @data
    mov ds, ax

    ; Display initial message
    display msg1

    ; Perform the swap of variable1 and variable2
    mov al, variable1        ; Move 23 into AL
    mov bl, variable2        ; Move 65 into BL

    mov variable1, bl        ; Store 65 in variable1
    mov variable2, al        ; Store 23 in variable2

    ; Display Variable 1
    display msg_var1
    mov al, variable1
    call display_number      ; Display the value of variable1
    
    ; Move to a new line
    call new_line

    ; Display Variable 2
    display msg_var2
    mov al, variable2
    call display_number      ; Display the value of variable2

    ; Exit the program
    mov ah, 4CH
    int 21h
main endp

; Function to display a number (AL contains the number)
display_number proc
    ; Convert the number in AL to ASCII and display it
    aam                     ; Convert AL to two decimal digits
    add ax, 3030h           ; Convert to ASCII characters (0x30 is ASCII '0')
    
    mov dl, ah              ; Display the tens digit
    mov ah, 2
    int 21h

    mov dl, al              ; Display the ones digit
    mov ah, 2
    int 21h
    ret
display_number endp

; Function to print a new line
new_line proc
    mov dl, 13
    mov ah, 2
    int 21h
    
    mov dl, 10
    mov ah, 2
    int 21h
    ret
new_line endp

end main
