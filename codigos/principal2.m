clear all
more off
global m n g mun mut alp bet kappa Mphi Mintphi Mpsi Mdphi Md2phi
global c1 c2
%dimension de discretizacion
m=56;
n=2*m+1;
%n=121
%ctes de rozamiento
mun=2.7;
mut=2.7;
g=9.81;
%discretizacion de funciones de calzada de la pista (dim=m)
%j=1:n; s=(j-1)/(m-1);
j=1:n; s=(j-1)/(n-1);
%%%pista circular
cc=cos(2*pi*s); ss=sin(2*pi*s); 
alp=250*[cc;ss];
bet=1.5*alp;
%kappa=0.5*ones(1,n);
kappa=sqrt(sum((bet-alp).^2));
%carga de matrices globales
k=(1:m)';
Mphi(2*k+1,:)=cos(2*pi*k*s); Mphi(2*k,:)=sin(2*pi*k*s); Mphi(1,:)=0.5;
Mdphi(2*k+1,:)=-2*pi*repmat(k,1,n).*sin(2*pi*k*s); Mdphi(2*k,:)=2*pi*repmat(k,1,n).*cos(2*pi*k*s); Mdphi(1,:)=0;
Md2phi(2*k+1,:)=-(2*pi)^2*repmat(k.^2,1,n).*cos(2*pi*k*s); Md2phi(2*k,:)=-(2*pi)^2*repmat(k.^2,1,n).*sin(2*pi*k*s); Md2phi(1,:)=0;
Mintphi(2*k+1,:)=1./(2*pi*repmat(k,1,n)).*sin(2*pi*k*s); Mintphi(2*k,:)=1./(2*pi*repmat(k,1,n)).*(1-cos(2*pi*k*s)); Mintphi(1,:)=0.5*s;

%global qSimp
qSimp=ones(n,1); qSimp(3:2:n-2)=2; qSimp(2:2:n-1)=4; qSimp=qSimp/(3*(n-1));
%for j=1:n
%  for i=1:n   
%    Mphi(i,j)=phi2(s(j),i);
%    Mintphi(i,j)=intphi2(s(j),i);   
%    Mdphi(i,j)=dphi2(s(j),i);
%    Md2phi(i,j)=d2phi2(s(j),i);
%  end
%end

%for j=1:m
%  for i=1:m    
%    Mphi(i,j)=phi(s(j),i);
%    Mintphi(i,j)=intphi(s(j),i);
%  end   
%  for k=1:2*n-1
%    Mpsi(k,j)=psi(s(j),(k+1)/2);
%    Mdpsi(k,j)=dpsi(s(j),(k+1)/2);
%    Md2psi(k,j)=d2psi(s(j),(k+1)/2);
%  end
%end
%vector inicial
gam=0.5*alp+0.5*bet;
dgam(1,:)=diff(gam(1,:))./diff(s); dgam(2,:)=diff(gam(2,:))./diff(s); dgam=[dgam,dgam(:,1)];
%longgam=simpson_vect(sqrt(dgam(1,:).^2+dgam(2,:).^2),0,1);
longgam=sqrt(dgam(1,:).^2+dgam(2,:).^2)*qSimp;
b=[gam(1,:)';gam(2,:)';dgam(1,:)';dgam(2,:)']/longgam;
A=[kron(eye(2),Mphi');kron(eye(2),Mdphi')];
tmp=A\b;
c1=tmp(1:n); c2=tmp(n+1:2*n);
a=zeros(n,1);
p=longgam;
v0=sqrt(g*mun*p/max(sqrt((Md2phi'*c1).^2+(Md2phi'*c2).^2)));
x0=[c1;c2;a;p;v0];
lb=-inf(size(x0)); lb(end-1:end)=0;
ub=inf(size(x0));

%I(1:n+1,1)=false;
%I(n+2:4*n+1,1)=true;
%mu0=zeros(4*n+1,1);

%for j=1:m
%  Mdc(:,j)=dc(s(j));
%end
%
%for j=1:m
%  G1(j,:)=simpson_vect((sum(Mdc.^2)-1).*Mphi(j,:),0,1);
%end
%G1
%G=fres5(x0);
%return
%% SQP Octave
%sqpobj={@(x)fobj2(x),@(x)sqpDobj(x)};
%sqpobj=@(x)fobj4(x);
%sqpg={@(x)fres2(x)(1:m+8),@(x)sqpDg(x)};
%sqpg=@(x)fres4(x)(1:n+1);
%sqph={@(x)-fres2(x)(m+9:4*m+8),@(x)sqpDh(x)};
%sqph=@(x)-fres4(x)(n+2:3*n+1);
%[X,OBJ,INFO,ITER,NF,LAMBDA]=sqp(x0,sqpobj,sqpg,sqph,lb,ub)
%[x,mu,err,k,salida]=min_lagraumX(@fobj4,@fres5,I,x0,mu0,@Pr_C);
%[Y,DY]=Plineal(x0,[1,1]);
%[x,mu,err,k,salida]=min_lagraum(@fobj4,@fres5,I,x0,mu0)
%op=optimoptions('fmincon','GradObj','off','GradConstr','off','Display','iter','Algorithm','sqp'); %Matlab
%op=optimoptions('fmincon','GradObj','on','GradConstr','on','Display','iter','Algorithm','active-set','DerivativeCheck','off','MaxIter',1000); %Matlab
op=optimoptions('fmincon','GradObj','on','GradConstr','on','Display','iter','Algorithm','sqp','DerivativeCheck','off','MaxFunEvals',10000,'MaxIter',1000); %Matlab
%alp=alp'; bet=bet'; kappa=kappa';
X=fmincon(@obj_fmincon,x0,[],[],[],[],lb,ub,@res_fmincon,op); %matlab
%[x,mu,err,k,salida]=min_sqp(@fobj4,@fres5,I,x0,mu0)
%alp=alp'; bet=bet'; kappa=kappa';
%%%%%%%%% GRAFICAR
c1=X(1:n); c2=X(n+1:2*n); a=X(2*n+1:3*n); p=X(end-1); v0=X(end);
cc1=Mphi'*c1; cc2=Mphi'*c2;
cv2=2*p*(Mintphi'*a)+v0^2; ca=Mphi'*a;
cc10=Mphi'*x0(1:n); cc20=Mphi'*x0(n+1:2*n); a0=x0(2*n+1:3*n); p0=x0(end-1); v00=x0(end);
cv02=2*p0*(Mintphi'*a0)+v00^2; ca0=Mphi'*a0;
figure
plot(p0*cc10,p0*cc20,'.-g')
hold on
plot(p*cc1,p*cc2,'.-r')
plot(alp(1,:),alp(2,:),'b',bet(1,:),bet(2,:),'b')
hold off
figure, plot(sqrt(cv2),'r'), hold on, plot(sqrt(cv02),'g'), title('velocidad'), hold off
figure, plot(ca,'r'), hold on, plot(ca0,'g'), title('aceleracion'), hold off

