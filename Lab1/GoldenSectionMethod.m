
% This function is the implemetation of the Golden Section Method 
% Arguments:
% [a,b]: scope of the function f
% l: final range of searching
function [calculations, minvalue, limits] = GoldenSectionMethod(a,b,f,l)
    phi = (sqrt(5)-1)/2;
    x1 = a + (1-phi)*(b-a);
    x2 = a + phi*(b-a);
    fx1 = choosefunction(f,x1);
    fx2 = choosefunction(f,x2);
    calculations = 1;
    limits = [a b];
    if l>0
        while (b-a) > l
            if fx1 < fx2
                b = x2;
                x2 = x1;
                fx2 = fx1;
                x1 = a + (1-phi)*(b-a);
                fx1 = choosefunction(f,x1);
               if fx1 < choosefunction(f,a)
                    minvalue = fx1;
                else
                    minvalue = choosefunction(f,a);
                end
            else
                a = x1;
                x1 = x2;
                fx1 = fx2;
                x2 = a + phi*(b-a);
                fx2 = choosefunction(f,x2);
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