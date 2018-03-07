%Generating a line
clc; clear all; close all;
p = -10:0.1:10;
a=3; b=0.5;
plot(p,a*p+b); hold on;

%points' cloud generation
x = round(randn(40,1)*3); 
y = round(randn(40,1)*10);

%points' classification
c1= find(y < x*3+0.5);  
c2= find(y > x*3+0.5);

%points' plot
plot(x(c1),y(c1),'x');
plot(x(c2),y(c2),'o');






%Circle geometry
%(x-a)^2+(y-b)^2=r^2
%y1 = sqrt( (r^2) - (x-a)^2 )+ b;
%y2 = sqrt( (r^2) - (x-a)^2 )- b;

%Circle generation
clc; clear all; figure; %close all;
t = linspace(0,2*pi);
r = 5;
a1 = 2; b1=1; c1x= r*sin(t)+a1; c1y= r*cos(t)+b1; % cx1 = a1-r:0.01:a1+r; cy1= sqrt( (r^2) - (cx1-a1).^2 );
a2 =-2; b2=0; c2x= r*sin(t)+a2; c2y= r*cos(t)+b2; % cx2 = a2-r:0.01:a2+r; cy2= sqrt( (r^2) - (cx2-a2).^2 );
%points' cloud generation
Np=10;
px = linspace( min(a1,a2)-r,max(a1,a2)+r,Np);
py = linspace( min(b1,b2)-r,max(b1,b2)+r,Np);
[x,y] = meshgrid(px, py);

%all_points
p_out = 1:length(x(:));
%points_inside_circle1
p_c1 = find((x-a1).^2+(y-b1).^2<=r^2); p_out = setdiff(p_out,p_c1);
%points_inside_circle2
p_c2 = find((x-a2).^2+(y-b2).^2<=r^2); p_out = setdiff(p_out,p_c2);
%points inside both
p_both = intersect(p_c1, p_c2);

p_c1= setdiff(p_c1,p_both);
p_c2= setdiff(p_c2,p_both);

%plot of the results
plot(c1x      , c1y      , 'r'); hold on;
plot(c2x      , c2y      , 'b'); hold on;
plot(x(p_out) , y(p_out) , 'X'); hold on;
plot(x(p_c1)  , y(p_c1)  , 'o'); hold on;
plot(x(p_c2)  , y(p_c2)  , 'o'); hold on;
plot(x(p_both), y(p_both), 'x'); hold on;
grid on; 
pbaspect([1 1 1]); 
axis([-10 10 -10 10]); 
hold off;



