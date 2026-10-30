function P=Pr_C(z)
% ejecutar P=Pr_C(z)
% calcula la proyeccion de z en C
% con p \geq 0, v_0 \geq 0
P=z; P(end-1:end)=max(0,P(end-1:end));

