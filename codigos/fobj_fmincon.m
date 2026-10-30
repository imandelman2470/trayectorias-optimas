function [f,df]=fobj_fmincon(x)
global m n qSimp Mintphi%vienen del principal
c1=x(1:n); c2=x(n+1:2*n); a=x(2*n+1:3*n); p=x(end-1); v0=x(end);
tmp=2*p*Mintphi'*a+v0^2;
if min(tmp)<=0
  f=1e+25;
  df=-f*[zeros(2*n,1);ones(n+2,1)];
  fprintf('fuera de dominio\n')
  return
end
Icv=1./sqrt(tmp);
f=p*qSimp'*Icv;
DIcv=-0.5*diag(Icv.^3);
df=[zeros(n,1);zeros(n,1);p*(2*p*Mintphi)*DIcv'*qSimp;
    qSimp'*Icv+p*qSimp'*DIcv*(2*Mintphi'*a);p*qSimp'*DIcv*(2*v0*ones(n,1))];

