function [t, y] = myEuler(fname, y0, t0, T, N)
    % Questa funzione implementa il metodo di Eulero per la ricerca di una
    % soluzione ad un equazione differenziale
    %
    % Perchè la soluzione sia unica, allora fname deve essere continua e
    % Lipschitziana rispetto a y in D
    %
    % INPUT
    %   fname : La funzione f(t, y(t))
    %   y0    : Il valore iniziale
    %   t0, T : Gli estremi dell'intervallo di integrazione
    %   N     : Il numero di intervallini in cui suddividere [t0, T]
    % OUTPUT
    %   t     : L'insieme di rete t0, t1, ..., tN
    %   y     : L'approssimazione della soluzione nei punti di rete
    
    if nargin < 5 
        return 
    end
    
    h = (T-t0)/N; % Passo di discretizzazione
    t = t0:h:T;   % Intervallo di integrazione
    
    % Inizializzo y
    y = zeros(1, N); y(1) = y0; 
    
    for k = 1:N
        y(k+1) = y(k) + h*fname(t(k), y(k)); % Eseguo un passo
    end
    
end