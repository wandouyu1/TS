clc
clear
load data.mat
maxIterations = 3000;
tabuTenure = [1,3,5,7,9];
numNeighbors = [10,20,30,40,50];
% x = 1:0.1:2*pi;
% figure(1)  
% a = plot(x,sin(x));
% title("my")
% xlabel("ff")
% f = gcf;
% exportgraphics(f,'barchart.png','Resolution',300)


cost  = zeros(10,size(tabuTenure,2));
T = zeros(10,size(tabuTenure,2));
%变量为禁忌表长度
for j = 1:size(numNeighbors,2)
    for k = 1:10
        for i = 1:size(tabuTenure,2)
            cost(k,i) = R{k,i,j}(1);
            % T(k,i) = R{k,i,j}(2);
        end
    end
    figure(1)
    g = [repmat({num2str(tabuTenure(1))},10,1)];
    for i = 2:size(tabuTenure,2)
        g = [g;repmat({num2str(tabuTenure(i))},10,1)];
    end
    boxplot(cost,g,'Whisker',10);
    title("不同禁忌表长度对算法性能的影响");
    xlabel("禁忌表长度");
    ylabel("最优成本");
    hold off
    f = gcf;
    exportgraphics(f, "r" + num2str(j) +"_tabu.png",'Resolution',300)
end
%变量为候选解数量
for i = 1:size(tabuTenure,2)
    for k = 1:10
        for j = 1:size(numNeighbors,2)
            cost(k,j) = R{k,i,j}(1);
            % T(k,i) = R{k,i,j}(2);
        end
    end
    figure(1)
    g = [repmat({num2str(numNeighbors(1))},10,1)];
    for j = 2:size(numNeighbors,2)
        g = [g;repmat({num2str(numNeighbors(j))},10,1)];
    end
    boxplot(cost,g,'Whisker',10);
    title("候选解数量对算法性能的影响");
    xlabel("候选解数量");
    ylabel("最优成本");
    hold off
    f = gcf;
    exportgraphics(f,"r" + num2str(i) +"_Neighbor.png",'Resolution',300)
end