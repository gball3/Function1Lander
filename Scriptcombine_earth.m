
Mass=5.972*10^24;
massinitial=100;
Radius=6371000;
mdot=0;
ISP=0;


param=getparam(Mass, massinitial, Radius, mdot, ISP);
ui(1)= -6471000;
ui(2)= -6471000;
ui(3)= -6471000;
ui(4)= 5000;
ui(5)= -5000;
ui(6)= 5000;

positionE=[ui(1),ui(2),ui(3)];
velocityE=[ui(4),ui(5),ui(6)];

positionEnorm=norm(positionE);
velocityEnorm=norm(velocityE);

Energy= ((velocityEnorm^2)/2)-((param.GM/positionEnorm));
semimajoraxis= -(param.GM/(2*Energy));
%period= ((2*pi())/(sqrt(param.GM)))*(semimajoraxis^(3/2));
periodN= 1
T=10000;
N=10000;



[tn,un]=rk4SD(T,N,ui);

%spericalcoordinates=[,3];
%spericalcoordinates(:,1)=sqrt((un(:,1)^2)+(un(:,2)^2)+(un(:,3)^2));
%spericalcoordinates(:,2)=atan(un(:,2)/un(:,1));
%spericalcoordinates(:,3)=acos((un(:,3))/(sqrt((un(:,1)^2)+(un(:,2)^2)+(un(:,3)^2))));

plot3(un(:,1),un(:,2),un(:,3),'-');
hold on

[x,y,z] = sphere;
x = x*param.R;
y = y*param.R;
z = z*param.R;


surf(x,y,z);
xlabel('x')
ylabel('y')
zlabel('z')

shg