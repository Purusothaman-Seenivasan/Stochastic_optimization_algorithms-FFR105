function population = InitializePopulation(populationSize,noOfConstant,numberOfOperator,noOfvariable,insructionSize);
% populationSize=10;

range=[1,4]; %number of instruction [min, max] 
population = [];
totalNoOfVariable= noOfConstant+noOfvariable;

for i = 1:populationSize
    noOfInstruction=randi(range);
    chromosome= zeros(1,noOfInstruction*insructionSize);
    for j=1:noOfInstruction
        startnumber= ((j-1)*insructionSize)+1;
        chromosome(startnumber)=randi([1,numberOfOperator]);
        chromosome(startnumber+1)=randi(noOfvariable); %desigination register
        chromosome(startnumber+2: startnumber+3)= randi(totalNoOfVariable,1,2);
    end
    tmpIndividual = struct('Chromosome',chromosome);
    population = [population tmpIndividual];
end

end
% disp(population)