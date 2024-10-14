function cost = calculateCost(solution, distanceMatrix)  
    cost = 0;  
    for i = 1:length(solution) - 1  
        cost = cost + distanceMatrix(solution(i), solution(i + 1));  
    end  
    cost = cost + distanceMatrix(solution(end), solution(1)); % 回到起点  
end 