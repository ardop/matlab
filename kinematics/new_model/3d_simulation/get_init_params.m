function [x0, y0, z0, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4, x5, y5, z5] = get_init_params()

    l0 = 14.2;
    x0k = 20;
    x0 = [x0k x0k];
    y0 = [0 l0];
    z0k = 50;
    z0 = [z0k z0k];
    
    l1 = 1.8;
    x1 = [x0k x0k+l1];
    y1 = [l0 l0];
    z1 = [z0k z0k];
    
    l2 = 14.5;
    l2a = 9;
    l2b = l2-l2a;
    x2 = [x0k+l1 x0k+l1];
    y2 = [l0 l0];
    z2 = [z0k z0k-l2a];
    
    x3 = x2;
    y3 = y2;
    z3 = [z0k-l2a z0k-l2a-l2b];
    
    l4 = 20;
    l4a = 5;
    l4b = l4 - l4a;
    x4 = x3;
    y4 = y3;
    z4 = [z0k-l2a-l2b z0k-l2a-l2b-l4a];
    x5 = x4;
    y5 = y4;
    z5 = [z0k-l2a-l2b-l4a z0k-l2a-l2b-l4a-l4b];
    
    
end