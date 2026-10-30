function y=vel(s)
global a p v0 xtmp
tmp=2*p*(a'*vec_intphi(s))+v0^2;
if tmp<0
  save -v7 mirame.mat xtmp
  fprintf('UPSS\n'), pause
end
y=sqrt(2*p*(a'*vec_intphi(s))+v0^2);
end

