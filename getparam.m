function param = getparam(Mass, massinitial, Radius, mdot, ISP) 

param.G = 6.67e-11; % Gravitational Constant [N-m^2/kg^2]
param.gearth= 9.81; % gravitational acceleration of earth [m/s^2]
param.Runiversal= 8.3145; % universal gas constant [J/mol-K]
param.Mass  = Mass; % Mass of central body [kg]
param.mi    = massinitial; % Mass of spacecraft initial [kg]
param.R     = Radius; % Radius of the central body [m]
param.GM    = param.G*Mass; % Gravitational parameter of target body [m^3/s^2]
%param.d     = diameter; % Spacecraft diameter [m]
%param.mu    = dynamicviscosity; % dynamic viscosity of central body's atmosphere [N-s/m^2]
%param.rho0  = densityatsurface; % density of atmosphere at surface [kg/m^3]
%param.lamt  = lapseratetemp; % change in temp of atmosphere with respect to altitude [K]
param.hmin  = Radius; % The position at which spacecraft lands [m]
param.mdot  = mdot; % The mass flow rate of rocket propellant [kg/s]
param.ISP   = ISP; % The specific impulse of the rocket engine [s]
%param.Cd    = Cd; % The drag coefficient of the spacecraft []
%param.MM    = MolarMass; % Molar Mass of atmospheric gas [kg/mo]
%param.Tsurf = Tempsurf; % Surface Temperature of central body [K]
%param.Psurf = Pressurf; % Pressure at surface of central body [Pa]
%param.orientationinitial= n_orientation % initial normal vector of rocketorientation []
%param.pitchinititial  = pitch_in;  %CubeSat initial pitch rate [rad/s]

%param.yawinitial = yaw_in; %initial yaw [rad/s]
%param.Iyaw_pitch  = ;% spacecraft moment of inertia for pitch and yaw [kg/m^2]
%param.omega_pitch= d_pitch; % change in pitch with respect to time this will be a functioin of time need equation for it [rad/s^2]
%param.omega_yaw= d_yaw; % change in yaw with respect to time this will be a functioin of time need equation for it [rad/s^2]


end