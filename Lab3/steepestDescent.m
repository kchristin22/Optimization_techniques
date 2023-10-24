function [minvalue] = steepestDescent(x0,y0,f,gamma_step,max_iterations)
    e = 1e-3; 
    iterations = 0;
    
    syms x1 x2;
    dfx1 = matlabFunction(gradient(f,x1));
    dfx2 = matlabFunction(gradient(f,x2));

    grad_magnitude = @(x1,x2) sqrt(dfx1(x1)^2 + dfx2(x2)^2);

    while grad_magnitude(x0,y0) >= e  % replace variables with values
        
        grad_fx1 = dfx1(x0);
        grad_fx2 = dfx2(y0);
   

        x0 = x0 - gamma_step*grad_fx1;
        y0 = y0 - gamma_step*grad_fx2;
        if iterations == max_iterations
            break;
        end
        iterations = iterations + 1;
    end

    minvalue = double(subs(subs(f,x1,x0),x2,y0));

%     fprintf("x,y = %f\t",x0)
%     disp(y0)
%     fprintf("\n min value of f = %f",minvalue)
%     fprintf(",\t no. of iterations = %i \n", iterations)
end