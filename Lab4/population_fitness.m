function [fitness] = population_fitness(population, c, a, t)
    T = @(x_i, c_i, a_i, t_i) t_i + a_i*(x_i / (1-(x_i*0.7)/(c_i)));

    function [fit] = fitness_func(x)
        fit = 0;
        for i = 1:length(x)
            fit = fit + x(i) * T(x(i), c(i), a(i), t(i));
        end
    end

    fitness_result = zeros(size(population, 1), 1);
    for j = 1:size(population, 1)
        fitness_result(j) = 1/fitness_func(population(j,:));
    end
    fitness = fitness_result;
end