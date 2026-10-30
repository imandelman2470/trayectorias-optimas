function s=simpson_vect(y,a,b)
%Aproxima la integral entre a=x_1 y b=x_n de y_i=f(x_i)
%usando la Regla de Simpson compuesta
n=length(y);
if mod(n,2)==0
	s=[];
	disp('la cantidad de puntos debe ser impar')
	return
end
h=(b-a)/(n-1); %x_i=a+(i-1)*h, i=1:n
s=h/3*(y(1)+2*sum(y(3:2:n-2))+4*sum(y(2:2:n-1))+y(n));

