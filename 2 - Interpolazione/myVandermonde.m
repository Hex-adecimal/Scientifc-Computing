function a = myVandermonde(X, Y) 
    % Questa funzione utilizza la matrice di Vandermonde per
    % l'interpolazione di n+1 punti
    %
    % Attenzione la matrice di Vandermonde è mal condizionata! Ed inoltre
    % questo algoritmo ha una complessità di O(n^3) (ris. sist. lin.)
    % 
    % INPUT 
    %   X,Y : vettori che contengono i nodi (x_i, y_i)
    % OUPUT
    %   a   : coefficienti del polinomio interpolante
    
    V = fliplr(vander(X));
    a = V\Y;
end
