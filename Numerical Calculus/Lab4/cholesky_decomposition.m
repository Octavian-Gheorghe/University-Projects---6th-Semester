function R = cholesky_decomposition(A)
    n = size(A, 1);
    R = zeros(n, n);

    for j = 1:n
        sum_diag = 0;
        for k = 1:j-1
            sum_diag = sum_diag + R(j,k)^2;
        end
        R(j,j) = sqrt(A(j,j) - sum_diag);

        for i = j+1:n
            sum_offdiag = 0;
            for k = 1:j-1
                sum_offdiag = sum_offdiag + R(i,k) * R(j,k);
            end
            R(i,j) = (A(i,j) - sum_offdiag) / R(j,j);
        end
    end
end
