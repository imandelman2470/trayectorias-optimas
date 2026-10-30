cc1=Mphi'*c1; cc2=Mphi'*c2;
cv2=2*p*(Mintphi'*a)+v0^2; ca=Mphi'*a;
cc10=Mphi'*x0(1:n); cc20=Mphi'*x0(n+1:2*n); a0=x0(2*n+1:3*n); p0=x0(end-1); v00=x0(end);
cv02=2*p0*(Mintphi'*a0)+v00^2; ca0=Mphi'*a0;
figure(1)
tmp=fill(bet(:,1) ,bet(:,2),'b');
set(tmp,'FaceColor',[0.93,0.93,0.93])
hold on
fill(alp(:,1) ,alp(:,2),'w')                         
plot(p0*cc10,p0*cc20,'-g','LineWidth',3)
plot(p*cc1,p*cc2,'-r','LineWidth',3)
%plot(alp(:,1),alp(:,2),'b',bet(:,1),bet(:,2),'b')
hold off
axis equal, axis off
tmpt=strcat('$\mu_n=$',num2str(mun),', $\mu_t=$',num2str(mut));
title(tmpt,'interpreter','latex')                             
figure(2), plot(sqrt(cv2),'r'), hold on, plot(sqrt(cv02),'g'), title('velocidad'), hold off
figure(3), plot(ca,'r'), hold on, plot(ca0,'g'), title('aceleracion'), hold off


