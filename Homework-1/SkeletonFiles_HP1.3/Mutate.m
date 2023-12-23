function mutatedIndividual = Mutate(individual, mutationProbability);

    noOfGenes = size (individual,2);
    mutatedIndividual = individual;
    for j = 1:noOfGenes
        r= rand;
        if (r<mutationProbability)
            mutatedIndividual(j) = 1-individual(j);
        end
    end
end

