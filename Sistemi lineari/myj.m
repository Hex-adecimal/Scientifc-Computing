function [x,ierr]=myj(a,r,c,b,x0,Kmax,tol)
    % Questa funzione implementa il metodo iterativo di Jacobi per la
    % risoluzione di sistemi lineari, utilizzando matrici sparse per una
    % maggiore ottimizzazione spaziale e temporale.
    %
    % INPUT
    % i 3 vettori a, r, c, tutti di dimensione n_nz, rappresentano la 
    % matrice A in formato COO (Elenco Coordinate)
    % b : il vettore dei termini noti di dimensione n
    % x0 : l’approssimazione iniziale della soluzione (default 0)
    % Kmax : il numero massimo di iterazioni consentite (deafult 1000)
    % tol : la tolleranza sull’errore
    %
    % OUTPUT
    % x : stima della soluzione
    % ierr = -1 -> tolleranza non raggiunta
    % ierr = 0 -> tolleranza raggiunta
    
    % Inizializzazione dei valori di default 
    if nargin < 4
        return
    elseif nargin == 4
        x0 = sparse(zeros(length(b), 1));
        Kmax = 1000;
        tol = 0.0001;
    elseif nargin == 5
        Kmax = 1000;
        tol = 0.0001;
    elseif nargin == 6
        tol = 0.0001;
    end
    
    % Inizializzazione della matrice
    A = sparse(r, c, a);
    b = sparse(b);
    max(abs(eigs(A)))
    
    % Creo la matrice T ed il vettore c
    invD = inv(diag(diag(A))); L = -tril(A, -1); U = -triu(A, 1);
    T = invD*(L+U); %#ok<MINV>
    c = invD*b; %#ok<MINV>
    
    x = x0;
    k = 1;
    ierr = -1;
    
    while k<Kmax
        prevx = x;
        x = T*prevx + c;
        
        if norm(x - prevx, "inf")/norm(x, "inf") < tol
            disp('E stata raggiunta la precisione data')
            k
            ierr = 0;
            break
        end
        k = k+1;
    end
    
end
