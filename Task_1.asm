; Macro definition to display a string
display macro var
    lea dx, var      ; Load the address of the variable into DX
    mov ah, 9        ; DOS interrupt service for displaying a string
    int 21h          ; Call interrupt 21h to print the string
endm

;using a functiion with parameters
.model small
.stack 100h
.data
var1 db "hello$"
var2 db "world$"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    display var1
    call new_line
    display var2
    
    mov ah,4ch
    int 21h
    
    
    
main endp

new_line proc
    mov dl,13
    mov ah,2
    int 21h
    
    mov dl,10
    mov ah,2
    int 21h 
   ret 
new_line endp
end main