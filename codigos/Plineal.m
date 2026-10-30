function [Y,DY]=Plineal(x,der)
global m n g mun mut alp bet kappa Mpsi Mphi Mintphi Mdpsi Md2psi %vienen del principal
global c1 c2 a p v0 %necesarias para subfunciones
global xtmp
xtmp=x;
d(1)=true; d(2)=false;
if nargin>1, d(1:length(der))=logical(der); end
c1=x(1:2*n-1); c2=x(2*n:4*n-2); a=x(4*n-1:4*n-2+m); p=x(4*n-1+m); v0=x(4*n+m);
Apsi=Mpsi(:,1)-Mpsi(:,end);
Adpsi=Mdpsi(:,1)-Mdpsi(:,end);
Ad2psi=Md2psi(:,1)-Md2psi(:,end);
Aphi=Mphi(:,1)-Mphi(:,end);
M=[Apsi',zeros(1,2*n-1),zeros(1,m),0,0;
zeros(1,2*n-1),Apsi',zeros(1,m),0,0;
zeros(1,2*n-1),zeros(1,2*n-1),Mintphi(:,end)',0,0;
zeros(1,2*n-1),zeros(1,2*n-1),Aphi',0,0;
Adpsi',zeros(1,2*n-1),zeros(1,m),0,0;
zeros(1,2*n-1),Adpsi',zeros(1,m),0,0;
Ad2psi',zeros(1,2*n-1),zeros(1,m),0,0;
zeros(1,2*n-1),Ad2psi',zeros(1,m),0,0];
if d(1)
Y=M*x;
end
if d(2)
DY=M;
end

