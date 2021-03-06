clc;
clear all;

l1 = 14.2;
l2 = 1.8;
l3 = 14.5;
l5 = 29.5;

d = [l1, l2, l3, l5];

l(1) = Link([0, l1, 0, pi/2]);
l(2) = Link([0, -l2, 0, pi/2]);
l(3) = Link([0, -l3, 0, pi/2]);
l(4) = Link([0, 0, 0, pi/2]);
l(5) = Link([0, l5, 0, pi/2]);
l(6) = Link([0, 0, 0, pi/2]);
l(7) = Link([0, 0, 0, pi/2]);

li = SerialLink(l, 'name', '7link');

kin_angles_initial_left = [0, pi/2, pi/2, 0, 0, 0, 0];
kin_angles_initial_right = [-pi, -pi/2, pi/2, 0, 0, 0, 0];

%limits of theta to calculate the random values left
t1bl = 0.0; %30 degrees
t1al = -(pi-0.523598);
t2bl = 1.5707 + 0.174532; %10 degrees inwards
t2al = -0.523598; %30 degrees above shoulder level
t3bl = pi;
t3al = 0.0;
t4bl = 0.0;
t4al = -1.5707;
t5bl = 1.5707;
t5al = -1.5707;

theta1 = (t1bl-t1al)*rand + t1al;
theta2 = (t2bl-t2al)*rand + t2al;
theta3 = (t3bl-t3al)*rand + t3al; 
theta4 = (t4bl-t4al)*rand + t4al;
theta5 = (t5bl-t5al)*rand + t5al;
theta6 = (t5bl-t5al)*rand + t5al;
theta7 = (t5bl-t5al)*rand + t5al;

% theta1 = 0;
% theta2 = pi/2;
% theta3 = pi/2;
% theta4 = 0;


theta = [theta1, theta2, theta3, theta4, theta5, theta6, theta7];
fkmat = li.fkine(theta);
[t, f, g, h, i] = calc_fk_manual(theta);
t_analytical = calc_t_analytical(theta);
f_analytical = calc_f_analytical(theta);
g_analytical = calc_g_analytical(theta);
h_analytical = calc_h_analytical(theta);
i_analytical = calc_i_analytical(theta);

[px, py, pz] = pmap(t);
% a = eq_test(theta, px, py, pz);

a = 0;
b = 0;

k1 = (f(3, 4) + l2)/l5;
k2 = f(2, 4)^2 - l3^2 - l5^2;

a = cos(theta4);
b = (px^2 + py^2 + l2^2 + 2*l2*px*sin(theta1) - 2*l2*py*cos(theta1) + k2)/(2*l3*l5);

disp(a);
disp(b);


% disp(i);
% disp(i_analytical);
% disp(i - i_analytical);

% disp(h);
% disp(h_analytical);
% disp(h - h_analytical);

% disp(g);
% disp(g_analytical);
% disp(g - g_analytical);

% disp(f);
% disp(f_analytical);
% disp(f - f_analytical);


% disp(t);
% disp(t_analytical);
% disp(t - t_analytical);



% fkmat = li.fkine(kin_angles_symbolic)

% fkmatp = li.fkine(kin_angles_initial_right)

% [t1] = find_theta(fkmat, d, theta2);
% disp(theta);


