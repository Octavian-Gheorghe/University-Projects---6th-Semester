function [x, nit] = solve_jacobi(A, b, x_0, err, maxnit)
  n = length(b);
  D = diag(diag(A));
  M = D;
  N = M - A;
  c = inv(M) * b;
  T = inv(M) * N;
  normT = norm(T, inf);
  x_0 = x_0';
  for k = 1 : maxnit
    x = T * x_0 + c;
    if norm(x - x_0, inf)  <= (1 - normT) / normT * err
      nit = k;
      return;
    endif
    x_0 = x;
  endfor
  error("Too many attempts were made");
end

