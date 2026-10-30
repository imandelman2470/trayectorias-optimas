function [f,Df]=fres6(x,der)
global m n g mun mut alp bet kappa Mphi Mintphi Mdphi Md2phi %vienen del principal
global c1 c2 a p v0 %necesarias para subfunciones
save -v7 xtmp.mat x
f=[]; Df=[];
c1=x(1:n); c2=x(n+1:2*n); a=x(2*n+1:3*n); p=x(end-1); v0=x(end);
d(1)=true; d(2)=false;
if nargin>1, d(1:length(der))=logical(der); end
j=1:n; s=(j-1)/(n-1);
Mc=[c1';c2']*Mphi;
Mdc=[c1';c2']*Mdphi;
Md2c=[c1';c2']*Md2phi;
v=sqrt(2*p*a'*Mintphi+v0^2);
vcuad=2*p*a'*Mintphi+v0^2;
if d(1)
G1=(sum(Mdc.^2)-1)';
G7=(((a'*Mphi).^2/mut^2+vcuad.^2/(mun*p)^2).*sum(Md2c.^2)-g^2)';
G8=(sum((p*Mc-alp).^2)-kappa.^2)';
G9=(sum((p*Mc-bet).^2)-kappa.^2)';
%  G2=Mc(:,1)-Mc(:,end);
  G3=a'*Mintphi(:,end);
%  G4=a'*(Mphi(:,1)-Mphi(:,end));
%  G5=Mdc(:,1)-Mdc(:,end);
%  G6=Md2c(:,1)-Md2c(:,end);
  f=[G1;G3;G7;G8;G9];
end
if d(2)
  DG1c=zeros(n,n);
  DG1d=zeros(n,1);
  DG1e=zeros(n,1);
%  DG2c=zeros(2,n);
%  DG2d=[0;0];
%  DG2e=[0;0];
  DG3a=zeros(1,n);
  DG3b=zeros(1,n);
  DG3d=0;
  DG3e=0;
%  DG4a=zeros(1,n);
%  DG4b=zeros(1,n);
%  DG4d=0;
%  DG4e=0;
%  DG5c=zeros(2,n);
%  DG5d=[0;0];
%  DG5e=[0;0];
%  DG6c=zeros(2,n);
%  DG6d=[0;0];
%  DG6e=[0;0];
  DG8c=zeros(n,n);
  DG8e=zeros(n,1); 
  DG9c=zeros(n,n);
  DG9e=zeros(n,1);
  for j=1:n
    for k=1:n
      DG1a(j,k)=2*Mdc(1,j).*Mdphi(k,j);
      DG1b(j,k)=2*Mdc(2,j).*Mdphi(k,j);
      DG7a(j,k)=2*1/mun^2*vcuad(j).^2/p^2.*Md2c(1,j).*Md2phi(k,j);
      DG7b(j,k)=2*1/mun^2*vcuad(j).^2/p^2.*Md2c(2,j).*Md2phi(k,j);
      DG8a(j,k)=2*p*(p*Mc(1,j)-alp(1,j)).*Mphi(k,j);
      DG8b(j,k)=2*p*(p*Mc(2,j)-alp(2,j)).*Mphi(k,j);
      DG9a(j,k)=2*p*(p*Mc(1,j)-bet(1,j)).*Mphi(k,j);
      DG9b(j,k)=2*p*(p*Mc(2,j)-bet(2,j)).*Mphi(k,j);
    end
  end
%  DG2a=[(Mphi(:,1)-Mphi(:,end))';zeros(1,n)];
%  DG2b=[zeros(1,n);(Mphi(:,1)-Mphi(:,end))'];
%  DG5a=[(Mdphi(:,1)-Mdphi(:,end))';zeros(1,n)];
%  DG5b=[zeros(1,n);(Mdphi(:,1)-Mdphi(:,end))'];
%  DG6a=[(Md2phi(:,1)-Md2phi(:,end))';zeros(1,n)];
%  DG6b=[zeros(1,n);(Md2phi(:,1)-Md2phi(:,end))'];
  for j=1:n
    DG7d(j,1)=1/(p^2*mun^2)*vcuad(j).*sum(Md2c(:,j).^2).*(-2*vcuad(j)/p+4*(a'*Mintphi(:,j)));
    DG7e(j,1)=v0*4/mun^2.*vcuad(j).*sum(Md2c(:,j).^2);
    DG8d(j,1)=2*sum((p*Mc(:,j)-alp(:,j)).*Mc(:,j));
    DG9d(j,1)=2*sum((p*Mc(:,j)-bet(:,j)).*Mc(:,j));
  end   
  DG3c(1,:)=Mintphi(:,end)';
%  DG4c(1,:)=(Mphi(:,1)-Mphi(:,end))';
  for j=1:n   
    for i=1:n
      DG7c(j,i)=2/mut^2*(a'*Mphi(:,j)).*Mphi(i,j)+4/(p*mun^2)*vcuad(j).*sum(Md2c(:,j).^2).*Mintphi(i,j);
    end
  end
  Df=[DG1a,DG1b,DG1c,DG1d,DG1e;DG3a,DG3b,DG3c,DG3d,DG3e;DG7a,DG7b,DG7c,DG7d,DG7e;DG8a,DG8b,DG8c,DG8d,DG8e;DG9a,DG9b,DG9c,DG9d,DG9e];
%  Df=sparse(Df);
end

