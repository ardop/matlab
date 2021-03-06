function [theta_ret] = ik_pseudo_inverse(target)

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

    %limits of theta to calculate the random values right
    t1br = -0.523598;
    t1ar = -pi;
    t2br = 0.523598; %30 degrees above the shoulder
    t2ar = -(1.5707 + 0.174532); %10 degrees inwards
    t3br = pi;
    t3ar = 0.0;
    t4br = 0.0;
    t4ar = -1.5707;
    t5br = 1.5707;
    t5ar = -1.5707;

    error_threshold = 1.5;
    
    iter = 1;
    
    while(true)
    
        theta1 = (t1bl-t1al)*rand + t1al;
        theta2 = (t2bl-t2al)*rand + t2al;
        theta3 = (t3bl-t3al)*rand + t3al; 
        theta4 = (t4bl-t4al)*rand + t4al;
        theta5 = (t5bl-t5al)*rand + t5al;

        theta_default = [theta1, theta2, theta3, theta4];

        theta_calc = calc_pseudo_inverse(theta_default, target);
        theta_calc = [theta_calc; 0];

        error = calc_error(target, get_coord(fkval(theta_calc)));
        
        if(validate_theta(theta_calc) & (error<=error_threshold))
            
            fprintf('Valid Angles!!!\n\n');
            fprintf('Error: %f\n\n----------------------\n\n', error);
            theta_ret = theta_calc;
            break;
        else
            iter = iter + 1;
            if iter>100
                fprintf('No Solution Possible\n');
                theta_ret = -1;
                break;
            end
        end
    end

end



















