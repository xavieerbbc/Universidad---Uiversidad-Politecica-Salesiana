.MODEL tiny

.DATA

msj db "*** CALCULADORA *** $"    
msj1 db "* 1. SUMA * $"
msj2 db "* 2. RESTA * $"
msj3 db "* 3. MULTIPLICACION * $"
msj4 db "* 4. DIVISION * $"

mimemoria db 08H,10 DUP(24H)    ;08H limita la lectura a 7 caracteres mas enter
                                ;DUP(24H) escribe 10 veces el caracter 24H

.CODE


mov dx,OFFSET msj;
mov ah, 09h;                ;muestra en pantalla la cadena de caracteres en mimemoria hasta 

int 21h;
call linea;                            ;encontrar el 24H 

mov dx,OFFSET msj1;
mov ah, 09h;       

int 21h;
call linea;  

mov dx,OFFSET msj2;
mov ah, 09h;       

int 21h;
call linea;

mov dx,OFFSET msj3;
mov ah, 09h;       

int 21h;
call linea; 

mov dx,OFFSET msj4;
mov ah, 09h;       

int 21h;
call linea;  

jmp start ; skip data.
 
msg1 db 13, 10, 'input numbers in this range: [-32768..32767]', 13, 10
 db 13, 10, 'ingrese el primer numero: $'
 
 msg2 db 13, 10, 'ingrese el segundo numero: $'
 
 msg3 db 13, 10, 'la suma es: $'
 
; declaration of variable:
num dw ?
 
start:
 
; print first message
 mov dx, offset msg1
 mov ah, 9
 int 21h
 
call scan_num
 
; keep first number:
 mov num, cx
 
; print second message
 mov dx, offset msg2
 mov ah, 9
 int 21h
 
call scan_num
 
; add numbers:
 add num, cx
 jo overflow
 
; print the result:
 mov dx, offset msg3
 mov ah, 9
 int 21h
 
 mov ax, num
 call print_num
 
jmp exit

mov  dx,OFFSET mimemoria                                
mov  ah,0AH                 ;lee una cadena de caracteres desde teclado y los guarda emn mimemoria  
int  21H                           

call linea;



mov dx,OFFSET mimemoria;
mov ah, 09h;                ;muestra en pantalla la cadena de caracteres en mimemoria hasta 
                            ;encontrar el 24H 
int 21h;

mov ah, 0h;                 ;devuelve el control al sistema operativo
int 16h;

ret;

;-------------------------------------------------------------------
;               Procedimiento para salto de linea
;-------------------------------------------------------------------

    linea PROC NEAR          
               
        MOV     AH,02H             
        MOV     DL,0DH             ; regreso de linea
        INT     21H
         
        MOV     AH,02H
        MOV     DL,0AH             ; alimentacion de linea
        INT     21H
        RET                   

     linea ENDP

END