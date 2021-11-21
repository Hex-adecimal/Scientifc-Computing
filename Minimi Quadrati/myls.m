function coeff = myls(xdata, ydata, m)
    % xdata : vettore riga : sono le ascisse dei punti dati
    % ydata : vettore riga : sono le ordinate dei punti dati
    % m : intero : è il numero di coefficienti del polinomio
    % Questa funzione restituisce in ordine i coefficienti a_0, ..., a_m;
    % Non c'è alcun controllo sull'input;
    % Si basa sul metodo dei minimi quadrati;
    
    m = m-1;
    n = length(xdata) - 1;
    B = ones(n+1, m+1);
    b = zeros(n+1, 1);
    A = zeros(m+1, m+1);
    
    for i=2 : m+1
        B(:, i) = (xdata').^(i-1);
    end

    A = B'* B;
    b = B' * ydata';
    coeff = (A\b)';
end
