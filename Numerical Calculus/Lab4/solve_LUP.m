function x = solve_LUP(A, b)
    [L, U, P] = LUP_decomposition(A);

    b_permuted = P * b;

    y = forward_substitution(L, b_permuted);

    x = back_substitution(U, y);
end
