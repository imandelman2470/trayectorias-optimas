function y=aphi(s)
global m a
for i=1:m
  tmp(i)=intphi(s,i);
end  
y=a'*tmp;
end
  