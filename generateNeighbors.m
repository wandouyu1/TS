function neighbors = generateNeighbors(solution, numNeighbors, distanceMatrix)  
%函数功能：根据distanceMatrix生成numNeighbors个solution的邻居解
    neighbors = cell(numNeighbors, 1);  
    for i = 1:numNeighbors  
        newSolution = solution;  
        idx1 = randi(length(solution) - 1);  
        idx2 = randi(length(solution) - 1);  
        while idx1 == idx2  
            idx2 = randi(length(solution) - 1);  
        end  
        newSolution([idx1, idx2]) = newSolution([idx2, idx1]);  
        neighbors{i} = newSolution;  
    end  
end  