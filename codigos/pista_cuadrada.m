cc=cos(2*pi*s); ss=sin(2*pi*s); 
rmax=max(abs(cc'),abs(ss'));
alp=250*[cc'./rmax,ss'./rmax];
bet=1.2*alp;

