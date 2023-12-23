 function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
%  fitnessList = [ 1 3 4 67];
%  tournamentSize = 3;        
%  tournamentProbability = 0.75;
    fitnessSize = size(fitnessList,2);
    iTmp= zeros(1, tournamentSize);
    for i = 1: tournamentSize
     iTmp(i) = 1+ fix(rand*fitnessSize);
    end 
    r = rand;
    if r < tournamentProbability
        best = 0;
        bestIndex = 0;
        for j =1:size(iTmp,2)
            if fitnessList(1,(iTmp(1,j))) > best
                best = fitnessList(1,(iTmp(1,j)));
                bestIndex = iTmp(1,j);
            end 
        end 
     else
        best = 10e8;
        bestIndex=0;
        for j=1: size(iTmp,2)
            if fitnessList(1,(iTmp(1,j))) < best
                best = fitnessList(1,(iTmp(1,j)));
                bestIndex = iTmp(1,j);
            end
        end 
    end 
    selectedIndividualIndex = bestIndex;
 end 