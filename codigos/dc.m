function y=dc(s)
global c1 c2 n
y=[0;0];
for k=1:2*n-1
  y=y+[c1(k);c2(k)]*dpsi(s,(k+1)/2);
end

