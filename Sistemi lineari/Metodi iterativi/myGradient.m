function x = myGradient(A, b, x, Kmax, tol) 
    % Questa funzione implementa il metodo del gradiente per la ricerca di
    % soluzioni di un sistema lineare
    %
    % Converge per ogni x0 se la matrice è simmetrica definita positiva
    %
    % INPUT
    %   A    : La matrice che rappresenta il sistema da risolvere
    %   b    : Il vettore dei coefficienti del sistema
    %   x    : L'approssimazione iniziale
    %   Kmax : Il numero massimo di iterazioni
    %   tol  : La tolleranza sulla soluzione
    % OUTPUT
    %   x    : L'approssimazione trovata 
    %   k    : Il numero di iterazioni impiegate
    
    k=1; r=b-A*x;
    while k<Kmax && norm(r)/norm(b) > tol
        alpha = (r'*r) / (r'*A*r);  % Calcolo la distanza da percorrere
        x = x + alpha*r;            % Eseguo il passo
        r = r - alpha*A*r;          % Calcolo la prossima direzione
        
        k = k+1;
    end
end
