% Use these lines to graph the plots regarding the Bisection Method
% for each function:
% method_plots(-1,3,1,0.01,0.001,1,1) % f1 -> iterations and estimated min value per d
% method_plots(-1,3,1,0.01,0.001,1,2) % f1 -> iterations and estimated min value per l
% method_plots(-1,3,1,0.01,0.001,1,3) % f1 -> limits per l
% method_plots(-1,3,2,0.01,0.001,1,1) % f2 -> iterations and estimated min value per d
% method_plots(-1,3,2,0.01,0.001,1,2) % f2 -> iterations and estimated min value per l
% method_plots(-1,3,2,0.01,0.001,1,3) % f2 -> limits per l
% method_plots(-1,3,3,0.01,0.001,1,1) % f3 -> iterations and estimated min value per d
% method_plots(-1,3,3,0.01,0.001,1,2) % f3 -> iterations and estimated min value per l
% method_plots(-1,3,3,0.01,0.001,1,3) % f3 -> limits per l


% To get the value of l from the command window, 
% use the following lines of code instead:
%l = input("Choose the final range\n");
%figure()
% method_plots(-1,3,1,l,0.001,1,1)
% method_plots(-1,3,2,l,0.001,1,1)
% method_plots(-1,3,3,l,0.001,1,1)

% Use these lines to graph the plots regarding the Golden Section Method
% for each function:
% method_plots(-1,3,1,0.01,0.001,2,2) % f1 -> iterations and estimated min value per l
% method_plots(-1,3,1,0.01,0.001,2,3) % f1 -> limits per l
% method_plots(-1,3,2,0.01,0.001,2,2) % f2 -> iterations and estimated min value per l
% method_plots(-1,3,2,0.01,0.001,2,3) % f2 -> limits per l
% method_plots(-1,3,3,0.01,0.001,2,2) % f3 -> iterations and estimated min value per l
% method_plots(-1,3,3,0.01,0.001,2,3) % f3 -> limits per l

% Use these lines to graph the plots regarding the Fibonacci Search Method
% for each function:
 method_plots(-1,3,1,0.01,0.001,3,2) % f1 -> iterations and estimated min value per l
% method_plots(-1,3,1,0.01,0.001,3,3) % f1 -> limits per l
% method_plots(-1,3,2,0.01,0.001,3,2) % f2 -> iterations and estimated min value per l
% method_plots(-1,3,2,0.01,0.001,3,3) % f2 -> limits per l
% method_plots(-1,3,3,0.01,0.001,3,2) % f3 -> iterations and estimated min value per l
% method_plots(-1,3,3,0.01,0.001,3,3) % f3 -> limits per l

% Use these lines to graph the plots regarding the Bisection Method with
% the use of derivatives for each function:
% method_plots(-1,3,1,0.01,0.001,4,2) % f1 -> iterations and estimated min value per l
% method_plots(-1,3,1,0.01,0.001,4,3) % f1 -> limits per l
% method_plots(-1,3,2,0.01,0.001,4,2) % f2 -> iterations and estimated min value per l
% method_plots(-1,3,2,0.01,0.001,4,3) % f2 -> limits per l
% method_plots(-1,3,3,0.01,0.001,4,2) % f3 -> iterations and estimated min value per l
% method_plots(-1,3,3,0.01,0.001,4,3) % f3 -> limits per l

%% 

% This function prints all the graphs for each optimization method.
% The use of an index gives the user the choice of not printing all the
% graphs at once.
% index = 
%           1 : Prints the number of times the method function
%               is called and an estimated min value of the function f
%               depending on the distance from the bisector (use only with
%               Bisection Method)
%           2 : Prints the number of times the method function
%               is called and an estimated min value of the function f
%               depending on the final value of the range we're searching
%               the min value in
%           3 : Prints the graphs of the values of the upper and lower 
%               limits of the range for every iteration 
%
% method = 
%           1 : Bisection Method
%           2 : Golden Section Method
%           3 : Fibonacci Search Method
%           4 : Bisection Method with the use of derivatives

function method_plots(a,b,f,lconst,dconst,method,index)
    PlotArrayA = zeros([], 1);
    PlotArrayB = zeros([], 1);
    iteration = 1;
    if index == 1
        for d = 1e-5 : 1e-5 : 4.5*100e-5
            [k, minvalue] = choosemethod(a,b,f,lconst,d,method);
            PlotArrayA(iteration,1) = d;
            PlotArrayA(iteration,2) = k;
            PlotArrayB(iteration,1) = d;
            PlotArrayB(iteration,2) = minvalue;
            iteration = iteration + 1;
        end
        figure("Name","Iterations per d")
        plot(PlotArrayA(:,1),PlotArrayA(:,2))
        title("Iterations per d for function with index:",f)
        xlabel('d')
        ylabel('Iterations')
        figure("Name","Estimated min value per d")
        plot(PlotArrayB(:,1),PlotArrayB(:,2))
        title("Estimated min value per d for function with index:",f)
        xlabel('d')
        ylabel('Estimated Min Value')
    elseif index == 2
        for l = 2.5*1e-3 : 1e-3 : 3*100e-3
            [k, minvalue] = choosemethod(a,b,f,l,dconst,method);
            PlotArrayA(iteration,1) = l;
            PlotArrayA(iteration,2) = k;
            PlotArrayB(iteration,1) = l;
            PlotArrayB(iteration,2) = minvalue;
            iteration = iteration + 1;
        end
        figure("Name","Iterations per l")
        plot(PlotArrayA(:,1),PlotArrayA(:,2))
        title("Iterations per l for function with index:",f)
        xlabel('l')
        ylabel('Iterations') 
        figure("Name","Estimated min value per l")
        plot(PlotArrayB(:,1),PlotArrayB(:,2))
        title("Estimated min value per l for function with index:",f)
        xlabel('l')
        ylabel('Estimated Min Value')
    elseif index == 3 
        l = [2.1*1e-3 10e-3 25*1e-3 50*1e-3 75*1e-3 100e-3];
        for i=1:size(l,2)
            [k, minvalue, limits] = choosemethod(a,b,f,l(1,i),dconst, ...
                method);
            figure("Name","Limits per k iteration")
            plot(limits(:,1))
            hold on
            plot(limits(:,2))
            title("Limits per k iteration for function with index:",f)
            xlabel('k')
            ylabel('Limits')
        end
    end
end