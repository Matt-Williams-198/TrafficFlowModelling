function graphedArray = TrafficFlowVisualisation(iterations)
    graphedArray = zeros('like',iterations);
    for i = 1:length(iterations(:,1))
        for  j = 1:length(iterations(1,:))
            if iterations(i,j) == -1
                graphedArray(i,j) = -1;
            else
                graphedArray(i,j) = 1;
            end
        end
    end
    return