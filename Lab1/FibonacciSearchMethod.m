function [calculations, minvalue, limits] = FibonacciSearchMethod(a,b,f,l)
    F = [];
    F(1) = 1;
    F(2) = 1;
    i = 3;
    while F(i-1) < (b-a)/l
        F(i) = F(i-1) + F(i-2);
        i = i+1;
    end
    n = i-1;  % number of calls of f(x) (= iterations)
    x1 = a + F(n-2)/F(n) * (b-a);
    x2 = a + F(n-1)/F(n) * (b-a);
    fx1 = choosefunction(f,x1);
    fx2 = choosefunction(f,x2);
    calculations = 1;
    limits = [a b];
    if l>0
        while calculations < (n-2)
            if fx1 < fx2
                b = x2;
                x2 = x1;
                x1 = a + F(n-calculations-2)/F(n-calculations) * (b-a);
                fx1 = choosefunction(f,x1);
            else
                a = x1;
                x1 = x2;
                x2 = a +  F(n-calculations-1)/F(n-calculations) * (b-a);
                fx2 = choosefunction(f,x2);
            end
            calculations = calculations + 1;
            limits = [limits; [a b]];
        end
        x2 = x1 + 0.001;
        if fx1 < choosefunction(f,x2)
            b = x2;
            if fx1 < choosefunction(f,a)
                 minvalue = fx1;
            else
                 minvalue = choosefunction(f,a);
            end
        else
            a = x1;
            if fx2 < choosefunction(f,b)
                 minvalue = fx2;
            else
                 minvalue = choosefunction(f,b);
            end 
        end
        limits = [limits; [a b]];
    end
end

