
numberOfVariables = 3;
constant = [1,2,3];

input = LoadFunctionData();

bestChromosome = BestChromosome();  


scatter(input(:, 1), input(:, 2), 'filled');
hold on;


x_range = linspace(0, 10, 100);  
y_estimated = zeros(size(x_range));

for i = 1:length(x_range)
    x = x_range(i);
    y_estimated(i) = FindFunction(bestChromosome, numberOfVariables, constant,x);
end

plot(x_range, y_estimated, '--');

% Error calculation
squareSum = 0;
noOfinput = size(input, 1);

for n = 1:noOfinput
    registers= cat(2, zeros(1,numberOfVariables), constant);
    x = input(n, 1);
    target = input(i, 2);
    yHat = EvaluateFunction(bestChromosome, x, registers);
    squareSum = squareSum + (yHat - target)^2;
end

rmsError = sqrt(squareSum / noOfinput);
fprintf('Estimated function g(x) had an RMS error of %.2f.\n', rmsError);

xlabel('x');
ylabel('y');
title('Function Estimation');
legend('Actual Data', 'Estimated Function');
grid on;
hold off;
