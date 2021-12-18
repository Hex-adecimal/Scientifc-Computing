function [x, ierr] = myBisection(f, a, b, tol, Kmax) 
    % Questo algoritmo implementa il metodo di Bisezione per la ricerca di
    % radici di un equazione non lineare. 
    %
    % Perchè l'algoritmo converga è necessario che la funzione sia continua 
    % in [a,b] con f(a) ed f(b) di segno opposto. 
    % Quindi per il Teorema dei valori intermedi esiste un punto p : f(p) = 0
    % La velocità di convergenza di questo algoritmo è ~lineare~ con una
    % costante C = 1/2
    %
    % INPUT
    %   f     : La funzione di cui c'è bisogno di trovare la radice
    %   a,b   : Gli estremi dell intervallo [a,b]
    %   tol   : La tolleranza con cui accettiamo la soluzione 
    %   Kmax  : Il massimo numero di iterazioni richieste
    % OUTPUT
    %   x     : La radice trovata
    %   ierr  : L'indicatore dell'errore 
    %               0 -> tolleranza soddisfata
    %               1 -> altrimenti
    
    % Calcolo una volta gli estremi, per risparmiare valutazioni di f
    FB=f(b); FA=f(a);
    % Suppongo che non rispetterò la tolleranza, ma solo per una migliore leggibilità del codice
    ierr = -1; 
    
    % Controllo la condizione necessaria 
    if FA * FB > 0 
        fprintf('Gli estremi devono avere segni opposti!');
        return 
    end
    
    k=1; err=1; 
    while  k<Kmax
        % Inoltre è utile avere un numero massimo di iterazioni in caso
        %   l'algoritmo ne impieghi troppe (k < Kmax)
        
        % Dimezzo l'intervallo in cui cerco la radice
        % Valuto f nel punto trovato per vedere se devo cercare a dx o sx
        p = a+b/2; FP = f(p);
        if FP*FA > 0
            a = p; FA = FP;
        else
            b = p;
        end
        
        % Calcolo l'errore
        err = abs((FP - err)/err);
        
        % Il miglior criterio per fermare un metodo iterativo è verificare che
        %   l'errore relativo sia minore di un certo epsilon (err < tol)
        if err<=tol 
           ierr = 0;
           break
        end
        
        % Incremento l'indice
        k=k+1;
    end
    
    fprintf('Convergenza dopo %d passi, con un errore di %e', k, err);
    x = p;
end