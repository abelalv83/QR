clear all
x=2:0.2:4;
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
res=norm(A*x-b);
sprintf("residuo sin QR %e",res)

[q,r]=qr(A);
x=inv(r)*q'*b;
res=norm(r*x-q'*b);
sprintf("residuo  con QR %e",res)

%%%%%%%%%%%%%%
%%minimos cuadrados
x=0:0.1:10;
y=3*x+3;
yn=3*x+3+randn(1,length(x));
plot(x,y,x,yn,'o')

%% Ecuaciones normales


