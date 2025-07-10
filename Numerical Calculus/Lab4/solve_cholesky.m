function x = solve_cholesky(A, b)
    R = cholesky_decomposition(A);

    y = forward_substitution(R, b);

    x = back_substitution(R', y);
end
