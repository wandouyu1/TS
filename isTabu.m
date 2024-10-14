function isTabu = isTabu(solution, tabuList, tabuTenure)  
%函数功能：检查禁忌表
    solutionStr = mat2str(solution);  
    if isKey(tabuList, solutionStr)  
        keyCreationTime = tabuList(solutionStr);  
        currentTime = datetime('now', 'TimeZone', 'local'); 
        % 判断这个时间差是否小于 tabuTenure。
        % 如果是，说明该解仍然处于禁忌期内，
        % isTabu 设置为 true；否则，isTabu 设置为 false
        timeElapsed = seconds(currentTime - keyCreationTime)*100;  
        isTabu = timeElapsed < tabuTenure;  
    else  
        isTabu = false;  
    end  
end  