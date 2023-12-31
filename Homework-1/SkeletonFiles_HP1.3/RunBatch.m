%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numberOfRuns = 5;                % Do NOT change
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;		   % Do NOT change
numberOfGenerations = 300;         % Do NOT change
tournamentSize = 2;                % Do NOT change
tournamentProbability = 0.75;      % Do NOT change
crossoverProbability = 0.8;        % Do NOT change


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Batch runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define more runs here (pMut < 0.02) ...


% mutationProbability = 0.02;
% sprintf('Mutation rate = %0.5f', mutationProbability)
% maximumFitnessList002 = zeros(numberOfRuns,1);
% for i = 1:numberOfRuns 
%  [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
%                                        tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
%  sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
%   maximumFitnessList002(i,1) = maximumFitness;
% end

% ... and here (pMut > 0.02)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Summary of results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add more results summaries here (pMut < 0.02) ...

% average002 = mean(maximumFitnessList002);
% median002 = median(maximumFitnessList002);
% std002 = sqrt(var(maximumFitnessList002));
% sprintf('PMut = 0.02: Median: %0.10f, Average: %0.10f, STD: %0.10f', median002, average002, std002)

%disp(bestVariableValues)
medianVector = [];
% ... and here (pMut > 0.02)
mutationProbs = [ 0.00 0.01 0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5];
for k= 1:size(mutationProbs,2)
	sprintf('Mutation rate = %0.5f', mutationProbs(k))
	maximumFitnessList002 = zeros(numberOfRuns,1);
	for i = 1:numberOfRuns 
	[maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbs(k), numberOfGenerations);
	sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
	maximumFitnessList002(i,1) = maximumFitness;
	end
	average002 = mean(maximumFitnessList002);
	median002 = median(maximumFitnessList002);
	std002 = sqrt(var(maximumFitnessList002));
	sprintf('PMut = %0.5f, Median: %0.10f, Average: %0.10f, STD: %0.10f',mutationProbs(k), median002, average002, std002)
    medianVector = [medianVector , median002];
end 


mutationProbablityVector = [ 0.00 0.01 0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5];

plot(mutationProbablityVector, medianVector)
f = gcf;
exportgraphics(f,'graph.jpg');
	
