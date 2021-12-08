function [A, p, info] = myplufatt(A)
    % p, in output: è il vettore di permutazione che registra gli scambi 
    % effettuati dalla strategia del pivoting parziale.
    % info, in output: info=0, a meno che la routine non stabilisca un 
    % errore (info=-1, se `e stato trovato un elemento pivot nullo, in 
    % questo caso si salta il passo e la procedura continua).
    % COMPLESSITA O(n^3)
    
    info = 0;
    n = length(A);
    p = (1:n)';
    
    for k = 1:n-1
        % Il più grande elemento sotto la diagonale alla k-esima colonna
        [~,m] = max(abs(A(k:n,k)));
        m = m+k-1;
        
        % Se l'elemento è nullo, allora non eseguiamo il passo
        if (A(m,k) ~= 0)
            % Scambiamo la riga pivot
            if (m ~= k)
                A([k m],:) = A([m k],:);
                p([k m]) = p([m k]);
            end
            
            % Calcolo il moltiplicatore
            i = k+1:n;
            A(i,k) = A(i,k)/A(k,k);
            
            % Aggiorno il resto della matrice
            j = k+1:n;
            A(i,j) = A(i,j) - A(i,k)*A(k,j);
        else
            info = -1;
        end
    end
    
    if A(n,n) == 0
        info = -1;
    end
    
    % Se volessi ottenere L ed U
    % L = tril(A,-1) + eye(n,n);
    % U = triu(A);
    
end