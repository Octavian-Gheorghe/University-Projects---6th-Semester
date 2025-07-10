function I = romberg (f, a, b, error, nmax)
  R = zeros (nmax, nmax);
  n = 2 ^ (1-1)
  h = (b - a)/n;
  R (1, 1) = h/2 * (f (a) + f (b));
  for k = 2:nmax
    h /= 2;
    interval = 2^(k-2)
    sum = 0;
    for i = 1:interval
      x = a + ( 2 * i - 1 ) * h;
      sum += f(x);
    endfor
    sum *= h;
    R (k, 1) = 1/2 * R(k-1,1) + sum;

    for j = 2:k
      R (k, j) = (4^(j-1) * R (k,j-1) - R (k-1, j-1)) / (4^(j-1)-1);
    endfor

    if abs (R(k-1,k-1) - R(k,k)) < error
      I = R (k, k);
      return;
    endif
  endfor
  I = R (nmax, nmax);
endfunction
