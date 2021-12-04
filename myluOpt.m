function [A, info] = myluOpt(A)
    
    info = 0;
    n = length(A);
    
    for i=1 : n
        if A(i, i) == 0
           fprintf('Error %f ad indice %d', A(i, i), i);
           info = -1;
           return
        end
        % Calcolo la i-esima riga di U
        for j=i : n
            sumU = 0;
            for k=1: i-1
                sumU = sumU + A(i, k) * A(k, j);
            end
            A(i, j) = A(i, j) - sumU;
        end
        
        % Calcolo la i-esima colonna di L 
        for j=i+1 : n
            sumL = 0;
            for k=1 : i-1
               sumL = sumL + A(j, k) * A(k, i);
            end
            A(j, i) = ( A(j, i) - sumL ) / A(i, i);
        end
    end
end