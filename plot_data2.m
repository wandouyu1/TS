plot(cell2mat(R),'r.','MarkerSize',20)
title("初始解对算法性能的影响")
xlabel('随机种子')
ylabel('最优成本')
f = gcf;
exportgraphics(f, "in_sol.png",'Resolution',300)