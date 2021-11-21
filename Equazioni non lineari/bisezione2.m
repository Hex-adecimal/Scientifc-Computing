function alpha = bisezione2(f, a, b, tol)
    k = log2((b-a)/tol);
    
    if f(a)*f(b) > 0 
        disp('Gli estremi devono avere segno opposto')
        return
    end
    
    for i=1 : k
        c = (a+b)/2;
        if f(a)*f(c) > 0
            a = c;
        else
            b = c;
        end
    end
    alpha = c;
end