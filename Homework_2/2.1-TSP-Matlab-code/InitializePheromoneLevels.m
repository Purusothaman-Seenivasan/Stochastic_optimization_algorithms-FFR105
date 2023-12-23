function pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0)
    % numberOfCities=10
    % tau0=0.5
    pheromoneLevel= zeros(numberOfCities, numberOfCities);
    for i=1:numberOfCities
        for j=1:numberOfCities
            if (i~=j)
                pheromoneLevel(i,j)=tau0;
            end
        end
    end 
end
    % disp(pheromoneLevel)
                