function [L,dL]=f_Lagraum(x,der)
% ejecutar [f,df]=f_Lagraum(mu)
% Lagrangiana aumentada para (mu,c) fijo, asociada a
% minimizar f(x) s.a g_i(x)=0, i \notin I; g_i(x)\leq 0, i \in I. 
global parlagraum
L=[]; dL=[]; d=[true,false];
if nargin>1, d(1:length(der))=der; end
f_f=parlagraum.f; f_g=parlagraum.g;
mu=parlagraum.mu; c=parlagraum.c; I=parlagraum.I;
[f,df]=f_f(x,d); [g,dg]=f_g(x,[1,d(2)]); mun=mu;
mun(~I)=mu(~I)+c*g(~I);
mun(I)=max(0,mu(I)+c*g(I));
parlagraum.mun=mun;
parlagraum.vg=g;
if d(1)
   L=f+0.5*(sum(mun.^2)-sum(mu.^2))/c;
end
if d(2)
  dL=df+dg'*mun;
end
