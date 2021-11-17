clear all;
close all;
N=100; u=normrnd(0,0.5,[1,N]); u(1)=0;
A=0.7;
x(1)=0;
for t=2:N
x(t)=A*x(t-1)+u(t); end
v=normrnd(0,0.1,[1,N]); R=std(v)^2;
Q=std(u)^2;
H=1;
Y=H*x+v;
P(1)=0;
Pp(1)=0;
xp(1)=0;
s(1)=0;
Kg(1)=0;
for t=2:N
xp(t)=A*s(t-1); Pp(t)=A^2*P(t-1)+Q; kg(t)=H*Pp(t)/(H^2*Pp(t)+R); s(t)=xp(t)+kg(t)*(Y(t)-H*xp(t)); P(t)=Pp(t)-H*kg(t)*Pp(t);
end
t=1:N;
plot(t,s,'b',t,x,'c',t,Y,'*') title('Estimation by Kalman Filter'); legend('Filter','Truth', 'Data')
