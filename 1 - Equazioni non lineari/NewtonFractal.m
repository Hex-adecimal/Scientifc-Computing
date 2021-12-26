function NewtonFractal(deg, f, df, root, tol, X, Y, Kmax)
    % INPUT
    % deg   : scalare, il grado del polinomio
    % f, df : funzioni, il polinomio e la sua derivata
    % root : vettore colonna, radici del polinomio
    % tol   : scalare, tolleranza delle radici
    % X, Y  : matrici, contengono la meshgrid dei vettori che rappresentano lo spazio
    % Kmax  : scalare, numero di iterazioni da fare nello spazio
    %
    % COSA FA
    % Dato un polinomio, stampa a video il corrispettivo frattale di Newton
    % PROBLEMA 
    % I punti che non convergono, vengono colorati come la prima radice
    
    % Servono per la stampa degli assi
    x = X(1, :);
    y = Y(:, 1);
    
    % Creo il piano complesso
    Z = X + 1i*Y;
    
    % Eseguo il metodo di Newton-Raphson per ogni punto del piano
    for i=1 : Kmax
       Z = Z - f(Z) ./ df(Z);
    end
    
    % Zf è la matrice che corrisponderà al frattale
    % In pratica inizialmente è piena di zeri, poi la riempo con
    % 1, 2, ..., k dove il numero rappresenta la radice che è stata
    % raggiunta da quel punto.
    % Zf(i, j) rappresenterà un colore, i e j saranno le posizioni iniziali
    % del punto
    Zf = zeros(length(X), length(Y));
    for i=1 : deg
        Zf(:, :) = Zf + (abs(Z - root(i)) < tol)*i;
    end
    
    for i=1 : length(X)
        for j=1 : length(Y)
           if Zf(i, j) == 0
              Zf(i, j) = deg + 1;
           end
        end
    end
    
    figure;
    %map = [138 43 226; 100 149 237; 153 50 204; 255 20 147; 255 105 180: 255 182 193; 147 112 219; 255 192 203];
    map = [138 43 226; 100 149 237; 153 50 204; 0 0 0];
    map = map ./ 255;
    colormap(map);
    image(x, y, Zf);
    
end
