
% This function is the implemetation of the Bisection Method 
% Arguments:
% [a,b]: scope of the function f
% l: final range of searching
% d: distance from the bisector
function [calculations, minvalue, limits] = BisectionMethod(a,b,f,l,d)
    calculations = 1;
    limits = [a b];
    if d>0 && d<(b-a)/2 && l>0
        while (b-a) > l
            x1 = (a+b)/2 - d;
            x2 = (a+b)/2 + d;
            fx1 = choosefunction(f,x1);
            fx2 = choosefunction(f,x2);
            if fx1 < fx2
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
            calculations = calculations + 1;
            limits = [limits; [a b]];
        end
    end
end

