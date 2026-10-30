function [xn,t,k]=reg_armijo(fun,x,d,ph0,dph0,param)
% ejecutar [xn,t,k]=reg_armijo(fun,x,d,ph0,dph0,param)
% param es opcional
% donde param(1)=cantidad maxima de iteraciones
% donde param(2)=valor del paso inicial
%       param(3)=constante de Armijo en (0,1)
%       param(4)=factor de reduccion r en (0,1)
p=[100; 1; 1e-4; 0.5];
if nargin>5, p(1:length(param))=param; end
maxit=p(1); t=p(2); sig=p(3); r=p(4); k=1; 
xn=x+t*d;
pht=fun(xn);
while pht>ph0+t*sig*dph0 && k<=maxit
  t=r*t;
  xn=x+t*d;
  pht=fun(xn);
  k=k+1;
end
