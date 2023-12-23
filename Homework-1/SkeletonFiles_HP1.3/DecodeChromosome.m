% Note: Each component of x should take values in [-a,a], where a = maximumVariableValue.

function x = DecodeChromosome(chromosome,numberOfVariables,maximumVariableValue);
 % chromosome = [0 1 0 1 0 1 0 1 0 0]
 % numberOfVariables = 2
 % maximumVariableValue = 3
    noOfGenes = size(chromosome,2);
    noOfBitsPerVariable = fix(noOfGenes/numberOfVariables);
    chromosome_copy = chromosome;
    for i = 1: numberOfVariables
        x(i) = 0.0;
        
        for j = 1:noOfBitsPerVariable
            x(i) = x(i) + chromosome_copy(j)*2^(-j);
        end
        x(i) = -maximumVariableValue+ 2*maximumVariableValue*x(i)/(1-2^(-noOfBitsPerVariable));
        if (size(chromosome_copy,2))>=noOfBitsPerVariable
            chromosome_copy= chromosome_copy (1,noOfBitsPerVariable+1:end);
        end 
    end
end 
  

