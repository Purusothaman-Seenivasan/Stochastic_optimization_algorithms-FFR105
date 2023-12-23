function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection,numberOfCities)
    deltaPheromoneLevel= zeros( numberOfCities,numberOfCities);
    for k=1:numel(pathLengthCollection)
        path= pathCollection(k,:);
        for i=1:numel(path)
            if i==numel(path)
                deltaPheromoneLevel(path(i),path(1))=deltaPheromoneLevel(path(i),path(1))+ (1/pathLengthCollection(k));
            else       
                deltaPheromoneLevel(path(i),path(i+1))=deltaPheromoneLevel(path(i),path(i+1))+ (1/pathLengthCollection(k));
            end
        end 
    end 
%     disp(deltaPheromoneLevel)
end 
    


    