function [f,Df]=fres4(x,der)
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
if d(1)
  for j=1:n
    G1(j,:)=simpson_vect((sum(Mdc.^2)-1).*Mphi(j,:),0,1);
    G7(j,:)=simpson_vect((((a'*Mphi).^2/mut^2+v.^4/(mun*p)^2).*sum(Md2c.^2)-g^2).*Mphi(j,:),0,1);
    G8(j,:)=simpson_vect((sum((p*Mc-alp).^2)-kappa.^2).*Mphi(j,:),0,1);
    G9(j,:)=simpson_vect((sum((p*Mc-bet).^2)-kappa.^2).*Mphi(j,:),0,1);
  end
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
      DG1a(j,k)=2*simpson_vect(Mphi(j,:).*Mdc(1,:).*Mdphi(k,:),0,1);
      DG1b(j,k)=2*simpson_vect(Mphi(j,:).*Mdc(2,:).*Mdphi(k,:),0,1);
      DG7a(j,k)=2*simpson_vect(1/mun^2*v.^4/p^2.*Md2c(1,:).*Mphi(j,:).*Md2phi(k,:),0,1);
      DG7b(j,k)=2*simpson_vect(1/mun^2*v.^4/p^2.*Md2c(2,:).*Mphi(j,:).*Md2phi(k,:),0,1);
      DG8a(j,k)=2*p*simpson_vect((p*Mc(1,:)-alp(1,:)).*Mphi(j,:).*Mphi(k,:),0,1);
      DG8b(j,k)=2*p*simpson_vect((p*Mc(2,:)-alp(2,:)).*Mphi(j,:).*Mphi(k,:),0,1);
      DG9a(j,k)=2*p*simpson_vect((p*Mc(1,:)-bet(1,:)).*Mphi(j,:).*Mphi(k,:),0,1);
      DG9b(j,k)=2*p*simpson_vect((p*Mc(2,:)-bet(2,:)).*Mphi(j,:).*Mphi(k,:),0,1);
    end
  end
%  DG2a=[(Mphi(:,1)-Mphi(:,end))';zeros(1,n)];
%  DG2b=[zeros(1,n);(Mphi(:,1)-Mphi(:,end))'];
%  DG5a=[(Mdphi(:,1)-Mdphi(:,end))';zeros(1,n)];
%  DG5b=[zeros(1,n);(Mdphi(:,1)-Mdphi(:,end))'];
%  DG6a=[(Md2phi(:,1)-Md2phi(:,end))';zeros(1,n)];
%  DG6b=[zeros(1,n);(Md2phi(:,1)-Md2phi(:,end))'];
  for j=1:n
    DG7d(j,1)=simpson_vect(4/(p*mun^2)*v.*sum(Md2c.^2).*Mphi(j,:).*(a'*Mintphi),0,1);
    DG7e(j,1)=v0*simpson_vect(4/mun^2*Mphi(j,:).*v.*sum(Md2c.^2),0,1);
    DG8d(j,1)=2*simpson_vect(sum((p*Mc-alp).*Mc).*Mphi(j,:),0,1);
    DG9d(j,1)=2*simpson_vect(sum((p*Mc-bet).*Mc).*Mphi(j,:),0,1);
  end   
  DG3c(1,:)=Mintphi(:,end)';
%  DG4c(1,:)=(Mphi(:,1)-Mphi(:,end))';
  for j=1:n   
    for i=1:n
      DG7c(j,i)=simpson_vect(2/mut^2*Mphi(j,:).*(a'*Mphi).*Mphi(i,:)+4/(p*mun^2)*v.*sum(Md2c.^2).*Mphi(j,:).*Mintphi(i,:),0,1);
    end
  end
  Df=[DG1a,DG1b,DG1c,DG1d,DG1e;DG3a,DG3b,DG3c,DG3d,DG3e;DG7a,DG7b,DG7c,DG7d,DG7e;DG8a,DG8b,DG8c,DG8d,DG8e;DG9a,DG9b,DG9c,DG9d,DG9e];
%  Df=sparse(Df);
end

