function [alpha] = Newton_Raphson(f, x0, Kmax, tol)
    % Alpha is the solution
    % Iteration is the number of iteration that this function do 
    
    i = 1;
    x = x0 - f(x0)/diff(f(x0));
    e = abs(x0 - x);
    
    
    if e > tol
        while i < Kmax && e > tol
            px = x;
            x = x - f(x0)/diff(f(x0));
            e = abs(x - px);
        end
    end
    
    alpha = x;
end