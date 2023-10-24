function [minvalue] = steepestDescentProjection(x01,x02,f,s,gamma_step,max_iterations)
    e = 1e-2; 
    iterations = 0;
    
    syms x1 x2;
    dfx1 = matlabFunction(gradient(f,x1));
    dfx2 = matlabFunction(gradient(f,x2));

    grad_magnitude = @(x1,x2) sqrt(dfx1(x1)^2 + dfx2(x2)^2);

    while grad_magnitude(x01,x02) >= e  
        
        grad_fx1 = dfx1(x01);
        grad_fx2 = dfx2(x02);
   

        new_x1 = x01 - s*grad_fx1;
        new_x2 = x02 - s*grad_fx2;

        if new_x1 <= -10 % choose projected x1
           xP1 = -10;
        elseif new_x1 >= 5
           xP1 = 5;
        else
           xP1 = new_x1;
        end

        if new_x2 <= -8 % choose projected x1
           xP2 = -8;
        elseif new_x2 >= 12
           xP2 = 12;
        else
           xP2 = new_x2;
        end

        x01 = x01 + gamma_step * (xP1 - x01);
        x02 = x02 + gamma_step * (xP2 - x02);

        if iterations == max_iterations
            break;
        end
        iterations = iterations + 1;
    end

    minvalue = double(subs(subs(f,x1,x01),x2,x02));

    fprintf("x1,x2 = %f\t",x01)
    disp(x02)
    fprintf("\n min value of f = %f",minvalue)
    fprintf(",\t no. of iterations = %i \n", iterations)
end