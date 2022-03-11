clear;
clc;

n=100;
ruido=randn(n,1); %ruido artificial
x= rand(n,1).*10;%agrandado artificialmente

y=2 + 3.5 * x + ruido;

plot(x,y,'.')
lsline
X=[ones(size(x)) x];%adjuntar unos 

b = regress (y,X)