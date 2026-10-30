clear all
more off
global m n g mun mut alp bet kappa Mphi Mintphi Mpsi Mdpsi Md2psi
%dimension de discretizacion
n=51;
m=101;
%vector inicial
x0=[randn(2*n-1,1);randn(2*n-1,1);rand(m,1);rand;rand];
%ctes de rozamiento
mun=1;
mut=1;
g=9.81;
%discretizacion de funciones de calzada de la pista (dim=m)
j=1:m; s=(j-1)/(m-1);
cc=cos(s); ss=sin(s); 
alp=[cc;ss];
bet=1.5*[cc;ss];
kappa=0.5*ones(1,m);
%carga de matrices globales
for j=1:m
  for i=1:m    
    Mphi(i,j)=phi(s(j),i);
    Mintphi(i,j)=intphi(s(j),i);
  end   
  for k=1:2*n-1
    Mpsi(k,j)=psi(s(j),(k+1)/2);
    Mdpsi(k,j)=dpsi(s(j),(k+1)/2);
    Md2psi(k,j)=d2psi(s(j),(k+1)/2);
  end
end
I(1:m+8,1)=false;
I(m+9:4*m+9,1)=true;
mu0=zeros(4*m+9,1);
[x,mu,err,k,salida]=min_lagraum(@fobj2,@fres2,I,x0,mu0);

