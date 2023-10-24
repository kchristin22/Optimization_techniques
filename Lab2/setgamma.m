function gamma_step = setgamma(x0,y0,f,gamma_index,dX,dY,grad_fx,grad_fy)

    syms x y
    F = matlabFunction(f);

    if gamma_index == 1 
            gamma_step = 0.5; 
    
    elseif gamma_index == 2
            phi = @(gamma_var) F(x0+gamma_var*dX,y0+gamma_var*dY);
            gamma_step = fminbnd(phi,0,10); 
            % Ιf you solve the diff= 0 with vpasolve, it will
            % return the first solution that it'll find and it may be a
            % max
            
    elseif gamma_index == 3
            a = 1e-3;
            b = 0.2;
            s = 1e-0;
            m = 0;
            gamma_step = s*b^m;
            x1 = x0 + gamma_step*dX;
            y1 = y0 + gamma_step*dY;
            while F(x0,y0) - F(x1,y1) < -a*b^m*s*(dX*grad_fx+dY*grad_fy)
                m = m+1; % as we want to find the smallest gamma value, m cannot be negative due to b<1
                gamma_step = s*b^m;
                x1 = double(x0 + gamma_step*dX);
                y1 = double(y0 + gamma_step*dY);
            end
    end
end