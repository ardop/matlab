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
    
    in1= input('Enter the first end-effector coordinate values.\nEnter q to quit.\n', 's');
    in2 = input('Enter the second end-effector coordinate value.\n', 's');
    if in1=='q'
        break
        
    else
        in1 = strsplit(in1);
        in2 = strsplit(in2);

        target1 = str2double(in1);
        target2 = str2double(in2);
        
        interval = 10;
        xc = (target2(1) - target1(1))/interval;
        yc = (target2(2) - target1(2))/interval;
        zc = (target2(3) - target1(3))/interval;
        
        
        
        theta_a = ik_pseudo_inverse(target1');
        
        done2 = true;
        
        while(done2)
            
            target1 = target1 + [xc yc zc];
            
            theta_b = ik_pseudo_inverse_initial(target1', theta_a(1:4)');

            if theta_b~=-1

                done = false;

                while ~done
                    theta_check = theta_a - theta_b;
                    %Rounding off to avoid errors
                    theta_a = round(theta_a, 2);
                    theta_b = round(theta_b, 2);
                    for i=1:5
                        %Updating angle at every time instance
                        if theta_check(i)<0
                            theta_a(i) = theta_a(i) + 0.01;
                        elseif theta_check(i)>0
                            theta_a(i) = theta_a(i) - 0.01;
                        end
                    end

                    %Plotting
                    fk_coord_plot(theta_a);
                    %Pause required for animation
                    pause(0.01);

                    %Checking equality using threshold to avoid
                    %Matlab equality errors
                    if sum(abs(theta_a - theta_b))<0.001
                        done = true;
                    end

                end

            else

                fprintf('No Solution\n\n');
                done2 = false;

            end

            theta_a = theta_b;
            
            if(target1(1)==target2(1) && target1(2)==target2(2) && target1(3)==target2(3))
                break
            end
            
        end
        
         
    end
end
        

        

    
    