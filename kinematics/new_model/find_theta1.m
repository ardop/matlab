function [ans1, ans2] = find_theta1(t, theta0, l2, l4)
    
    [nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(t);
    
    si = ((l4*ox - px)*cos(theta0) + (l4*oy - py)*sin(theta0))/l2;
    if (1-si*si)<0
        co = 0;
    else
        co = sqrt(1-si*si);
    end
    
    ans1 = atan2(si,co);
    ans2 = atan2(si,(-co));
    
end