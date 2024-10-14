function updateTabuList(tabuList, solution, tabuTenure)  
    solutionStr = mat2str(solution);  
    currentTime = datetime('now', 'TimeZone', 'local');  
    tabuList(solutionStr) = currentTime;  

    % 清理过期的禁忌条目  
    keysToRemove = {};  
    for key = keys(tabuList)  
        creationTime = tabuList(char(key));  
        currentTime = datetime('now', 'TimeZone', 'local');  
        if seconds(currentTime - creationTime)*100 >= tabuTenure  
            keysToRemove{end + 1} = char(key);  
        end  
    end  
    for key = keysToRemove  
        remove(tabuList, key);  
    end  
end