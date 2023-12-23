% This function should return the gradient of f_p = f + penalty.
% You may hard-code the gradient required for this specific problem.

 function gradF = ComputeGradient(x,mu)
    % x=[1 2]
    % mu= 1
     
    % constrainedValue  = x(1,1)^2 + x(1,2)^2 -1 ;
    % if constrainedValue >0
    %     x1= 2*(x(1,1)-1)+(4*mu*x(1,1))*((x(1,1))^2+(x(1,2))^2 - 1);
    %     x2= 4*(x(1,2)-2) + (4*mu*x(1,2))*((x(1,1))^2+(x(1,2))^2 - 1);
    % else
    %     x1 = 2*(x(1,1)-1);
    %     x2 = 4*(x(1,2)-2);
    % end 
     x1= 2*(x(1,1)-1)+(4*mu*x(1,1))*((x(1,1))^2+(x(1,2))^2 - 1);
     x2= 4*(x(1,2)-2) + (4*mu*x(1,2))*((x(1,1))^2+(x(1,2))^2 - 1);

     gradF= [x1 x2];
end 


