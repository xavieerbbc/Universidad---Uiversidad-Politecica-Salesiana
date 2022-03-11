h=[4 -1 6 2];
x=[-2 0 4 1];
function S= convolucion_disc(h,x)
nh=length(h);
nx=length(x);
%preasignando variable
y=zeros(nx,nh);
y=zeros(1,nx+nh-1);
%creando matriz
for j=1:nx
    for i=1:nh
        y(j,i)=h(i)*x(j);
    end
    Y(j,j:j-1+nh)=y(j,:);
end
%sumando
for l=1:nx+nh-1;
    S(l)=sum(Y(:,1));
end

S=[Y,S];

    