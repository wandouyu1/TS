function [bestCost,T] =  TS(tabuTenure,numNeighbors,maxIterations)
% maxIterations: 最大迭代次数  
% tabuTenure: 禁忌表长度  
% numNeighbors: 每个解生成的邻居数量
%禁忌搜索算法
Clist=[1304 2312;3639 1315;4177 2244;3712 1399;3488 1535;3326 1556;3238 1229;...
    4196 1044;4312  790;4386  570;3007 1970;2562 1756;2788 1491;2381 1676;...
    1332  695;3715 1678;3918 2179;4061 2370;3780 2212;3676 2578;4029 2838;...
    4263 2931;3429 1908;3507 2376;3394 2643;3439 3201;2935 3240;3140 3550;...
    2545 2357;2778 2826;2370 2975];%全国31个省会城市坐标
%绘制坐标散点图
% figure(1)
% plot(Clist(:,1),Clist(:,2),'o')

CityNum=size(Clist,1);%TSP问题的规模,即城市数目
distanceMatrix=zeros(CityNum); 

%计算每个城市之间的路径长度 (x^2 + y^2)^(1/2)变成矩阵形式
for i=1:CityNum
    for j=1:CityNum
        distanceMatrix(i,j)=((Clist(i,1)-Clist(j,1))^2+(Clist(i,2)-Clist(j,2))^2)^0.5;       
    end
end


% 
% maxIterations = 30000;    % 最大迭代次数  
% tabuTenure = 16;         % 禁忌表长度  
% numNeighbors = 100;        % 每个解生成的邻居数量
tic
% 初始解（随机生成一个排列）  
initialSolution = randperm(CityNum);  
initialCost = calculateCost(initialSolution, distanceMatrix);


% 当前解  
currentSolution = initialSolution;  
currentCost = initialCost; 
% 禁忌表,存入解和存入这个解的时间 
tabuList = containers.Map('KeyType', 'char', 'ValueType', 'any');  

% 记录最优解  
bestSolution = currentSolution;  
bestCost = currentCost;


% 主循环  
for iter = 1:maxIterations  
    % 生成邻居解  
    neighbors = generateNeighbors(currentSolution, numNeighbors, distanceMatrix);  
    neighborCosts = arrayfun(@(idx) calculateCost(neighbors{idx}, distanceMatrix), 1:numNeighbors);  

    % 选择最佳非禁忌邻居 
    %返回最小花费以及索引

    [bestNeighborCost, bestNeighborIdx] = min(neighborCosts);  
    bestNeighborSolution = neighbors{bestNeighborIdx};  
    [~, Idx] = sort(neighborCosts); 
    next = 1;
    %解禁条件
    if bestNeighborCost <= bestCost || rand <0.1
        bestNeighborSolution = neighbors{Idx(next)};  
        bestNeighborCost = neighborCosts(Idx(next)); 
    else

        % 检查禁忌表  
        while(isTabu(bestNeighborSolution, tabuList, tabuTenure))   
            % 如果禁忌，选择次优非禁忌邻居  
            next = next + 1;
            secondBestIdx = Idx(next); % 排除第一个（最佳但被禁忌的）  
            bestNeighborSolution = neighbors{secondBestIdx};  
            bestNeighborCost = neighborCosts(secondBestIdx);  
        end  
    end
    % 更新当前解  
    currentSolution = bestNeighborSolution;  
    currentCost = bestNeighborCost;

    % 更新禁忌表  
    updateTabuList(tabuList, currentSolution, tabuTenure);  

      

    % 更新最优解  
    if currentCost < bestCost  
        bestSolution = currentSolution;  
        bestCost = currentCost;  
    end  

    % % 输出当前迭代信息  
    % fprintf('Iteration %d: Best Cost = %.2f\n', iter, bestCost); 
    % fprintf('Iteration %d: current Cost = %.2f\n', iter, currentCost);
end  
toc
 % 输出最终结果  
% disp('Best Solution:');  
% disp(bestSolution);  
disp(['Best Cost: ', num2str(bestCost)]);
disp(['运行时间: ',num2str(toc)]);
T = toc;

% % 可视化最优路径  
% figure;  
% plot(Clist(bestSolution, 1), Clist(bestSolution, 2), 'o-');  
% hold on;  
% plot(Clist(bestSolution(end), 1), Clist(bestSolution(end), 2), 'ro'); % 回到起点  
% title('Best Route');  
% xlabel('X');  
% ylabel('Y');  
% grid on; 
end