function path = GeneratePath1(pheromoneLevel, visibility, alpha, beta, cityLocation)
    numberOfCities = length(cityLocation);
    path = zeros(1, numberOfCities);
    
   
    
    
    
    currentNode = randi([1,50]);
    path(1) = currentNode;
    unvisitedNodes = setdiff(1:numberOfCities, currentNode);  
    
    for step = 2:numberOfCities
        totalProbList = zeros(1, length(unvisitedNodes));
        
        for i = 1:length(unvisitedNodes)
            prob = (pheromoneLevel(currentNode, unvisitedNodes(i))^alpha) * (visibility(currentNode, unvisitedNodes(i))^beta);
            totalProbList(i) = prob;
        end
        
        
        cumulativeProb = cumsum(totalProbList);
        randomNum = rand() * cumulativeProb(end);
        nextIndex = find(cumulativeProb >= randomNum, 1, 'first');
        nextNode = unvisitedNodes(nextIndex);
        
        path(step) = nextNode;
        currentNode = nextNode;
        
        % Remove the visited node from unvisitedNodes
        unvisitedNodes = setdiff(unvisitedNodes, nextNode);
    end
    
    % Return to the starting city to complete the tour
    %path(numberOfCities + 1) = path(1);
end
