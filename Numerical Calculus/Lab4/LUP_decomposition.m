function [L, U, P] = LUP_decomposition(A)
    n = size(A, 1);
    P = eye(n);
    L = eye(n);
    U = A;

    for k = 1:n-1
        [~, max_row] = max(abs(U(k:n, k)));
        max_row = max_row + k - 1;

        if max_row ~= k
            U([k, max_row], :) = U([max_row, k], :);
            P([k, max_row], :) = P([max_row, k], :);
            if k > 1
                L([k, max_row], 1:k-1) = L([max_row, k], 1:k-1);
            end
        end

        for i = k+1:n
            L(i, k) = U(i, k) / U(k, k);
            U(i, k:end) = U(i, k:end) - L(i, k) * U(k, k:end);
        end
    end
end

