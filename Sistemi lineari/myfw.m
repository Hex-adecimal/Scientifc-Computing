function y = myfw(L, b)
    % INPUT
    % L è una matrice triangolare inferiore 
    % b è il vettore dei termini noti
    % OUTPUT
    % x è il vettore delle soluzioni
    % ALGORITMO
    % Questo programma esegue un forward substitution
    % COMPLESSITA O(n^2)
    
    
    n = length(b);
    y = zeros(n, 1);
    check = size(L);
    
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
        
        %y(k) = y(k) / L(k, k);
    end
end