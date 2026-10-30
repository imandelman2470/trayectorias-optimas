function y=phi2(s,j)
global m
y(1)=0.5;
for k=1:m
  y(2*k+1)=cos(2*pi*k*s);
  y(2*k)=sin(2*pi*k*s);
end
y=y(j);