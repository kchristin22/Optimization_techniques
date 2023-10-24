function [offspring, n_out] = convex_cross(parents, n_out, parents_fitness)
    % picked from the parents with probability proportional to their fitness
    % parents_fitness is a vector of fitness values
    % n_in is the number of parents
    % n_out is the number of offspring
    % offspring is a matrix of offspring

    % number of offspring
    % initialize offspring
    offspring = zeros(size(parents));

    % children are convex combinations of two parents
    % half the children are of parents picked with probability proportional to their fitness
    for i = 1:round(n_out/2)
        % pick parents
        parents_idx = randsample(n_out, 2, true, parents_fitness);
        % pick weights
        weights = rand(2, 1);
        weights = weights / sum(weights);
        % compute convex combination
        offspring(i, :) = weights(1) * parents(parents_idx(1), :) + ...
            weights(2) * parents(parents_idx(2), :);
    end

    % the other half of the children are of parents picked uniformly at random
    for i = round(n_out/2)+1:n_out
        % pick parents
        parents_idx = randsample(n_out, 2, false);
        % pick weights
        weights = rand(2, 1);
        weights = weights / sum(weights);
        % compute convex combination
        offspring(i, :) = weights(1) * parents(parents_idx(1), :) + ...
            weights(2) * parents(parents_idx(2), :);
    end

end
