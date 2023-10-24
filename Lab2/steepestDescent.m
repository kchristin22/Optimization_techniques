function [minvalue,iterations] = steepestDescent(x0,y0,f,gamma_index,max_iterations)
    e = 1e-3; 
    iterations = 0;
    
    syms x y;
    dfx = matlabFunction(gradient(f,x));
    dfy = matlabFunction(gradient(f,y));
    
    grad_magnitude = @(x,y) sqrt(dfx(x,y)^2 + dfy(x,y)^2);

    while grad_magnitude(x0,y0) >= e  % replace variables with values
        
        grad_fx = dfx(x0,y0);
        grad_fy = dfy(x0,y0);
   

        gamma_step = setgamma(x0,y0,f,gamma_index,-grad_fx,-grad_fy,grad_fx,grad_fy);

        x0 = x0 - gamma_step*grad_fx;
        y0 = y0 - gamma_step*grad_fy;
        if iterations == max_iterations
            break;
        end
        iterations = iterations + 1;
    end

    minvalue = double(subs(subs(f,x,x0),y,y0));

    fprintf("x,y = %f\t",x0)
    disp(y0)
    fprintf("\n min value of f = %f",minvalue)
    fprintf(",\t no. of iterations = %i \n", iterations)
end