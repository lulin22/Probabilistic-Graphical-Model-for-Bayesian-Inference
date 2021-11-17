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
end g=zeros(1,N); ms=zeros(1,N); ms(N)=s(N); vs=zeros(1,N); vs(N)=P(N); for t=N-1:-1:2
g(t)=P(t)*A/Pp(t+1); ms(t)=s(t)+g(t)*(ms(t+1)-xp(t+1)); vs(t)=P(t)-g(t)^2*(Pp(t+1)-vs(t+1));
end

t=1:N;
plot(t,x,'c',t,s,'b',t,ms,'--r')
title('Estimation by Kalman Filter and RTS Smoother') legend('Truth','Filter','Smoother')
