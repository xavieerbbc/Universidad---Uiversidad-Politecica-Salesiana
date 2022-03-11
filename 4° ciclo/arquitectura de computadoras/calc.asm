
.model small
.stack
.data
msj db 0ah,0dh, '***** Menu *****', '$'
msj2 db 0ah,0dh, '1.- Crear Archivo', '$'
msj3 db 0ah,0dh, '2.- Abrir Archivo', '$'
msj4 db 0ah,0dh, '3.- Modificar archivo', '$'
msj5 db 0ah,0dh, '4.- Eliminar archivo', '$'
msj6 db 0ah,0dh, '5.- Salir', '$'
msj7 db 0ah,0dh, 'El Cerrado de un arhcivo se hace automatico', '$'
msjelim db 0ah,0dh, 'Archivo eliminado con exito', '$'
msjcrear db 0ah,0dh, 'Archivo creado con exito', '$'
msjescr db 0ah,0dh, 'Archivo escrito con exito', '$'
msjnom db 0ah,0dh, 'Nombre del archivo: ', '$'
cadena db 'Cadena a Escribir en el archivo','$'
nombre db 'archivo2.txt',0  ;nombre archivo a manejar, debe terminar en 0
vec db 50 dup('$')   ;variable a usar para la escritura del archivo.
handle db 0 ;Se cargará para la escritura de archivos, tamaño en bytes.
linea db 10,13,'$'  ;Hace un solo salto de linea
.code
inicio:

menu:
  imprime msj
  imprime msj2
  imprime msj3
  imprime msj4
  imprime msj5
  imprime msj6
  imprime msj7

  mov ah,0dh
  int 21h
 ;comparamos la opción que se tecleó
  mov ah,01h
  int 21h
  cmp al,31h
  je crear
  cmp al,32h
  je abrir
  cmp al,33h
  je pedir
  cmp al,34h
  je eliminar
  cmp al,35h
  je salir'Seleccione una Opcion$',13,10