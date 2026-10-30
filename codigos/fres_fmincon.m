function [c,ceq,dc,dceq]=fres_fmincon(x)
global m n g mun mut alp bet kappa Mphi Mintphi Mdphi Md2phi %vienen del principal
c1=x(1:n); c2=x(n+1:2*n); a=x(2*n+1:3*n); p=x(end-1); v0=x(end);
cc1=Mphi'*c1; dcc1=Mdphi'*c1; d2cc1=Md2phi'*c1;
cc2=Mphi'*c2; dcc2=Mdphi'*c2; d2cc2=Md2phi'*c2;
cv2=2*p*(Mintphi'*a)+v0^2; ca=Mphi'*a;
G1=dcc1.^2+dcc2.^2-1;
%G2-G4 vale por perioricidad de phi
G5=Mintphi(:,end)'*a; % cv(1)=v0 vale entonces
%G6 vale por perioricidad de phi
G7=ca.^2/mut^2 + cv2.^2/(mun*p)^2.*(d2cc1.^2+d2cc2.^2) - g^2;
G8=(p*cc1-alp(:,1)).^2 + (p*cc2-alp(:,2)).^2 -kappa.^2;
G9=(p*cc1-bet(:,1)).^2 + (p*cc2-bet(:,2)).^2 -kappa.^2;
ceq=[G1;G5]; c=[G7;G8;G9];
DG1=[2*diag(dcc1)*Mdphi',2*diag(dcc2)*Mdphi',zeros(n),zeros(n,1),zeros(n,1)];
DG5=[zeros(1,n),zeros(1,n),Mintphi(:,end)',0,0];
DG7=[2*diag(cv2.^2/(mun*p)^2.*d2cc1)*Md2phi',2*diag(cv2.^2/(mun*p)^2.*d2cc2)*Md2phi',2*diag(ca/mut^2)*Mphi'+2*diag(cv2/(mun*p)^2.*(d2cc1.^2+d2cc2.^2))*(2*p*Mintphi'),diag(2*cv2/(mun*p)^2.*(d2cc1.^2+d2cc2.^2))*(2*Mintphi'*a)-2*cv2.^2/(mun^2*p^3).*(d2cc1.^2+d2cc2.^2),diag(2*cv2/(mun*p)^2.*(d2cc1.^2+d2cc2.^2))*(2*v0*ones(n,1))];
DG8=[diag(2*(p*cc1-alp(:,1)))*(p*Mphi'),diag(2*(p*cc2-alp(:,2)))*(p*Mphi'),zeros(n),diag(2*(p*cc1-alp(:,1)))*cc1+diag(2*(p*cc2-alp(:,2)))*cc2,zeros(n,1)];
DG9=[diag(2*(p*cc1-bet(:,1)))*(p*Mphi'),diag(2*(p*cc2-bet(:,2)))*(p*Mphi'),zeros(n),diag(2*(p*cc1-bet(:,1)))*cc1+diag(2*(p*cc2-bet(:,2)))*cc2,zeros(n,1)];
dceq=[DG1;DG5]'; dc=[DG7;DG8;DG9]';

