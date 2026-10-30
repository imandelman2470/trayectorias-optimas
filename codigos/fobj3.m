function [f,Df]=fobj3(x,der)
global m n Mintphi%vienen del principal
f=[]; Df=[];
a=x(4*n-1:4*n-2+m); p=x(4*n-1+m); v0=x(4*n+m);
ST=dbstack; fid=1; %para imprimir
fprintf(fid,'%s\\',ST(end:-1:1).name)
fprintf('||a||=%e, p=%e, v0=%e\n',norm(a),p,v0)
d(1)=true; d(2)=false;
if nargin>1, d(1:length(der))=logical(der); end
v=sqrt(2*p*a'*Mintphi+v0^2);
if d(1)
  if iscomplex(v)
    f=inf;
    fprintf('UPSS\n')
  else
    f=p*simpson_vect(1./v,0,1);
  end
end
if d(2)
  for i=1:m
      dfda(i)=simpson_vect(1./v.^3.*Mintphi(i,:),0,1);
  end
  dfda=dfda(:);  
  Df=[zeros(4*n-2,1);-p^2*dfda;simpson_vect(1./v,0,1)-p*a'*dfda;-p*v0*simpson_vect(1./v.^3,0,1)];
end 

