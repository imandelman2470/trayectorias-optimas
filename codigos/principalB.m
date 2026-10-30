clear all
more off
global m n g mun mut alp bet kappa qSimp Mphi Mintphi Mpsi Mdphi Md2phi
% dimension de discretizacion
m=56;
n=2*m+1; % siempre impar
% ctes de rozamiento
g=9.81;
mun=7;% 7;
mut=1.9;% 1.9;
% discretizacion de funciones de calzada de la pista (dim=n)
j=1:n; s=(j-1)/(n);
%%% cargar pista: pista_circular, pista_cuadrada, pista_irregular1, pista_irregular2
pista_irregular2
%%% ancho de pista
kappa=sqrt(sum((bet-alp).^2,2));
% carga de matrices globales
qSimp=ones(n,1); qSimp(3:2:n-2)=2; qSimp(2:2:n-1)=4; qSimp=qSimp/(3*(n-1));
k=(1:m)';
Mphi(2*k+1,:)=cos(2*pi*k*s); Mphi(2*k,:)=sin(2*pi*k*s); Mphi(1,:)=0.5;
Mdphi(2*k+1,:)=-2*pi*repmat(k,1,n).*sin(2*pi*k*s); Mdphi(2*k,:)=2*pi*repmat(k,1,n).*cos(2*pi*k*s);
Mdphi(1,:)=0;
Md2phi(2*k+1,:)=-(2*pi)^2*repmat(k.^2,1,n).*cos(2*pi*k*s); Md2phi(2*k,:)=-(2*pi)^2*repmat(k.^2,1,n).*sin(2*pi*k*s);
Md2phi(1,:)=0;
Mintphi(2*k+1,:)=1./(2*pi*repmat(k,1,n)).*sin(2*pi*k*s); Mintphi(2*k,:)=1./(2*pi*repmat(k,1,n)).*(1-cos(2*pi*k*s)); 
Mintphi(1,:)=0.5*s;
% punto inicial
gam=0.5*alp+0.5*bet;
dgam(:,1)=diff(gam(:,1))./diff(s'); dgam(:,2)=diff(gam(:,2))./diff(s'); dgam=[dgam;dgam(1,:)];
longgam=qSimp'*sqrt(dgam(:,1).^2+dgam(:,2).^2);
b=[gam(:);dgam(:)]/longgam;
A=[kron(eye(2),Mphi');kron(eye(2),Mdphi')];
tmp=A\b;
c1=tmp(1:n); c2=tmp(n+1:2*n);
a=zeros(n,1);
p=longgam;
v0=sqrt(g*mun*p/max(sqrt((Md2phi'*c1).^2+(Md2phi'*c2).^2)));
x0=[c1;c2;a;p;v0];
lb=-inf(size(x0)); lb(end-1:end)=0;
ub=inf(size(x0));
op=optimoptions('fmincon','GradObj','on','GradConstr','on','Display','iter','Algorithm','sqp','DerivativeCheck','off','MaxFunEvals',10000,'MaxIter',1000);
X=fmincon(@fobj_fmincon,x0,[],[],[],[],lb,ub,@fres_fmincon,op);
c1=X(1:n); c2=X(n+1:2*n); a=X(2*n+1:3*n); p=X(end-1); v0=X(end);

