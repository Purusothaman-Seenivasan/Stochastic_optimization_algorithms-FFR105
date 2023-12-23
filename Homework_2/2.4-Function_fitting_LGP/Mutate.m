function currentchromosome =Mutate(currentchromosome,mutationProbability, registerSize, numberOfOperator, noOfvariable)
    
    lenofInstruction= numel(currentchromosome)/4;

    for k=1:4:lenofInstruction
        if rand<mutationProbability
            currentchromosome(k)= randi([1,numberOfOperator]);
            currentchromosome(k+1)=randi([1,noOfvariable,]);
            currentchromosome(k+2)= randi([1,registerSize]);
            currentchromosome(k+3)= randi([1,registerSize]);
        end
    end
    
end

