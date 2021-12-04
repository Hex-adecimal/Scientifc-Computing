function y = myfw(L, b)
    % INPUT
    % L è una matrice triangolare inferiore che rappresenta un sistema
    % lineare
    % b è un vettore che rappresenta le soluzioni di un sistema lineare
    % OUTPUT
    % x è il vettore delle soluzioni del sistema lineare
    % ALGORITMO
    % Questo programma esegue un forward substitution
    % Calcolo la prima incognita del sistema che sarà direttamente il primo
    % coefficiente diviso il primo elemento della matrice.
    % Nel ciclo interno calcolo la somma di tutti gli elementi precedenti,
    % dato che so il valore delle incognite. Nel ciclo esterno ottengo il
    % valore dell'incognita successiva sottraendo tutti i suoi elementi a
    % sinistra e poi dividendo per l'elemento sulla diagonale
    % Non sono eseguiti controlli sull'input
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
