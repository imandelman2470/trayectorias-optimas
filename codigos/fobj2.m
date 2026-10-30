function [f,Df]=fobj2(x,der)
global m n Mintphi%vienen del principal
global a p v0 %necesarias para subfunciones
global xtmp
xtmp=x;
f=[]; Df=[];
a=x(4*n-1:4*n-2+m); p=x(4*n-1+m); v0=x(4*n+m);
d(1)=true; d(2)=false;
if nargin>1, d(1:length(der))=logical(der); end
j=1:m; s=(j-1)/(m-1);
for j=1:m
	v(j)=vel(s(j));
end
if d(1)
	f=p*simpson_vect(1./v,0,1);
end
if d(2)
  for i=1:m
      dfda(i)=simpson_vect(1./v.^3.*Mintphi(i,:),0,1);
  end
  dfda=dfda(:);  
  Df=[zeros(4*n-2,1);-p^2*dfda;simpson_vect(1./v,0,1)-p*a'*dfda;-p*v0*simpson_vect(1./v.^3,0,1)];
end 

