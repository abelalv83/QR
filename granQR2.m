function [q,r]=granQR2(a)
%% gram schmidt clasico pagian 21  sauver
[n,m]=size(a);
q=zeros(n,m);
r=zeros(m,m);

for k=1:m
   y=a(:,k);
   for j=1:k-1
       r(j,k)=dot(a(:,k),q(:,j));
       y=y-r(j,k)*q(:,j);
   end
 
   r(k,k)=norm(y);
   q(:,k)=y/r(k,k);
end

end