function y=phi(s,j)
global m
sj=(j-1)/(m-1);
sjm=(j-2)/(m-1);
sjp=j/(m-1);
y=(m-1)*(s-sjm).*(s>=sjm & s<sj)+(m+1)*(sjp-s).*(s>=sj & s<sjp);

