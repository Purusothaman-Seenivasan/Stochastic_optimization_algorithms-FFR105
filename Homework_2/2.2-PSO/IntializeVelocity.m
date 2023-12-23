function velocity= IntializeVelocity(swarmSize, noVariable,range)
    velocity=zeros(swarmSize, noVariable);
    alpha=1;
    for i=1:swarmSize
        for j=1:noVariable
            velocity(i,j)= alpha*(range(1)+rand*(range(2)-range(1)));
        end
    end
end