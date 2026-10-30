function [f,Df]=fobj4(x,der)
global m n Mintphi%vienen del principal
f=[]; Df=[];
a=x(2*n+1:3*n); p=x(end-1); v0=x(end);
ST=dbstack; fid=1; %para imprimir
fprintf(fid,'%s\\',ST(end:-1:1).name)
tmp=2*p*a'*Mintphi+v0^2; 
fprintf('||a||=%e, p=%e, v0=%e, mintmp=%e\n',norm(a),p,v0,min(tmp))
d(1)=true; d(2)=false;
if nargin>1, d(1:length(der))=logical(der); end
v=sqrt(tmp);
if d(1)
  if min(tmp)<=0
    f=inf;
    fprintf('UPSS\n')
  else
    f=p*simpson_vect(1./v,0,1);
  end
end
if d(2)
  for i=1:n
      dfda(i)=simpson_vect(1./v.^3.*Mintphi(i,:),0,1);
  end
  dfda=dfda(:);  
  Df=[zeros(2*n,1);-p^2*dfda;simpson_vect(1./v,0,1)-p*a'*dfda;-p*v0*simpson_vect(1./v.^3,0,1)];
end 

