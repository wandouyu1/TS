clc
clear

maxIterations = 3000;
seed = 1:100;
tabuTenure = 3;
numNeighbors = 30;
R = cell(1,100);
for i = 1:size(seed,2)
    rng(seed(i));
    R{1,i} = TS(tabuTenure,numNeighbors,maxIterations);
end

save("data2.mat","R")

