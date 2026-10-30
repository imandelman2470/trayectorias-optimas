function [x,f,err,k,salida]=min_qnC(fun,x,paralg,regbl,parreg)
% ejecutar [x,f,err,k,salida]=min_qnC(fun,x0)
%        o [x,f,err,k,salida]=min_qnC(fun,x0,paralg)
%        o [x,f,err,k,salida]=min_qnC(fun,x0,paralg,regbl)
%        o [x,f,err,k,salida]=min_qnC(fun,x0,paralg,regbl,parregla)
%
% donde paralg(1)=cantidad maxima de iteraciones (default=100)
%       paralg(2)=tolerancia de error del gradiente (default=1e-7)
%       paralg(3)={1,2,3}, matriz QN inicial I (1), max(abs(f),1)*I (2), (p'*q)/(q'*q)*I (3) (default=2)
%       regbl=funcion regla de busqueda lineal (default=@reg_wolfe)
%       parregla=parametros para la regla escogida
%
% salida=0, gradiente menor que tolerancia.
% salida=1, maximo de iteraciones alcanzado.
% salida=2, matriz QN no definida positiva.
% salida=3, maximo de iteraciones en busqueda lineal.

pa=[100,1e-7,2,1]; regla=@reg_armijo; pr=100;
if nargin>=3, pa(1:length(paralg))=paralg; end
if nargin>=4&&~isempty(regbl), regla=regbl; end
if nargin==5, pr(1:length(parreg))=parreg; end
maxit=pa(1); tol=pa(2); kpo=0.2;
ST=dbstack; fid=1; %para imprimir
[f,df]=fun(x,[1,1]);
M=eye(length(x));
if pa(3)>1, M=max(abs(f),1)*M; end
if pa(3)==3
	d=-df;
	[x,t,ki]=regla(fun,x,d,f,df'*d,pr);
	[f,dfn]=fun(x,[1,1]); p=t*d; q=dfn-df;
	M=(p'*q)/(p'*p)*M; df=dfn;
end
err=norm(df);
if err<tol
	k=0; salida=0;
	return
end
err0=err;
for k=1:maxit
	d=-M\df; %calculo de direccion de descenso
	[x,t,ki]=regla(fun,x,d,f,df'*d,pr); %calculo del paso
	if ki>=pr(1)
		salida=3;
		return
	end
	[fn,dfn]=fun(x,[1,1]);
	err=norm(dfn);
	fprintf(fid,'%s\\',ST(end:-1:1).name)
	fprintf(fid,'k=%d, err=%e\n',k,err)
	if err<tol*err0+tol | abs(fn-f)<1e-17
		salida=0;
		return
	end
	p=t*d; q=dfn-df;
	pq=p'*q; Mp=M*p; tau=p'*Mp;
	if pq<kpo*tau %correccion de Powell, ver Bon.Gil.Lem.Sag.-Numer.Optim.(2ed) pag 328
		th=(1-kpo)*tau/(tau-pq);
		q=th*q+(1-th)*Mp;
		pq=kpo*tau;
	end
	M=M-Mp*Mp'/tau+q*q'/pq; %actualizacion BFGS
	df=dfn; f=fn;
	if rcond(M)<eps
		M=max(abs(f),1)*eye(length(x));
	end

end
salida=1;
