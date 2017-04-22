function [theta_b] = move_to_target_linear_quintic(theta_a, target_a, target_b, n0, nf, dt0, dtf, ddt0, ddtf, is_plot_trajectory)
    

%     t_a = ik_pseudo_inverse(target_a');
    t_a = theta_a';
    t_b = ik_pseudo_inverse(target_b');
    
    theta_b = 0;
    
    % In this case, we assume that if the end points are valid then 
    % all linear points between them can be reached
    
    %For control over the velocity and the accelerations, we use a 
    %quintic equation for x, y and z
    
    if(t_b~=-1)
        
        %First we create a quintic equation for x, with the end position, 
        %end velocity and end accelerations
        
        Ax = [n0^5 n0^4 n0^3 n0^2 n0 1;...
            5*(n0^4) 4*(n0^3) 3*(n0^2) 2*n0 1 0;...
            20*(n0^3) 12*(n0^2) 6*n0 2 0 0;...
            nf^5 nf^4 nf^3 nf^2 nf 1;...
            5*(nf^4) 4*(nf^3) 3*(nf^2) 2*nf 1 0;...
            20*(nf^3) 12*(nf^2) 6*nf 2 0 0];
        
        Bx = [target_a(1); dt0; ddt0; target_b(1); dtf; ddtf];
        
        %Finding equation parameters for the X coordinate
        x = Ax\Bx;
        
        disp('Bx:');
        disp(Bx);
        disp('X');
        disp(x);
        disp('----------------');
        disp('Ax*x:');
        disp(Ax*x);
        disp('----------------');
        
        %Finding parameters for the Y coordinate
        %As the motion is a straight line motion, we use straight line
        %slopes to compute y and z trajectories
        
        my = (target_b(2)-target_a(2))/(target_b(1)-target_a(1)); %slope
        
        mz = (target_b(3)-target_a(3))/(target_b(1)-target_a(1)); %slope        
        
        disp('COMPUTING TRAJECTORY:');
        fprintf('\n');
        
        trajectory_configurations = [];
        
        for i=n0:nf
            
            a = [i^5 i^4 i^3 i^2 i 1];
            xc = a*x;
            yc = target_a(2) + my*(xc - target_a(1));
            zc = target_a(3) + mz*(xc - target_a(1));
            
            target_c = [xc yc zc];
            
            [xc, yc, zc] = map_coord(target_c);              
             
            t_c = ik_pseudo_inverse_initial(target_c', t_a');
            trajectory_configurations = [trajectory_configurations; t_c'];
            fprintf('Iteration: %d\n', i);
            theta_b = t_c';
            
            t_a = t_c;
    
        end
        
        %Plotting the stored trajectory
        fprintf('PLOTTING JOINT TRAJECTORY:\n');
        
        for i=1:length(trajectory_configurations);
            
            fk_coord_plot(trajectory_configurations(i, :));
            pause(0.001);
            
        end
       
        
        %Plot trajectory
        fprintf('PLOTTING END EFFECTOR TRAJECTORY:\n');
        if(is_plot_trajectory)
                
            for i=1:length(trajectory_configurations)

                target_c = get_coord(fkval(trajectory_configurations(i, :)));
                [xc, yc, zc] = map_coord(target_c);
                plot3(xc, yc, zc, '.', 'Color', 'c', 'MarkerSize', 7);
                
                
            end

        end
        
    end    
    
end