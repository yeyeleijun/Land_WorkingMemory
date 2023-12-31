function [U_saddle, saddle_point] = findUsaddle(pca1, pca2, U, U_min)

U1 = U(:, 2:end-1);
barrier_height = min( U1( logical((U(:,1:end-2)-U(:,2:end-1)<0).*(U(:,2:end-1)-U(:,3:end)>0).*(U1>U_min(1)+20).*(U1>U_min(2)+20)) ) );
[x, y] = find( ((U(:,3:end)-U(:,2:end-1)).*(U(:,2:end-1)-U(:,1:end-2))<0).*(U1==barrier_height) );
U_saddle = U(x, y+1);
saddle_point = [pca1(1, y+1), pca2(x, 1)];
end