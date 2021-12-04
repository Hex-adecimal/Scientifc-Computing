function A = myChol(A)
    n = length(A);
    R = zeros(n, n);
    
    R(1, 1) = sqrt(A(1, 1));
    for j=2 : n
        for i=1 : n
            R(i, j) = (A(i, j) - sum(R(1:i-1, i)*R(1:i-1, j))) / R(i, i);
        end
        R(j, j) = sqrt(A(j, j) - sum(R(1:j-1, j)));
    end
    
end