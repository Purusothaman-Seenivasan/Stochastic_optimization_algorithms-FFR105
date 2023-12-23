clear all;
clc;

populationSize=100;
input= LoadFunctionData;
constant=[1,2,3];
noOfConstant= numel(constant);
numberOfOperator=4;
noOfvariable= 3;
registerSize= noOfvariable+noOfConstant;
insructionSize=4;
previousfitnessmax=0;
noProgressCount=0;
generation=0;
tournamentSize=3;
tournamentProbability=0.2;
mutationProbability=0.02;
crossoverProbability=0.8;
bestchromosome=[];

population = InitializePopulation(populationSize,noOfConstant,numberOfOperator,noOfvariable,insructionSize);
%startwhile
fitnessmax=0;
for iteration=1:10000
    for i=1:populationSize
        chromosome=population(i).Chromosome;
        fitness(i) = EvaluateChromosome(chromosome,constant,noOfvariable,input);
        if fitness(i)>fitnessmax
            fitnessmax=fitness(i);
            bestindi=i;
            bestchromosome= chromosome;
        end
    end
    temporaryPopulation = population;  
    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness,tournamentProbability,tournamentSize);
        i2 = TournamentSelect(fitness,tournamentProbability,tournamentSize);
        r = rand;
        if (r < crossoverProbability) 
            individual1 = population(i1).Chromosome;
            individual2 = population(i2).Chromosome;
            newIndividuals = Cross(individual1, individual2);
    
            temporaryPopulation(i).Chromosome = newIndividuals(1).Chromosome;
            temporaryPopulation(i+1).Chromosome = newIndividuals(2).Chromosome;
    
            
        else
            temporaryPopulation(i).Chromosome = population(i1).Chromosome;
            temporaryPopulation(i+1).Chromosome = population(i2).Chromosome;
    
            
        end
    end
    
    for p =2:populationSize
        currentchromosome=temporaryPopulation(p).Chromosome;
        temporaryPopulation(p).Chromosome = Mutate(currentchromosome,mutationProbability, registerSize, numberOfOperator, noOfvariable);
    
    end
end
population= temporaryPopulation;
% end 
% chro=population.Chromosome;
% disp(fitness)
% disp(fitnessmax)