function x = gaussian_elimination_pivoting(A, b)
    n = length(b);
    Aug = [A b];

    for k = 1:n-1
        [~, max_row] = max(abs(Aug(k:n, k)));
        max_row = max_row + k - 1;

        if max_row ~= k
            temp = Aug(k, :);
            Aug(k, :) = Aug(max_row, :);
            Aug(max_row, :) = temp;
        end

        for i = k+1:n
            m =  - Aug(i, k) / Aug(k, k);
            Aug(i, k:end) = Aug(i, k:end) + m * Aug(k, k:end);
        end
    end

    U = Aug(:, 1:n);
    b_new = Aug(:, end);

    x = back_substitution(U, b_new);
end
