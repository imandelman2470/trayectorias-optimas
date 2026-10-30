function out=intphi(s,j)
global m
sj=(j-1)/(m-1);
sjm=(j-2)/(m-1);
sjp=j/(m-1);
if j==1
  out=(1/(2*(m-1))-(m-1)/2*(sjp-s).^2.*(s<sjp)).*(sj<=s);
elseif j==m
  out=(m-1)/2*(s-sjm).^2.*(sjm<=s&s<sj)+1/(2*(m-1)).*(sj<=s);
else
  out=(m-1)/2*(s-sjm).^2.*(sjm<=s&s<sj)+(1/(m-1)-(m-1)/2*(sjp-s).^2.*(s<sjp)).*(sj<=s);
end

