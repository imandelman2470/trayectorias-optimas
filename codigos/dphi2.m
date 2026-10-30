function y=dphi2(s,j)
global m
y(1)=0;
for k=1:m
  y(2*k+1)=-sin(2*pi*k*s)*2*pi*k;
  y(2*k)=cos(2*pi*k*s)*2*pi*k;
end
y=y(j);