function [x,ierr]=myNewton(f,fp,x0,tol,Kmax)
    % Questo algoritmo implementa il metodo di Newton-Raphson per la
    % ricerca di radici in un equazione non lineare
    %
    % Questo algoritmo non converge sempre per ogni scelta di x0, sappiamo
    % solo che sotto le condizioni del teorema esiste un delta > 0 dove
    % nell'intervallo per ogni x0 in [alpha-delta, alpha+delta] il metodo
    % converge. 
    %
    % Inoltre se la funzione in alpha è nulla, sappiamo che la convegenza
    % di questo metodo è quadratica. 
    %
    % INPUT
    %   f     : La funzione di cui vogliamo la radice
    %   fp    : La derivata della funzione in input
    %   x0    : Il punto iniziale (default 0)
    %   tol   : La tolleranza con cui accettiamo la soluzione (default 10^-5)
    %   Kmax  : Il massimo numero di iterazioni richieste (default 20)
    % OUTPUT
    %   x     : L'approssimazione calcolata
    %   ierr  : L'indicatore dell'errore 
    %               0 -> tolleranza soddisfata
    %               1 -> altrimenti
    
    % Imposto i valori di default in caso non vengano inseriti
    if nargin==1
        fprintf('Mancano troppi parametri');
        return
    elseif nargin<3
        x0=0;
        tol=10^-5;
        Kmax=20;
    elseif nargin<4
        tol=10^-5;
        Kmax=20;
    elseif nargin<5
        Kmax=20;
    end
    
    % Eseguo il primo passo fuori dal while
    x = x0 - f(x0)/fp(x0);
    err = abs((x - x0)/x);
    prevx = x0;
    
    k=1; 
    while k<Kmax && err>tol
       % Eseguo un passo della successione
       x = x - f(x)/fp(x);
       
       % Calcolo l'errore e aggiorno l'x del passo precedente
       err = abs((x - prevx)/x); 
       prevx = x;
        
       % Incremento l'indice
       k=k+1;
    end
    
    if err<tol
           ierr=0;
    end
    
    fprintf('Convergenza in %f dopo %d passi, con un errore di %f',x, k, err);
    
end
