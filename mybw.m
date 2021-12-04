function x = mybw(U, b)
    % INPUT
    % U è una matrice triangolare superiore che rappresenta un sistema
    % lineare
    % b è un vettore che rappresenta le soluzioni di un sistema lineare
    % OUTPUT
    % x è il vettore delle soluzioni del sistema lineare
    % ALGORITMO
    % Questo programma esegue un backward substitution
    % Calcolo la prima incognita del sistema che sarà direttamente l'ultimo
    % coefficiente diviso l'ultimo elemento della matrice.
    % Nel ciclo interno calcolo la somma di tutti gli elementi successivi,
    % dato che so il valore delle incognite. Nel ciclo esterno ottengo il
    % valore dell'incognita successiva sottraendo tutti i suoi elementi a
    % destra e poi dividendo per l'elemento sulla diagonale
    % Non sono eseguiti controlli sull'input
    % COMPLESSITA O(n^2)
    
    
    n = length(b);
    x = zeros(n, 1);
    check = size(U);
    
    if check(1) ~= check(2) || check(1) ~= n
        disp('Errore dimensione del sistema')
        return
    end
    
    x(n) = b(n) / U(n, n);
    
    for k=n-1 : -1 : 1
        x(k) = b(k);
        for j=k+1 : n
            x(k) = x(k) + U(k, j) * x(j);
        end
        % Omettere questo pezzo in caso di sistemi del tipo 
        % 
        %x(k) = x(k) / U(k, k);  
    end
end