clc
clear

maxIterations = 3000;
tabuTenure = [1,3,5,7,9];
numNeighbors = [10,20,30,40,50];
R = cell(10,size(tabuTenure,2),size(numNeighbors,2));
for k = 1:10
    for i = 1:size(tabuTenure,2)
        for j = 1:size(numNeighbors,2)
            R{k,i,j} = TS(tabuTenure(i),numNeighbors(j),maxIterations);
        end
    end
end
save("data.mat","R")
% cost  = zeros(10,size(tabuTenure,2));
% T = zeros(10,size(tabuTenure,2));
% for j = 1:size(numNeighbors,2)
%     for k = 1:10
%         for i = 1:size(tabuTenure,2)
%             cost(k,i) = R{k,i,1}(1);
%             T(k,i) = R{k,i,j}(2);
%         end
%     end
%     figure(1)
%     boxplot(cost);
%     f = gcf;
%     exportgraphics(f,'barchart.png','Resolution',300)
% end
