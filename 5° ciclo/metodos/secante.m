clear;
clc;
f=input('ingrese la funcion:','s');
x1=input('ingrese el punto xi-1:');
x2=input('ingrese el punto xi:');
err=input('Porcentaje de error:');
ezplot(f)
grid on
f=inline(f);
ea=100;
i=0;
fprintf('Iteraccion:                  Raiz\n')
while ea>err
    xi=x2-(f(x2)*(x1-x2))/(f(x1)-f(x2));
    ea=abs(((xi-x2)/xi)*100);
    fprintf('%f                 %8.4f\n',i,xi)
    xi=x2;
    x2=xi;
    i=i+1;
end
fprintf('\nRaiz de la funcion;%8.4f\nCalculada en %4.0fIteracciones\n',xi.i)
    
