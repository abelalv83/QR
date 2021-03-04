clear all
x=0:0.1:1;
n=length(x);
b=ones(n,1);
A=sparse(n,n);
for k=1:length(x)
    A(k,:)=x.^k;
end
% %speye(A)

save('A.mat','A')
save('b.mat','b')
x=inv(A)*b; % no es posible
norm(A*x-b)
[q,r]=qr(A);
x=inv(r)*q'*b;
norm(r*x-q'*b)

%%%%%%%%%%%%%%
%%minimos cuadrados
x=0:0.1:10;
y=3*x+3;
yn=3*x+3+randn(1,length(x));
plot(x,y,x,yn,'o')

%% Ecuaciones normales


