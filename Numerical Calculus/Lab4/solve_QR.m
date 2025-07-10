function x = solve_QR(A, b)
    [Q, R] = qr_decomposition(A);

    b_tilde = Q' * b;

    x = back_substitution(R, b_tilde);
end

