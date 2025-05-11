
% This function should run gradient descent until the L2 norm of the
% gradient falls below the specified threshold.

 function x = RunGradientDescent(xStart, mu, eta, gradientTolerance)
    
(*assign varible  *)
%  mu = 100;
% eta = 0.0001;
% xStart =  [1 2]; %[Specify as a vector with two components, see Step 3 of the problem formulation];
% gradientTolerance = 1E-6;
% 


intialSearchDirection = ComputeGradient(xStart, mu);
xNext= xStart - eta*intialSearchDirection;
SecondSearchDirection = ComputeGradient(xNext, mu);
xStart = xNext;

intialNorm = norm(SecondSearchDirection-intialSearchDirection);

while intialNorm > gradientTolerance
    xNext = xStart - eta*(SecondSearchDirection);
    searchDirection = ComputeGradient (xNext, mu);
    intialNorm = norm(searchDirection- SecondSearchDirection);
    xStart = xNext;
    SecondSearchDirection= searchDirection;
end

x= xStart;
 end



    

    
    

