% Declare the variables and the function to get its plot with its gradient
% 
syms x y;
f = (x^2) / 3 + 3*y^2;
fsurf(f)
[X,Y] = meshgrid(-5:1:5,-5:1:5);
Z = X.^2/3 + 3*Y.^2;
dfx = gradient(f,x);
dfy = gradient(f,y);
DX = subs(dfx,x,X);
DY = subs(dfy,y,Y);
grad_magnitude = sqrt(DX.^2+DY.^2);
hold on
quiver3(X,Y,Z,DX,DY,grad_magnitude)
hold off
title("Plot of f and gradient of f")
xlabel('x')
ylabel('y')

syms x1 x2
f = x1^2/3 + 3*x2^2;

% method_plots(f,0.1)

% [minvalue1] = steepestDescent(8,-10,f,0.2,10000);

 [minvalue] = steepestDescentProjection(8,-10,f,0.1,0.2,10000);


% Graph the estimated min value calculated by each method by determining 
% the max value of their iterations and the method gamma is calculated by
%
% Note: when using this function,  comment out the printed outputs of each
% method to avoid clogging your command window
function method_plots(f,gamma_value) % now we'll see the min value with each pont as a starting one-> better than returning the (x,y) final values
    PlotArray = zeros([], []);
    iterations = 1;
    for x1 = -2 : 1e-1 : 2
        for x2 = -2 : 1e-1 : 2
        [minvalue] = steepestDescent(x1,x2,f,gamma_value,1000);
        PlotArray(iterations,1) = x1;
        PlotArray(iterations,2) = x2;
        PlotArray(iterations,3) = minvalue;
        iterations = iterations + 1;
        end
    end
        figure("Name","Estimation of the min value per starting point")
        x = PlotArray(:,1);
        y = PlotArray(:,2);
        z = PlotArray(:,3);

        [X,Y]=meshgrid(x,y);
        Z=griddata(x,y,z,X,Y,'cubic'); 

        %visualization
        mesh(X,Y,Z);
        axis tight; hold on
        plot3(x,y,z,'.', 'MarkerSize',15)
        title("Steepest Descent Method: Estimated min value per starting point, for gamma = ",gamma_value)
        xlabel('x1')
        ylabel('x2')
end
