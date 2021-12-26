function y = myfw(L, b)
    % Questo funzione implementa l'algoritmo di foreward substitution per
    % la risoluzione di sistemi lineari con matrici triangolari inferiori
    % NOTA : Solo se è stata eseguita la fattorizzazione LU memorizzando LU
    % in A (con l_ii = 1 per ogni i)
    %
    % INPUT
    %   L : Una matrice triangolare inferiore 
    %   b : Il vettore dei termini noti
    % OUTPUT
    %   x : Il vettore delle soluzioni
    % COMPLESSITA O(n^2)
    
    n = length(b);
    y = zeros(n, 1);
    check = size(L);
    
    % Controllo che la dimensione della matrice sia coerente con la
    % dimensione di b
    if check(1) ~= check(2) || check(1) ~= n
        disp('Errore dimensione del sistema')
        return
    end
    
    y(1) = b(1) / L(1, 1);
    for k=2 : n
        y(k) = b(k);
        for j=1 : k-1
            y(k) = y(k) - L(k, j) * y(j);
        end
        
        %y(k) = y(k) / L(k, k); % Eliminare per una funz. più generale
    end
end