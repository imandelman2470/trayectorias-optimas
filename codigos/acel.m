function y=acel(s)
global a m
for i=1:m
  fi(i)=phi(s,i);
end
y=a'*fi;