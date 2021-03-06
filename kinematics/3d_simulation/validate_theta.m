function f = validate_theta(theta)

    t1bl = pi/2;
    t1al = -pi/2;
    t2bl = pi/2;
    t2al = 0.0;
    t3bl = pi;
    t3al = 0.0;
    t4bl = 0.0;
    t4al = -pi/2;
    t5bl = pi/2;
    t5al = -pi/2;

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
    
    f = true;
    
    if(theta(1)<t1al || theta(1)>t1bl)
        f = false;
    end
        
    if(theta(2)<t2al || theta(2)>t2bl)
        f = false;
    end
        
    if(theta(3)<t3al || theta(3)>t3bl)
        f = false;
    end
        
    if(theta(4)<t4al || theta(4)>t4bl)
        f = false;
    end
    
end
   
    