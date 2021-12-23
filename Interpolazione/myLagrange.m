function f = myLagrange(xdata, ydata, z)
    % Questo algoritmo utilizza i polinomi fondamentali di Lagrange per
    % calcolare un polinomio interpolante nei punti dati 
    % 
    % INPUT
    %   xdata, ydata : Sono le coordinate dei nodi 
    % OUTPUT
    %   z     : Sono i punti in cui vogliamo calcolare il polinomio 
    % Calcola tutti i punti z simultaneamente 
    
    n = length(xdata);
    m = length(z);
    f = zeros(m);
    
    if n ~= length(ydata) 
        fprintf('I due vettori xdata e ydata devono essere della stessa dimensione');
    end
    
    for k = 1:n
        w = ones(m);
        % Il ciclo evita divisioni per 0 
        for j = [1:k-1 k+1:n] 
            % [z - xdata(j)] rappresenta omega(x) valutato in tutti gli z_i
            % [xdata(k) - xdata(j)] rappresenta w_k
            w = w .* (z-xdata(j))./(xdata(k)-xdata(j));
        end
        % Moltiplico tutto per y_k e aggiorno f
        f = f + w*ydata(k);
    end
    f = f(1, :);
end