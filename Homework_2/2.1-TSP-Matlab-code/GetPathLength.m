function pathLength = GetPathLength(path,visibility)
%     path = [19, 1, 48, 12, 22, 31, 2, 28, 41, 43, 9, 36, 32, 26, 45, 14, 21, 11, 38, 47, 15, 30, 7, 27, 4, 40, 37, 18, 3, 6, 20, 23, 29, 16, 46, 24, 17, 34, 5, 10, 35, 25, 50, 13, 33, 8, 42, 44, 39, 49];
%     path=[1,2,3]
%     cityLocation= LoadCityLocations();
%     visibility = GetVisibility(cityLocation);
%     dMatrix= zeros(numel(path),numel(path));
    for m=1:50%numel(path)
        for n=1:50%numel(path)
            if m~=n
                dMatrix(m,n)= 1/visibility(m,n);
            end
        end
    end 
%     disp(dMatrix)
    %dMatrix= 1/visibility %element of this matrix is distance between corrosponding node
    pathLength=0;
    % disp(numel(path))
    for i=1:numel(path)
        if i== numel(path)

            pathLength= pathLength + dMatrix(path(1,i),path(1,1));
        elseif i<numel(path)
            pathLength= pathLength+ dMatrix(path(1,i),path(1,i+1));
        end
    end
end
%     disp(pathLength)

