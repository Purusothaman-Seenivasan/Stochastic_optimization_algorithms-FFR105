
[x1, x2] = meshgrid(-5:0.1:5, -5:0.1:5);
fn= log(0.01+(x1.^2+x2-11).^2+(x1+x2.^2-7).^2);
contour(x1, x2, fn); 



xlabel('X1-axis');
ylabel('Y2-axis');
title('Contour Plot of function');
colorbar;

clc;
clear;
iteration=1000;
swarmSize = 50;
noVariable = 2;
range = [-5, 5];
c = [2, 2];
beta = 0.9; 
vmax = 0.5;
alpha=1;
deltaT=1;



minimumCollection = zeros(4,noVariable);
numberofCollection=0;

while numberofCollection<4
    position = IntializeVelocity(swarmSize, noVariable, range);
    velocity= IntializeVelocity(swarmSize, noVariable,range);
    bestFnValue = zeros(swarmSize, 2);
    bestFnValue=bestFnValue+10000;
    globalBest = zeros(1,2);
    globalBest=globalBest+10000;

    for z = 1:iteration 
        inertiaWeight = 1.4 * beta;
        if inertiaWeight < 0.3
            inertiaWeight = 0.3;
        end
        for k = 1:swarmSize
            fx = EvaluateIndi(position(k,:));
            if fx < EvaluateIndi(bestFnValue(k,:))
                bestFnValue(k,:) = position(k,:);
            end
            if fx < EvaluateIndi(globalBest)
                globalBest(1,:) = position(k,:);
            end
    %         disp(z);
        end
        
        for i = 1:swarmSize
            q = rand();
            r=rand();
            for j = 1:noVariable
                firstterm = inertiaWeight * velocity(i, j);
                secondterm = c(1) * q * (bestFnValue(i,j) - position(i, j));
                thirdterm = c(2) * r * (globalBest(1,j) - position(i, j));
                velocity(i, j) = firstterm + secondterm + thirdterm;
                if (velocity(i, j)) > vmax
                    velocity(i, j) = vmax;
                elseif (velocity(i,j)) < -vmax
                    velocity(i,j)= -vmax;
                end
                position(i, j) = position(i, j) + velocity(i, j);
            end
        end
    end
    functionValue= EvaluateIndi(globalBest);

    
    isIncollection = ismember(round(minimumCollection,1), round(globalBest,1),"rows");
    if ~isIncollection
        numberofCollection = numberofCollection + 1;
        minimumCollection(numberofCollection,1) = globalBest(1);
        minimumCollection(numberofCollection,2)=globalBest(2);
        sprintf('FunctionValue:%d, x(1): %0.10f, x(2):%10f,', functionValue, globalBest(1),globalBest(2))
    end

end


