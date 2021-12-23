function [L, U] = mylu(A)
    % A ∈ R^n×n in input è la matrice da fattorizzare, in output contiene 
    % i fattori L ed U della decomposizione A = LU, gli elementi diagonali 
    % di L non sono memorizzati
    % info : info=0, a meno che la routine non stabilisca un 
    % errore (info=-1, se è stato trovato un elemento pivot nullo, 
    % nel qual caso la procedura si arresta)
    % 
    
    n = length(A);
    L = zeros(n, n) + eye(n); U = zeros(n, n);
    
    for i=1 : n
        % Calcolo la i-esima riga di U
        for j=i : n
            sumU = 0;
            for k=1: i-1
                sumU = sumU + L(i, k) * U(k, j);
            end
            % k = 1:i-1; U(i, j) = ( A(i, j) - sum(L(i,k)*U(k,j)) );
            U(i, j) = ( A(i, j) - sumU );
        end
        
        % Calcolo la i-esima colonna di L 
        for j=i+1 : n
            sumL = 0;
            for k=1 : i-1
               sumL = sumL + L(j, k) * U(k, i);
            end
             % k = 1:i-1; U(i, j) = ( A(i, j) - sum(L(j,k)*U(k,i)) );
            L(j, i) = ( A(j, i) - sumL ) / U(i, i);
        end
        
    end
end


