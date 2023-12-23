function position= IntializePosition(swarmSize, noVariable,range)
    position=zeros(swarmSize,noVariable);
    for i=1:swarmSize
        for j=1:noVariable
            position(i,j)= range(1)+rand*(range(2)-range(1));
        end
    end
end

    