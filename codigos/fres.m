function [f,Df]=fres(x,der)
global c1 c2 a p v0 m n g mun mut alpha beta k
f=[]; Df=[];
c1=x(1:2*n-1); c2=x(2*n:4*n-2); a=x(4*n-1:4*n-2+m); p=x(4*n-1+m); v0=x(4*n+m);
d(1)=true; d(2)=false;
if nargin>1, d(1:length(der))=logical(der); end
j=1:m; s=(j-1)/(m-1);
if d(1)
for j=1:m
  for i=1:m    
    w(j,i)=phi(s(j),i);    
  end   
  z(j)=dc(s(j)); 
  G1(j,:)=simpson_vect((norm(z).^2-1).*w(:,j),0,1);
end
G2=cur(0)-cur(1);
for i=1:m
  intfi(i)=intphi(1,i);
  fi(i)=phi(0,i)-phi(1,i);
  v(i)=vel(s(i));
  ace(i)=acel(s(i));
  d2(i)=norm(d2c(s(i))).^2;
  piinf(i)=norm(p*c(s(i))-alpha(s(i))).^2;
  piext(i)=norm(p*c(s(i))-beta(s(i))).^2;
end
G3=a'*intfi;
G4=a'*fi;
G5=dc(0)-dc(1);
G6=d2c(0)-d2c(1);
G7(j,:)=simpson_vect((ace.^2/mut^2+1/(p^2*mun^2).*v.*d2-g^2).*(w(:,j)),0,1);
G8(j,:)=simpson_vect((piinf-k^2).*w(:,j),0,1);
G9(j,:)=simpson_vect((piext-k^2).*w(:,j),0,1);
G10=p;
f=[G1;G2;G3;G4;G5;G6;G7;G8;G9;G10];
end

