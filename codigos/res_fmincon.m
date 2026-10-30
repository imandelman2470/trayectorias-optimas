function [c,ceq]=res_fmincon(x)
global n
c=fres5(x);
ceq=c(1:n+1); c=c(n+1:end);

