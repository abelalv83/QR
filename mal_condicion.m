clear all
clc
%% ver cambio
x=2:0.2:4;
n=length(x);
b=ones(n,1);
A=sparse(n,n);
for k=1:length(x)
    A(k,:)=x.^k;
end
spy(A)
sprintf('la condición de A es %e', cond(A))
save('A.mat','A')
save('b.mat','b')
x=inv(A)*b; % no es posible
res=norm(A*x-b);
sprintf("residuo calculando la inversa %e",res)

%%  
x=A\b; % no es posible
res=norm(A*x-b);
sprintf("residuo calculando A x %e",res)
%%%% factorizacion LU
[P,L,U]=lu(A);
c=L\(P*b);
x=U\(c);
res=norm(A*x-b);
sprintf("residuo  con LU %e",res)

%%%%%%%%%%%%%%%%%%%%%%% Gram Smitch clasico
[q,r]=granQR2(A);
x=r\(q'*b);
res=norm(A*x-b);
sprintf("residuo  con QR clasico %e",res)
%%%%%%%%%%%%%%%%% Gram smitch modificado
[q,r]=granQR2_m(A);
x=r\(q'*b);
res=norm(A*x-b);
sprintf("residuo  con QR modificado %e",res)
%%%%%%%%%%%%%%%%% qr matlab
[q,r]=qr(A,0);
x=r\(q'*b);
res=norm(A*x-b);
sprintf("residuo  con QR matlab %e",res)

%%%%%%%%%%%%%%
%%minimos cuadrados
x=0:0.1:10;
y=3*x+3;
yn=3*x+3+randn(1,length(x));
plot(x,y,x,yn,'o')



%% Ecuaciones normales


