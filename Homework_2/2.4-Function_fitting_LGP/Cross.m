function newpairs = Cross(individual1, individual2)
%     individual1=[1 2 3 4 5 6 7 8 100 101 102 103 104 105 106 107]
%     individual2=[9 10 11 12 13 14 15 16 17 18 19 20]
    
    lenOfInformation1= length(individual1)/4;
    cross1= sort(randi([0,lenOfInformation1],2,1)*4);
    lenOfInformation2=length(individual2)/4;
    cross2=sort(randi([0,lenOfInformation2],2,1)*4);

    newpairs= struct('Chromosome',[]);
    
    newpairs(1).Chromosome=[individual1(1:cross1(1)),individual2(cross2(1)+ 1:cross2(2)),individual1(cross1(2)+1:end)];
    newpairs(2).Chromosome=[individual2(1:cross2(1)),individual1(cross1(1)+ 1:cross1(2)),individual2(cross2(2)+1:end)];

    if isempty(newpairs(1).Chromosome) & isempty(newpairs(2).Chromosome)
        newpairs=Cross(individual1, individual2);
    end

end 