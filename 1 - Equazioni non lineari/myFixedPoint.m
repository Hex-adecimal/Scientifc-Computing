function [x, ierr] = myFixedPoint(g, x0, tol, Kmax)
    % Questa funzione implementa il metodo di punto fisso per la ricerca di
    % radici in un equazione non lineare
    %
    % ...
    % 
    % La velocità di convergenza di questo metodo dipende dalla funzione g
    %
    % INPUT
    %   g     : E' la funzione di punto fisso
    %   x0    : L’approssimazione iniziale
    %   tol   : La tolleranza desiderata
    %   Kmax  : Il numero massimo di iterazioni
    % OUTPUT
    %   x     :  L’approssimazione calcolata
    %    ierr  : L'indicatore dell'errore 
    %               0 -> tolleranza soddisfata
    %               1 -> altrimenti
    ierr=-1;
    
    % Imposto i valori di default in caso non vengano inseriti
    if nargin<1
        fprintf('Mancano troppi parametri');
        return
    elseif nargin<2
        x0=0;
        tol=10^-5;
        Kmax=20;
    elseif nargin<3
        tol=10^-5;
        Kmax=20;
    elseif nargin<4
        Kmax=20;
    end
    
    x = x0; prevx = x0;
    
    k=1;
    while k<Kmax
        % Calcolo un passo della successione
        x = g(x); 
        
        err = abs((x - prevx)/x);
        prevx = x;
        if err<tol
            ierr=0;
            break
        end
        k=k+1;
    end
    
    fprintf('Convergenza in %f dopo %d passi, con un errore di %f',x, k, err);
end
