function [f,Df]=fres3(x,der)
global m n g mun mut alp bet kappa Mpsi Mphi Mintphi Mdpsi Md2psi %vienen del principal
global c1 c2 a p v0 %necesarias para subfunciones
global xtmp
xtmp=x;
f=[]; Df=[];
c1=x(1:2*n-1); c2=x(2*n:4*n-2); a=x(4*n-1:4*n-2+m); p=x(4*n-1+m); v0=x(4*n+m);
d(1)=true; d(2)=false;
if nargin>1, d(1:length(der))=logical(der); end
j=1:m; s=(j-1)/(m-1);
Mc=[c1';c2']*Mpsi;
Mdc=[c1';c2']*Mdpsi;
Md2c=[c1';c2']*Md2psi;
v=sqrt(2*p*a'*Mintphi+v0^2);
if d(1)
  for j=1:m
    G1(j,:)=simpson_vect((sum(Mdc.^2)-1).*Mphi(j,:),0,1);
    G7(j,:)=simpson_vect((((a'*Mphi).^2/mut^2+v.^4/(mun*p)^2).*sum(Md2c.^2)-g^2).*Mphi(j,:),0,1);
    G8(j,:)=simpson_vect((sum((p*Mc-alp).^2)-kappa.^2).*Mphi(j,:),0,1);
    G9(j,:)=simpson_vect((sum((p*Mc-bet).^2)-kappa.^2).*Mphi(j,:),0,1);
  end
  G2=Mc(:,1)-Mc(:,end);
  G3=a'*Mintphi(:,end);
  G4=a'*(Mphi(:,1)-Mphi(:,end));
  G5=Mdc(:,1)-Mdc(:,end);
  G6=Md2c(:,1)-Md2c(:,end);
  f=[G1;G2;G3;G4;G5;G6;G7;G8;G9];
end
if d(2)
  DG1c=zeros(m,m);
  DG1d=zeros(m,1);
  DG1e=zeros(m,1);
  DG2c=zeros(2,m);
  DG2d=[0;0];
  DG2e=[0;0];
  DG3a=zeros(1,2*n-1);
  DG3b=zeros(1,2*n-1);
  DG3d=0;
  DG3e=0;
  DG4a=zeros(1,2*n-1);
  DG4b=zeros(1,2*n-1);
  DG4d=0;
  DG4e=0;
  DG5c=zeros(2,m);
  DG5d=[0;0];
  DG5e=[0;0];
  DG6c=zeros(2,m);
  DG6d=[0;0];
  DG6e=[0;0];
  DG8c=zeros(m,m);
  DG8e=zeros(m,1); 
  DG9c=zeros(m,m);
  DG9e=zeros(m,1);
  for j=1:m
    for k=1:2*n-1
      DG1a(j,k)=2*simpson_vect(Mphi(j,:).*Mdc(1,:).*Mdpsi(k,:),0,1);
      DG1b(j,k)=2*simpson_vect(Mphi(j,:).*Mdc(2,:).*Mdpsi(k,:),0,1);
      DG7a(j,k)=2*simpson_vect(1/mun^2*v.^4/p^2.*Md2c(1,:).*Mphi(j,:).*Md2psi(k,:),0,1);
      DG7b(j,k)=2*simpson_vect(1/mun^2*v.^4/p^2.*Md2c(2,:).*Mphi(j,:).*Md2psi(k,:),0,1);
      DG8a(j,k)=2*p*simpson_vect((p*Mc(1,:)-alp(1,:)).*Mphi(j,:).*Mpsi(k,:),0,1);
      DG8b(j,k)=2*p*simpson_vect((p*Mc(2,:)-alp(2,:)).*Mphi(j,:).*Mpsi(k,:),0,1);
      DG9a(j,k)=2*p*simpson_vect((p*Mc(1,:)-bet(1,:)).*Mphi(j,:).*Mpsi(k,:),0,1);
      DG9b(j,k)=2*p*simpson_vect((p*Mc(2,:)-bet(2,:)).*Mphi(j,:).*Mpsi(k,:),0,1);
    end
  end
  DG2a=[(Mpsi(:,1)-Mpsi(:,end))';zeros(1,2*n-1)];
  DG2b=[zeros(1,2*n-1);(Mpsi(:,1)-Mpsi(:,end))'];
  DG5a=[(Mdpsi(:,1)-Mdpsi(:,end))';zeros(1,2*n-1)];
  DG5b=[zeros(1,2*n-1);(Mdpsi(:,1)-Mdpsi(:,end))'];
  DG6a=[(Md2psi(:,1)-Md2psi(:,end))';zeros(1,2*n-1)];
  DG6b=[zeros(1,2*n-1);(Md2psi(:,1)-Md2psi(:,end))'];
  for j=1:m
    DG7d(j,1)=simpson_vect(4/(p*mun^2)*v.*sum(Md2c.^2).*Mphi(j,:).*(a'*Mintphi),0,1);
    DG7e(j,1)=v0*simpson_vect(4/mun^2*Mphi(j,:).*v.*sum(Md2c.^2),0,1);
    DG8d(j,1)=2*simpson_vect(sum((p*Mc-alp).*Mc).*Mphi(j,:),0,1);
    DG9d(j,1)=2*simpson_vect(sum((p*Mc-bet).*Mc).*Mphi(j,:),0,1);
  end   
  DG3c(1,:)=Mintphi(:,m)';
  DG4c(1,:)=(Mphi(:,1)-Mphi(:,end))';
  for j=1:m    
    for i=1:m
      DG7c(j,i)=simpson_vect(2/mut^2*Mphi(j,:).*(a'*Mphi).*Mphi(i,:)+4/(p*mun^2)*v.*sum(Md2c.^2).*Mphi(j,:).*Mintphi(i,:),0,1);
    end
  end
  Df=[DG1a,DG1b,DG1c,DG1d,DG1e;DG2a,DG2b,DG2c,DG2d,DG2e;DG3a,DG3b,DG3c,DG3d,DG3e;DG4a,DG4b,DG4c,DG4d,DG4e;DG5a,DG5b,DG5c,DG5d,DG5e;DG6a,DG6b,DG6c,DG6d,DG6e;DG7a,DG7b,DG7c,DG7d,DG7e;DG8a,DG8b,DG8c,DG8d,DG8e;DG9a,DG9b,DG9c,DG9d,DG9e];
  Df=sparse(Df);
end

