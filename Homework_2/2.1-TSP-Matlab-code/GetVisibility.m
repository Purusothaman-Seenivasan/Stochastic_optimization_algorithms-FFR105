function visibility = GetVisibility(cityLocation)
    % cityLocation= LoadCityLocations();
    numberOfCities = length(cityLocation);
    visibility = zeros( numberOfCities ,numberOfCities);
    
    for i=1:numberOfCities
        for j=1:numberOfCities
            if i~=j
                visibility(i,j)= 1/(sqrt((cityLocation(i,1)-cityLocation(j,1))^2+ (cityLocation(i,2)-cityLocation(j,2))^2));
            end
        end
    end
end
   % disp(visibility)
    