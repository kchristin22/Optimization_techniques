function [best_fit, fit_value] = transportation_problem_ga(A, c, a, t, V, max_iter)

    %% Initialization of the population
    pop_size = 300;
    population = populationInitialization(A, c, V, pop_size);
    fitness = (population_fitness(population, c, a, t));

    %% Main loop
    for i = 1:max_iter
        % breeding
        population = convex_cross(population, pop_size, fitness);

        % Mutation
        % children = mutation(children, pop_size);

        % Fitness
        fitness = (population_fitness(population, c, a, t));
    end

    %% Best fit
    [fit_value, best_fit_index] = max(fitness);
    best_fit = population(best_fit_index, :);
end