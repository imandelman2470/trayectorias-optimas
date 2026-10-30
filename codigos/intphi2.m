function y=intphi2(s,j)
global m
y(1)=0.5*s;
for k=1:m
  y(2*k+1)=sin(2*pi*k*s)/(2*pi*k);
  y(2*k)=-cos(2*pi*k*s)/(2*pi*k)+1/(2*pi*k);
end
y=y(j);

%y=quad(@(t) phi2(t,j),0,s);
