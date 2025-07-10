function fd_table = forward_diff_table(f_values)
    % This function computes the forward finite differences table.
    % f_values - vector of function values at equidistant nodes.
    % fd_table - table of forward finite differences.

    n = length(f_values);
    fd_table = zeros(n, n); % Initialize the table
    fd_table(:, 1) = f_values(:); % First column is the function values

    % Compute forward differences
    for j = 2:n
        for i = 1:(n-j+1)
            fd_table(i, j) = fd_table(i+1, j-1) - fd_table(i, j-1);
        end
    end
end
