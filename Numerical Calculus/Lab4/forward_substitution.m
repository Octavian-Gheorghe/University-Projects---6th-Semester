function x = forward_substitution(U, b)
    n = length(b);
    x = zeros(n, 1);

    for i = 1:n
        x(i) = (b(i) - U(i, 1:i-1) * x(1:i-1)) / U(i, i);
    end
end
