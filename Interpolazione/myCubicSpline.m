function spval = myCubicSpline(xdata, ydata, zval)
    
    n = length(xdata);
    h = zeros(n-1, 1);
    A = zeros(n, n);
    delta = zeros(n, 1);
    
    b = zeros(n, 1);
    d = zeros(n, 1);
    
    spval = zeros(length(zval), 1);
    
    % Distanze tra i vari punti 
    for j=1 : n-1
        h(j) = xdata(j+1) - xdata(j);
    end
    
    % Matrice dei coefficienti
    A(1, 1) = 1; A(n, n) = 1;
    for i=2 : n-1
        A(i, i) = 2*(h(i-1) + h(i)); % Diagonale principale
        A(i, i-1) = h(i-1); % Diagonale inferiore
        A(i, i+1) = h(i); % Diagonale superiore
    end
    
    % Vettore delle soluzioni
    for i=2 : n-1
        delta(i) = (3/h(i))*(ydata(i+1) - ydata(i)) - (3/h(i-1))*(ydata(i) - ydata(i-1));
    end
    
    % Posso rendere il sistema sparso per risparimare operazioni
    % A = sparse(A); delta = sparse(delta);
    
    % Calcolo le incognite
    x = A\delta;
    
    % Ottengo i valori per i vincoli
    for i=1 : n-1
        b(i) = (ydata(i+1) - ydata(i))/h(i) - (h(i)/3)*(x(i+1) + 2*x(i));
        d(i) = (x(i+1) - x(i))/(3*h(i));
    end
    
    % Calcolo la spline nei punti assegnati
    for i=1 : length(zval)
        for j=1 : n-1
           if(zval(i) >= xdata(j) && zval(i) <= xdata(j+1))
               spval(i) = ydata(j) + b(j)*(zval(i) - xdata(j)) + x(j)*(zval(i) - xdata(j))^2 + d(j)*(zval(i) - xdata(j))^3;
           end
        end
    end
end