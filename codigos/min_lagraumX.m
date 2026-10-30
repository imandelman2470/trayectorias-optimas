function [x,mu,err,k,salida]=min_lagraumX(fobj,fres,I,x,mu,PrX,parmet,metsubpr,parsubpr)
% ejecutar [x,mu,err,k,salida]=min_lagraumX(fobj,fres,I,x0,mu0,PrX)
%        o [x,mu,err,k,salida]=min_lagraumX(fobj,fres,I,x0,mu0,PrX,parmet)
%        o [x,mu,err,k,salida]=min_lagraumX(fobj,fres,I,x0,mu0,PrX,parmet,metsubpr)
%        o [x,mu,err,k,salida]=min_lagraumX(fobj,fres,I,x0,mu0,PrX,parmet,metsubpr,parsubpr)
%
% donde parmet(1)=cantidad maxima de iteraciones (default=100)
%       parmet(2)=tolerancia de error del sistema KKT (default=1e-7)
%       parmet(3)=infactibilidad permitida, \in (0,1) (default=0.9)
%       parmet(4)=aumento de penalizacion, >1 (default=10)
%       metsubpr=metodo para resolver el subproblema (default=@min_gradPr)
%       parsubpr=parametros para el solver del subproblema
%
% salida=0, residuo menor que tolerancia.
% salida=1, maximo de iteraciones alcanzado.
% salida>10, error al resolver el subproblema.

pm=[100,1e-6,0.9,10]; minsub=@min_gradPr; parsub=[100,1e-6,1];
if nargin>=7, pm(1:length(parmet))=parmet; end
if nargin>=8&&~isempty(metsubpr), minsub=metsubpr; end
if nargin==9, parsub(1:length(parsubpr))=parsubpr; end
maxit=pm(1); tol=pm(2); gam=pm(3); bet=pm(4); c=1000;
global parlagraum
parlagraum.f=fobj; parlagraum.g=fres; parlagraum.I=I;
parlagraum.mu=mu; parlagraum.c=c;

x=PrX(x);

ST=dbstack; fid=1; %para imprimir

[~,df]=fobj(x,[0,1]); [g,dg]=fres(x,[1,1]); errest=mu;
errest(~I)=g(~I); errest(I)=max(0,mu(I)+g(I))-mu(I);
err=norm([PrX(x-(df+dg'*mu))-x;errest]);
err2v=norm(errest); minsig=err; err0=err;
for k=0:maxit
	if err<tol+tol*err0
		salida=0;
		fprintf(fid,'%s\\',ST(end:-1:1).name)
		fprintf(fid,'salida=%d\n',salida)
		return
	end
	[x,La,err1,ki,salidai]=minsub(@f_Lagraum,x,PrX,parsub);
  fprintf(fid,'%s\\',ST(end:-1:1).name)
	fprintf(fid,'misnsub: ki=%d, erri=%e\n',ki,err1)
	if salidai>=1
		salida=10*salidai;
		k=[k,ki];
		return
	end
	mu=parlagraum.mun; g=parlagraum.vg;
	errest(~I)=g(~I); errest(I)=max(0,mu(I)+g(I))-mu(I);
	err2=norm(errest);
	err=sqrt(err1^2+err2.^2);
	if err2>gam*err2v & err>gam*minsig
		c=bet*c;
    fprintf(fid,'%s\\',ST(end:-1:1).name)
		fprintf(fid,'penalizacion: c=%e\n',c)
	end
	err2v=err2; minsig=min(minsig,err);
  fprintf(fid,'%s\\',ST(end:-1:1).name)
	fprintf(fid,'error=%e, minsig=%e\n',err,minsig)
	parlagraum.mu=mu; parlagraum.c=c;
end
salida=1;

