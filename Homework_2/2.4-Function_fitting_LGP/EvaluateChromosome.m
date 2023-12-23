function fitness = EvaluateChromosome(chromosome,constant,noOfvariable,input)

    chromosomePenaltySize = 160;
    diffSquare=0;
    noOfInput= length(input);

    for n=1:noOfInput
        registers= cat(2, zeros(1,noOfvariable), constant);
        x= input(n,1);
        target = input(n,2);

        functionValue= EvaluateFunction(chromosome,x,registers);

        diffSquare= diffSquare+ (target-functionValue)^2;
    end
    fitness=  1/((1/noOfInput)* sqrt(diffSquare));
    if numel(chromosome)> chromosomePenaltySize
        fitness=fitness*chromosomePenaltySize/numel(chromosome);
    end
end




