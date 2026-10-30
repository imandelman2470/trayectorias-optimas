function [f,Df]=fobj(c1,c2,a,p,v0)
global c1 c2 a p v0 m n
f=[]; Df=[];
d(1)=true; d(2)=false;
if nargin>1, d(1:length(der))=logical(der); end
if d(1)
	f=p*quad(@(s) 1/vel(s),0,1);
if d(2)
  dfda=[];
  for i=1:m
      dfda(i)=-p^2*quad(@(s) 1/vel(s)*intphi(s,i),0,1);
  end
  dfda=dfda(:);  
  Df=[zeros(1,2*n);dfda;quad(@(s) 1/vel(s)-p/vel(s)^3*aphi(s),0,1);-p*v0*quad(@(s) 1/vel(s)^3,0,1)];
end 
  
  