function A = myinv(A)
    % Calcola l'inversa di una matrice risolvendo n sistemi lineari
    % dove la matrice B sarà l'identità e l'incognita X è appunto la
    % matrice inversa
    % Complessità T(n) = O(2 n^3) | S(n) = 2n^2 + n
    
    n = length(A);
    B = eye(n, n);
    X = zeros(n, n);
    y = zeros(n, 1);
    
    [A, p, info] = myplufatt(A);
    B(:, :) = B(p, :);
    
    if info == -1
        disp('Elemento sulla diagonale nullo')
        return
    end
    
    for i = 1:n
        y = myfw(A, B(:, i));
        X(:,i) = mybw(A, y);
    end
    A = X;
end