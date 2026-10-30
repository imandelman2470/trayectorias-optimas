function y=d2phi2(s,j)
global m
y(1)=0;
for k=1:m
  y(2*k+1)=-cos(2*pi*k*s)*4*pi^2*k^2;
  y(2*k)=-sin(2*pi*k*s)*4*pi^2*k^2;
end
y=y(j);