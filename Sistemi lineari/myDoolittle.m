function A = myDoolittle(A)
    
    n = length(A);
    L = zeros(n, n);
    U = zeros(n, n);
    
    for k=1 : n
        for j=k : n
            U(k, j) = A(k, j) - sum( L(k, 1:k-1) * U(1:k-1, j)) ;
            for i=k+1 : n
                L(i, k) = (A(i, k) - sum( L(i, k) * U(1:(k-1), k) ) ) / U(k, k);
            end
        end
    end
    
    A = L*U;
end
