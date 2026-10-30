function [xn,t,k]=reg_armijoPr(fun,x,PrX,f,df,param)
% ejecutar [xn,t,k]=reg_armijoPr(fun,x,PrX,f,df,param)
% param es opcional
% donde param(1)=cantidad maxima de iteraciones (default=100)
%       param(2)=valor del paso inicial para el arco (default=1)
%       param(3)=factor de reduccion para el arco (default=0.5)
%       param(4)=valor del paso inicial para la direccion (default=1)
%       param(5)=factor de reduccion para la direccion (default=1)
%       param(6)=constante de Armijo en (0,1) (default=1e-4)
p=[100; 1; 0.5; 1; 1; 1e-4];
if nargin>5, p(1:length(param))=param; end
maxit=p(1); s=p(2); rs=p(3); alpha=p(4); ra=p(5);  sig=p(6); k=1; 
xs=PrX(x-s*df);
d=xs-x;
xn=x+alpha*d;
t=min(alpha,s);
fn=fun(xn);
while fn>f+alpha*sig*df'*d && k<=maxit
  s=rs*s;
  alpha=ra*alpha;
  xs=PrX(x-s*df);
  d=xs-x;
  xn=x+alpha*d;
  t=min(alpha,s);
  fn=fun(xn);
  k=k+1;
end
