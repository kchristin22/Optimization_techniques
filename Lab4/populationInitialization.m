function initial_population = populationInitialization(adjacency,c,V,pop_size)

    initial_population = zeros(pop_size,17);
    rows = size(adjacency,1); % no. of rows/vertices
    cols = size(adjacency,2); % no. of rows/vertices
    for current_size=1:pop_size
        x = zeros(1,cols); % matrix that stores the xi var on the i position of the matrix
        index = 0;         % saves no. of edges examined at each iteration(row)
        for i=1:rows
            edges = 1;
            if (i == 1)
                upper = V; % V = 100
            else 
                upper = 0;
                for column=1:cols
                    if (adjacency(i,column)==1) % find edges that end to this node
                        upper = upper + x(column);
                    end
                end
            end
            for j=1:cols
                if (adjacency(i,j)==-1) % find edges that start from this node
                    edges = edges + 1;
                end
            end
            tempUpper = upper;
            while (upper>1e-3)
                upper = tempUpper;
                if (edges==2) 
                    x(index + 1) = upper;
                    break;
              
                end
                for k=1:(edges-1)
                    range = min(upper,c(index+k)); 
                    x(index + k) = (range-range/3)* rand(1,1) + range/3; % range [min(xi,c)/2,min(xi,c)], we take advantage of the ordered edges per depth for the index of the c matrix
                    upper = upper - x(index + k);
                end
            end
            index = index + edges-1; % set the index for the matrices x,c for the next iteration(row)
        end
        initial_population(current_size,:) = x; 
    end

end