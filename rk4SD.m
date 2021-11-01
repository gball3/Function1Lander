function [tn,un] = rk4SD(T,N,ui)
%ui= state vector initial conditions
%T: Time of simulation [s]
%N: Steps of simulation []
dt=T/N;  %time step [s]
un= zeros(N+1,6);
tn= zeros(N+1,1);
param= getparam(5.972*10^24, 100,6371000, 0, 0)
%sets initial conditions
tn(1)=0
un(1,1)= ui(1); % x [m]
un(1,2)= ui(2); % y [m]
un(1,3)= ui(3); % z [m]
un(1,4)= ui(4); % xdot
un(1,5)= ui(5); % ydot
un(1,6)= ui(6); % zdot

for n= 1:N
i=n    
 tn(n+1) = tn(n) + dt;
     
     k1=func2(un(n,:),tn(n));
     k2=func2(un(n,:)+.5.*k1*dt,tn(n)+.5*dt);
     k3=func2(un(n,:)+.5.*k2*dt,tn(n)+.5*dt);
     k4=func2(un(n,:)+k3*dt,tn(n)+dt);
      
un(n+1,:)=un(n,:)+(1/6).*(k1+2*k2+2*k3+k4).*dt;

end

end

