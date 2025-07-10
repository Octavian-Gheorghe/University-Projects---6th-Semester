function A = lagrangeAitken(x0, f0, x)
dd_table = divided_differences_single(x0, f0);
A = zeros(size(x));
for k = 1 : length(x)
  n = length(x0);
  Pm = zeros(n, n);
  Pm(:, 1)  = f0';


  for i = 2 : n
    for j = 2 : i
      f = ( 1 / ( x0(i) - x0(i-j+1) ) );
      M = [x(k) - x0(i-j+1), Pm(i-1, j-1) ; x(k) - x0(i), Pm(i, j-1)];
      d = det(M);
      Pm(i, j) = ( 1 / ( x0(i) - x0(i-j+1) ) ) * d;

    endfor
  endfor

  A(k) = Pm(n, n);
endfor

end
