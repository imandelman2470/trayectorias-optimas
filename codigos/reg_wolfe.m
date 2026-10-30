function [xn,alpha,k]=reg_wolfe(fun,x,d,ph0,dph0,param)
% ejecutar [xn,alpha,k]=reg_wolfe(fun,x,d,ph0,dph0)
%        o [xn,alpha,k]=reg_wolfe(fun,x,d,ph0,dph0,param)
% donde param(1)=cantidad maxima de iteraciones (default=100)
%       param(2)=valor del paso inicial (default=1)
%       param(3)=constante de Armijo \sigma en (0,1) (default=1e-4)
%       param(4)=constante de Wolfe \tau en (\sigma,1) (default=0.9)
%       param(5)=factor de reduccion r en (0,1) (default=0.5)
%       param(6)=factor de expansion s>1 (default=2)
p=[100; 1; 1e-4; 0.9; 0.5; 2];
if nargin>5, p(1:length(param))=param; end
maxit=p(1); alpha=p(2); sigma=p(3); tau=p(4); beta=p(5); rho=p(6);
k=1; alphal=0; alphau=0;
for k=1:maxit
  xn=x+alpha*d;
  pht=fun(xn);
  if pht>ph0 + alpha*sigma*dph0
    alphau=alpha;
    alpha=(1-beta)*alphal+beta*alphau;
  else
    [~,dfxn]=fun(xn,[0,1]); dpht=dfxn'*d;
    if dpht<tau*dph0
      alphal=alpha;
      if alphau>0
        alpha=(1-beta)*alphal+beta*alphau;
      else
        alpha=rho*alpha;
      end
    else
      return
    end
  end
end
