% First compute the function value, then compute the fitness
% value; see also the problem formulation.

function fitness = EvaluateIndividual(x);
%x= [2 3]
    firstTerm = 1.5 - x(1,1) + x(1,1)* x(1,2) ;
    secondTerm = 2.25 - x(1,1) + x(1,1)*(x(1,2))^2; 
    thirdTerm = 2.625 - x(1,1) + x(1,1)*(x(1,2))^3;
    functionValue = firstTerm^2 + secondTerm^2 + thirdTerm^2; 

    fitness = 1 / (functionValue+1);
end     
