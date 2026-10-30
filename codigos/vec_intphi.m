function tmp=vec_intphi(s)
global m
tmp=zeros(m,1);
for i=1:m
	tmp(i)=intphi(s,i);
end

