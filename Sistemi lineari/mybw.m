function x = mybw(U, b)
    % INPUT
    % U è una matrice triangolare superiore 
    % b è il vettore dei termini noti
    % OUTPUT
    % x è il vettore delle soluzioni
    % ALGORITMO
    % Questo programma esegue un backward substitution
    % COMPLESSITA O(n^2)
    
    n = length(b);
    x = zeros(n, 1);
    check = size(U);
    
    if check(1) ~= check(2) || check(1) ~= n
        disp('Errore dimensione della matrice')
        return
    end
    
    for k = n:-1:1
        j = k+1:n;
        x(k) = (x(k) - U(k,j)*x(j))/U(k,k);
    end
end