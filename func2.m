 function [f]  = func2(u,t)
% u=[x-pos,y-pos,z-pos,x-vel,y-vel,z-vel]
% t is time 
param= getparam(5.972*10^24, 100,6371000, 0, 0);
x= u(1); y= u(2); z= u(3); % position [m]
vx= u(4); vy= u(5); vz=u(6); % velocity [m/s]
posvector= [x,y,z]; % position vector [m]
posmag= norm(posvector); % magnitude of position scaler [m]
velvector= [vx,vy,vz]; % velocity vector [m/s]
velmag= norm(velvector); % velocity magnitude scaler [m/s]
spherical_rho= norm(posvector); % rho value of sperical coordinates (rho, theta, phi) [m]
altitude = spherical_rho-param.R; % altitude of spacecraft [m]

%massatinstant=param.mi-(t*param.mdot) %the instantaneous mass at time t [kg]

g=(param.G*param.Mass)/spherical_rho^2; % gravitational acceleration for individual central body [m/s^2]

%rho= ((param.Psurf*param.MM)/(param.Runiversal*param.Tsurf))*(1-((param.lamt*altitude)/param.Tsurf))^(((g*param.MM)/(param.Runiversal*param.lamt))-1); % The density of the atmosphere using the ideal gas law at a specific altitude [kg/m^3]

%if rho < 0 % not sure if above denisty function can go below 0 this just takes care of that possibility
 %   rho=0
%else
%end

%if param.mu == 0
%    Reynolds = 0
%Reynolds= (rho*velmag*param.d)/param.mu; % reynolds number at specific velocity, spacecraft geometry,and altitude []
%end

% Cd is an input from getparam. Could use reynolds number to calculate with
% equation .1/(1+Reynolds)+.05*(1+cos(theta))

% Cl, not using a coefficient of lift at moment. Can change in future if not
% negligible with equation 1/(1+Reynolds^.25)*sin(theta)

% Cm not used at moment but if needed the equation is
% .01/(1+Reynolds^1.2)*thetadot. (thetadot=rate,Theta=pitch)

% Forces Acting on spacecraft
Gravity= -((param.GM*param.mi)/spherical_rho^3).*posvector;

%Gravity= -((param.GM*massatinstant)/spherical_rho^3).*posvector; % Force of gravity on spacecraft with unit vector (thats why it is posvector/r^3) [N] 

%We have to define what reference area will be. This affects the drag
%force. If rocket rotates; Cd,Area, and Reynolds will change causeing drag
%to changes in descent.

%Area_Ref=

%Drag= -(.5*rho*velmag*param.Cd*Area_Ref.*velvector); %Force due to drag opposite direction of normal velocity vector. Opposes direction of motion [N]

%v_effective= param.gearth*param.ISP; % effective velocity of engine [m/s]

%pitch= param.pitchinitial +(t*param.omega_pitch); % instantaneous pitch of spacecraft at time t [radians]
%yaw= param.yawinitial +(t*param.omega_yaw); % instantaneous yaw of spacecraft at time t [radians]
%orientationunitvector= [cos(yaw)*sin(yaw),sin(yaw)sin(pitch), cos(pitch)]; % Orienation of the spacecraft at time t

%orrientation=

%Thrust= (param.mdot*v_effective).*orientationunitvector

%Lift 

acceleration= (Gravity)./param.mi;     %+Drag +Thrust)./massatinstant; %instantaneous acceleration vector [m/s^2]

%construct f output
%f=[vx, vy, vz, ax, ay, az]; %might add in other things such moment stuff
f(1)= vx;
f(2)= vy;
f(3)= vz;
f(4)= acceleration(1,1);
f(5)= acceleration(1,2); 
f(6)= acceleration(1,3);
end



