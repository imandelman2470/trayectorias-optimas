function y=dpsi(s,j)
global n
if j-round(j)==0
	sj=(j-1)/(n-1);
	sjm=(j-2)/(n-1);
	sjp=j/(n-1);
	y=(3*(n-1)+4*(n-1)^2*(s-sj)).*(s>=sjm & s<sj)+(-3*(n-1)+4*(n-1)^2*(s-sj)).*(s>=sj & s<sjp);
else
	sj=(j-1)/(n-1);
	sjm=(j-1.5)/(n-1);
	sjp=(j-0.5)/(n-1);
	y=(-8*(n-1)^2*(s-sj)).*(s>=sjm & s<sjp);
end

