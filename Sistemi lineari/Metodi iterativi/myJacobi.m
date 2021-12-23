function [x, ierr] = myJacobi(a, r, c, b, x0, Kmax, tol)
    % Questa funzione implementa il metodo iterativo di Jacobi per la
    % ricerca di soluzioni di un sistema lineare
    %
    % Utilizza un criterio d'arresto che sfrutta l'errore relativo,
    % conviene usare questo programma se la matrice è sparsa e convergente
    % 
    % INPUT
    %   a,r,c : Sono vettori per la memorizzazione della matrice tramite il
    %   formato COO
    %   Kmax  : Il massimo numero di iterazioni 
    %   tol   : La tolleranza richiesta
    % OUTPUT
    %   x     : La stima ottenuta per la soluzione
    %   ierr  : Indicatore di errore
    
    % Controllo che i vettori a,r,c
    if length(a) ~= length(r) || length(r) ~= length(c)
        fprintf('I vettori a,r,c devono avere la stessa dimensione');
        return
    end
    
    % Inizializzazione dei valori di default 
    if nargin < 4
        return
    elseif nargin == 4
        x0 = sparse(zeros(length(b), 1)); Kmax = 1000; tol = 0.0001;
    elseif nargin == 5
        Kmax = 1000; tol = 0.0001;
    elseif nargin == 6
        tol = 0.0001;
    end
    
    % Creo la matrice sparsa
    A = sparse(r, c, a);  %max(eigs(A)) % Per il raggio spettrale
    b = sparse(b);
    
    n = length(A); x = zeros(n, 1); ierr = -1;
    px = x0;
    
    k=1;
    while k<Kmax
        % Eseguo un passo della successione
        for i = 1:n
            j = [1:i-1 i+1:n];
            x(i) = (b(i) - sum(A(i, j)*px(j))) / A(i, i);
        end
        % Controllo se ho soddisfatto la tolleranza
        if norm(x - px, "inf")/norm(x, "inf") < tol
           ierr = 0;
           break
        end
        px = x; k=k+1;
    end
    k
end
