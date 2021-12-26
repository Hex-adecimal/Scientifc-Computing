function [x, ierr] = mySecant(f, x0, x1, tol, Kmax)
    % Questa funzione implementa il metodo delle secanti per la ricerca di
    % radici in un equazione non lineare
    %
    % Concettualmente simile a Newton, con la differenza che non c'è
    % bisogno di usare la derivata. Questo algoritmo ha un convergenza
    % superlineare, cioè 1<p<2. 
    % 
    % INPUT 
    %   f     : La funzione di cui vogliamo la radice
    %   x0,x1    : I punti iniziali 
    %   tol   : La tolleranza con cui accettiamo la soluzione 
    %   Kmax  : Il massimo numero di iterazioni richieste
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
    q0=f(x0); q1=f(x1);
    x = x1 - (q1*(x1-x0))/(q1-q0);
    
    err = abs(x - x1); % Calcolo l'errore
    % Aggiorno le variabili per la prossima iterazione
    x0=x1; q0=q1; q1=f(x); x1=x;
    
    
    k=1;
    while k<Kmax && err>tol
        % Eseguo un passo della successione
        x = x1 - (q1*(x1 - x0))/(q1-q0);
        
        % Calcolo l'errore
        err = abs(x - x1);
        % Aggiorno le variabili
        x0=x1; q0=q1; q1=f(x); x1=x;
        
        % Aggiorno l'indice
        k=k+1;
    end
    
    if err>tol
        ierr=-1;
    else
        ierr=0;
    end
    
    fprintf('Convergenza in %f dopo %d passi, con un errore di %f',x, k, err);
    
end
