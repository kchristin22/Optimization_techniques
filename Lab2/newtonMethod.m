function [minvalue,iterations] = newtonMethod(x0,y0,f,gamma_index,max_iterations)
    e = 1e-3; % talk about how iterations don't have a great effect on the min value of f in gamma_index=2
    iterations = 0;
    
    syms x y;
    dfx = matlabFunction(gradient(f,x));
    dfy = matlabFunction(gradient(f,y));
    fgradient = matlabFunction(gradient(f, [x,y]));
    grad_magnitude = @(x,y) sqrt(dfx(x,y)^2 + dfy(x,y)^2);
    fhessian =matlabFunction(hessian(f,[x,y]));
   
    while grad_magnitude(x0,y0) >= e % replace variables with values

        d = -inv(fhessian(x0,y0))*fgradient(x0,y0);
        dX = d(1,:);
        dY = d(2,:);
          
%          [R, P] = chol(fhessian(x0,y0));
%           if ne(P,0)
%               fprintf("The hessian matrix isn't positive definite\n")
%              break
%           end

%      or
%         hessian_matrix = fhessian(x0,y0);
%         if(hessian_matrix(1,1)<0 || det(hessian_matrix)<0)
%             fprintf("The hessian matrix isn't positive definite\n")
%             break
%         end

        grad_fx = dfx(x0,y0);
        grad_fy = dfy(x0,y0);

        gamma_step = setgamma(x0,y0,f,gamma_index,dX,dY,grad_fx,grad_fy);

        x0 = x0 + gamma_step*dX;
        y0 = y0 + gamma_step*dY;
    
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