


n= input('Ingrese el tamaño de la funcion');
disp('Ingrese x(t)')
for j=1:n
    X(j)= input('');
end

disp('Ingrese h(t)')
for i=1:n
    H(i)= input('');
end
x=conv(H,X)

if n==1
    vec=[x(1)]    
    stem(vec)
end
if n==2
     vec=[x(2),x(1)] 
     
     stem(vec)
end
if  n==3
    vec=[x(3),x(2),x(1)] 
    stem(vec)
end
if n==4
   vec=[x(4),x(3),x(2),x(1)] 
   stem(vec)
end
if n==5
   vec=[x(5),x(4),x(3),x(2),x(1)] 
   stem(vec)
end
if n==6
   vec=[x(6),x(5),x(4),x(3),x(2),x(1)]
   stem(vec)
end
if n==7
   vec=[x(7),x(6),x(5),x(4),x(3),x(2),x(1)] 
   stem(vec)
end
if n==8
   vec=[x(8),x(7),x(6),x(5),x(4),x(3),x(2),x(1)] 
end
if n==9
   vec=[x(9),x(8),x(7),x(6),x(5),x(4),x(3),x(2),x(1)] 
   stem(vec)
end
if n==10
   vec=[x(10),x(9),x(8),x(7),x(6),x(5),x(4),x(3),x(2),x(1)] 
   stem(vec)
end