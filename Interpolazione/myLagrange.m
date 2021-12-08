function f = myLagrange(xdata, ydata, z)
    % (xdata, ydata) = (x_i, y_i)
    % z : vettore di ascisse su cui vogliamo sapere il valore del polinomio
    % n : numero di nodi
    % L : matrice dove ogni riga corrisponde ad un polinomio di lagrange Lj
    
    n = length(xdata);
    m = length(z);
    L = ones(n, m); 
    f = zeros(m, 1);
    
    for i=1 : n
        product = ydata(i);
        for j=1 : n
            if i ~= j
                product = product .* ((z-xdata(j)) ./ (xdata(i)-xdata(j)));
            end
        end
        L(i, :) = product;
    end
    
    f(:) = sum(L);
end
