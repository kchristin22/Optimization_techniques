function [calculations, minvalue, limits] = choosemethod(a,b,f,lconst,dconst,method)
    if method == 1
        [calculations, minvalue, limits] = BisectionMethod(a,b,f,lconst,dconst);
    elseif method == 2
        [calculations, minvalue, limits] = GoldenSectionMethod(a,b,f,lconst);
    elseif method == 3 
        [calculations, minvalue, limits] = FibonacciSearchMethod(a,b,f,lconst);
    elseif method == 4
        [calculations, minvalue, limits] = DifferentialMethod(a,b,f,lconst);
    end
end