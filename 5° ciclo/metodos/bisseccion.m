clear;
clc;
syms x
t1=10;
cuenta=0;
fx=input('f(x)=');
xa=input('xa=');
xb=input('xb=');
t0=input('t0=');
interacciones=input('int=');
xr=xa;
while(t1>t0)
    xra=xr;
    xr=(xa+xb)/2;
    fxr=subs(fx,x,xr);
    fxa=subs(fx,x,xa);
    if((fxr*fxa)>0)
        xa=xr;
    end
    if((fxr*fxa)<0)
        xb=xr;
    end
    t1=abs(xr-xra);
    cuenta=cuenta+1;
    if(cuenta==interacciones)
        break;
    end
  
end  
disp(xr);

