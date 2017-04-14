clc;

initial_theta = [0 pi/2 pi/2 0 0];
theta_a = initial_theta;
figure;
fk_coord_plot(initial_theta);
initialize_axes();

pxa = -35;
pxb = 10;
pya = 10;
pyb = 43;
pza = 0;
pzb = 25;

while(true)
    
    in = input('Enter the coordinate values.\n1: Linear joint control.\nEnter q to quit.\n', 's');
    if in=='q'
        break
        
    else
        in = strsplit(in);
        target = str2double(in);
        target1 = target(1:3);
        mode = target(4);
        
        % Motion according to the modes
        if(mode==1)
            
            %Linear motion of joint angles.
            %First the joint angles for the second coordinate is calculated
            
            theta_b = ik_pseudo_inverse(target1');
            theta_b = theta_b'; %Make it a row vector
            theta_b = round(theta_b, 2);
            
            move_to_theta_uniform(theta_a, theta_b);
            
           
     
            
        end
        
%         % Now we move from target 1 to target 2 in straight lines
%         
%         delta = (target2-target1)/10;
%         
%         for ii=1:10
%             theta_a = move_to_target(target1+ii*delta, theta_a');
%         end
        
        
        
        
        
%         theta_a = move_to_target(target, theta_a);  
         
    end   
end

close all;
        
        
        

    
    