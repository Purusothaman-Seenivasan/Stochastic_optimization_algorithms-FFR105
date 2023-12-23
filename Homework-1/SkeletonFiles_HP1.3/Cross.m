function newIndividuals = Cross(individual1, individual2)
    noOfGenes = size(individual1,2);
    point = 1+ fix(rand*(noOfGenes-1));
    newIndividuals= zeros(2, noOfGenes);
    for k = 1:noOfGenes
        if (k<= point)
            newIndividuals(1,k) = individual1(k);
            newIndividuals(2,k) = individual2(k);
        else
            newIndividuals(1,k) = individual2(k);
            newIndividuals(2,k) = individual1(k);
        end
    end
end 


