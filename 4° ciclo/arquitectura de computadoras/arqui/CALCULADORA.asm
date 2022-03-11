
.MODEL tiny

.DATA


.CODE
        
include 'emu8086.inc' ;Incluye funciones de libreria emu8086 
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS 

jmp inicio ;salta a etiqueta inicio  
   
msj1 db 13,10,'INGRESE EL PRIMER NUMERO: $'      ;db asigna un espacio a las variables en memoria 
msj2 db 13,10,'INGRESE EL SEGUNDO NUMERO: $'     
suma db 13,10,'** LA SUMA ES: $' 
resta db 13,10,'** LA RESTA ES: $' 
multi db 13,10,'** LA MULTIPLICACION ES: $' 
divic db 13,10,'** LA DIVISION ES: $'



num1 dw ? ; define las variables en 2 bytes 
num2 dw ? ; 

inicio: 

mov ah,09 ;
lea dx,msj1 ;carga en dx la direccion apuntada por el msj1
int 21h ;  la interupcion de la pantalla que con la funcion del 09 
        ;  para imprimir una cadena 

call SCAN_NUM 
mov num1,cx ;mueve numero a variable num1 a la posicion de memoria cx 

mov ah,09 ;
lea dx,msj2 ;se guarda en dx la direccion especificada en msj2
int 21h 

call SCAN_NUM 
mov num2,cx ;

mov ah,09 
lea dx,suma
int 21h    ; Esta interrupción tiene funciones, que llama la funcion 
           ; cada una de ellas si  es necesario que el registro AH.

;suma
mov ax,num1 ;
adc ax,num2 ;suma los numeros digitado, queda almacenaddo en ax 
call PRINT_NUM 

;resta
mov ah,09 
lea dx,resta
int 21h 
mov ax,num1 ;
sbb ax,num2 ;resta el 2do del 1er numero, queda almacenaddo en ax 
call PRINT_NUM 


;multiplicacion
mov ah,09 
lea dx,multi
int 21h 
mov ax,num1 ;
mov bx,num2 ;
imul bx 
call PRINT_NUM 

;divicion
mov ah,09 
lea dx,divic
int 21h  ; este tiene varias funciones y llama cuando son necesario desde el registro AH
            ; es una funcion de interupcion de pantalla que con la funcion del 09 manda a 
            ;imprimir la cadena.
            
xor dx,dx ;deja en cero dx; si no  se desborda la division
          ;DX ALMACENA EL modulo de la division, por eso hay q dejarlo en cero
mov ax,num1 ;mueve primer numero digitado a ax 
mov bx,num2 ;mueve segundo numero digitado a bx
div bx ;ax = ax*bx
call PRINT_NUM 


END