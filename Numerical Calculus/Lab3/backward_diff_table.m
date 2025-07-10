function bd_table = backward_diff_table(f_values)
    % This function computes the backward finite differences table.
    % f_values - vector of function values at equidistant nodes.
    % bd_table - table of backward finite differences.

    n = length(f_values);
    bd_table = zeros(n, n); % Initialize the table
    bd_table(:, 1) = f_values(:); % First column is the function values

    % Compute backward differences
    for j = 2:n
        for i = n:-1:j
            bd_table(i, j) = bd_table(i, j-1) - bd_table(i-1, j-1);
        end
    end
end
