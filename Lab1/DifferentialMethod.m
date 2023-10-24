function [calculations, minvalue, limits] = DifferentialMethod(a,b,f,l)
    n = 0; % if n is negative, the value of (1/2)^n will be >=2 >> (l/(b-a))
    while power(1/2,n) > (l/(b-a))
        n = n+1;
    end
    calculations = 1;
    limits = [a b];
    while calculations < n
        x = (a + b)/2;
        diffx = choosederivative(f,x);
        if diffx== 0
            break
        elseif diffx > 0
            b = x;
        else
            a = x;
        end
        calculations = calculations + 1;
        limits = [limits; [a b]];
    end
    %fprintf("%i",x);
    minvalue = choosefunction(f,x);
end

