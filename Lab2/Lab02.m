% Declare the variables and the function to get its plots
% figure("Name","f")
% zfun = @(x,y) x.^5 .* exp(-x.^2 -y.^2);
% fsurf(zfun)
% title("Plot of f")
% xlabel('x')
% ylabel('y')

syms x y;
f = x^5 * exp(-x^2 -y^2);
% fgradient = gradient(f,[x y]);
% figure("Name","gradient of f")
% fsurf(fgradient)
% title("Plot of the gradient of f")
% xlabel('x')
% ylabel('y')

%[minvalue, iterations] = steepestDescent(1,-1,f,3,1000);
%[minvalue1, iterations1] = newtonMethod(-1,1,f,1,1000);
%[minvalue2, iterations2] = levenbergMarquardtMethod(1,-1,f,3,1000);

%method_plots(-1,1,f,1,1)

% Graph the estimated min value calculated by each method by determining 
% the max value of their iterations and the method gamma is calculated by
%
% Note: when using this function,  comment out the printed outputs of each
% method to avoid clogging your command window
function method_plots(x0,y0,f,gamma_index,method)
    PlotArray = zeros([], 1);
    
    if method == 1
        for iterations = 10 : 5 : 100
            [minvalue, actual_iterations] = steepestDescent(x0,y0,f,gamma_index,iterations);
            PlotArray(iterations,1) = actual_iterations;
            PlotArray(iterations,2) = minvalue;
            iterations = iterations + 1;
        end
        figure("Name","Estimation of the min value per max iterations")
        plot(PlotArray(:,1),PlotArray(:,2))
        title("Steepest Descent Method: Estimated min value per max iterations")
        xlabel('Iterations')
        ylabel('Estmated min value')
    elseif method == 2
        for iterations = 1 : 1 : 1000
            [minvalue, actual_iterations] = newtonMethod(x0,y0,f,gamma_index,iterations);
            PlotArray(iterations,1) = actual_iterations;
            PlotArray(iterations,2) = minvalue;
            iterations = iterations + 1;
        end
        figure("Name","Estimation of the min value per max iterations")
        plot(PlotArray(:,1),PlotArray(:,2))
        title("Newton Method: Estimation of the min value per max iterations")
        xlabel('Iterations')
        ylabel('Estmated min value')
    elseif method ==3
        for iterations = 1 : 1 : 1000
            [minvalue, actual_iterations] = levenbergMarquardtMethod(x0,y0,f,gamma_index,iterations);
            PlotArray(iterations,1) = actual_iterations;
            PlotArray(iterations,2) = minvalue;
            iterations = iterations + 1;
        end
        figure("Name","Estimation of the min value per max iterations")
        plot(PlotArray(:,1),PlotArray(:,2))
        title("Levenberg-Marquardt Method: Estimation of the min value per max iterations")
        xlabel('Iterations')
        ylabel('Estmated min value')
    end
end