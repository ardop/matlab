function [q] = calc_pseudo_inverse(theta_default, t)

q = theta_default';

l1 = 14.2;
l2 = 1.8;
l3 = 14.5;
l5 = 29.5;

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

alpha = 0.01;

for i=1:500
    
    J = calc_jacobian(q);
    pJ = pinv(J);
    
    theta1 = q(1);
    theta2 = q(2);
    theta3 = q(3);
    theta4 = q(4);
    theta5 = 0;
    
    a = [cos(theta1) 0 sin(theta1) 0; sin(theta1) 0 -cos(theta1) 0; 0 1 0 l1; 0 0 0 1];
    b = [cos(theta2) 0 sin(theta2) 0; sin(theta2) 0 -cos(theta2) 0; 0 1 0 -l2; 0 0 0 1];
    c = [cos(theta3) 0 sin(theta3) 0; sin(theta3) 0 -cos(theta3) 0; 0 1 0 -l3; 0 0 0 1];
    d = [cos(theta4) 0 sin(theta4) 0; sin(theta4) 0 -cos(theta4) 0; 0 1 0 0; 0 0 0 1];
    e = [cos(theta5) 0 sin(theta5) 0; sin(theta5) 0 -cos(theta5) 0; 0 1 0 l5; 0 0 0 1];
    
    ti = get_coord(a*b*c*d*e);  
    q = q + alpha*pJ*(t - ti);
    

end

% disp('target:');
% disp(t);
% disp('calculated:');
% disp(ti);
% fprintf('-------------------------\n\n');
    

end